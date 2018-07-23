//
//  BTZBaseTbaleViewController.m
//  OrangeStage
//
//  Created by Rathen on 2018/6/11.
//  Copyright © 2018年 com.3wchina. All rights reserved.
//

#import "BTZBaseTbaleViewController.h"
#import "BTZBaseTableViewCell.h"
#import "BTZErrorViewTool.h"
#import "MJRefresh.h"
#import "BTZBaseItemProtocol.h"

@interface BTZBaseTbaleViewController ()<UITableViewDelegate, UITableViewDataSource>



@property (nonatomic, strong) BTZErrorViewTool *errorViewTool;

/**
 重新加载、下拉刷新
 */
@property (nonatomic, assign) BOOL isReloading;

/**
 判断是否正在刷新
 */
@property (nonatomic, assign) BOOL isRefreshLoading;

@property (nonatomic, assign) BOOL isLoadMore;

@property (nonatomic, copy) BTZBaseTbaleViewControllerRequestBlock requestBlock;

@end



@implementation BTZBaseTbaleViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.isTableLoading = NO;
    self.isReloading = NO;
    
    self.currentPage = 1;
    self.pageSize = 10;
    self.isLoadMore = NO;
}

#pragma mark -下拉刷新
- (void)setMJRefresh {
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(RefreshloadNewData)];
    header.lastUpdatedTimeLabel.hidden = YES;
    self.mainTableView.mj_header = header;
}

- (void)RefreshloadNewData {
    self.isRefreshLoading = YES;
    [self loadNewDataWithRequest:self.requestBlock];
}

#pragma mark -上拉加载
- (void)setLoadMore {
    self.mainTableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
}
- (void)loadMoreData
{
    if (!self.isLoadMore) {
        _currentPage++;
        self.isLoadMore = YES;
        [self loadNewDataWithRequest:self.requestBlock];
    }
    
    
}


#pragma mark -NetworkService
- (NSString *)getTableRequestUrl
{
    return nil;
}

- (NSDictionary *)getTableRequestParamer {
    return nil;
}

- (void)loadNewDataWithRequest:(BTZBaseTbaleViewControllerRequestBlock)requestBlock {
    _requestBlock = requestBlock;
    if (!self.isTableLoading && [self getTableRequestUrl]) {
    
        //重新加载
        if (!self.isLoadMore) {//如果不是上拉加载 就设定是 重新加载第一页
            self.isReloading = YES;
        }
        
        self.isTableLoading = YES;
        if (requestBlock && [self getTableRequestUrl] && [self getTableRequestParamer]) {
            requestBlock([self getTableRequestUrl], [self getTableRequestParamer]);
        }
    }
}

#pragma mark -根据list数组的个数来进行操作
- (void)serviceWithResult:(NSArray *)result operation:(NSURLSessionDataTask *)operation
{
    
    self.isTableLoading = NO;
     [self tableEndRefresh];
    if (result) {
        //如果请求下来的数组为0显示错误
        if ([result count] <= 0) {
            [self reloadTableViewData];
            [self showError];
        } else {
            [self refreshTableViewWithDataArray:result];
        }
        
        if (result.count < self.pageSize) {
            [self.mainTableView.mj_footer endRefreshingWithNoMoreData];
            
        }
    } else {
        //如果没有result,刷新tableview
        [self reloadTableViewData];
        //展示空视图并隐藏tableview
        [self showError];
    }
    self.isLoadMore = NO;
}

- (void)reloadTableViewData
{
    if (!self.isLoadMore) {
        [self.tbDataArray removeAllObjects];
    }
    [self.mainTableView reloadData];
}

- (void)serviceFailedWithError:(NSError *)error operation:(NSURLSessionDataTask *)operation
{
    
    if (self.isLoadMore) {//上拉加载出错后 需要--
        self.currentPage--;
        self.isLoadMore = NO;
    }
    self.isTableLoading = NO;
    [self tableEndRefresh];
    [self serviceWithResult:nil operation:operation];
}

- (void)tableEndRefresh {
    [self.mainTableView.mj_header endRefreshing];
    [self.mainTableView.mj_footer endRefreshing];
}

#pragma mark -有数据的时候刷新tableview
- (void)refreshTableViewWithDataArray:(NSArray *)dataArray
{
    [self.errorViewTool hiddenErrorView];
    //有数据的时候显示tableview并隐藏网络等待和空界面
    if (!self.isLoadMore) {
        [self.tbDataArray removeAllObjects];
    }
    [self.tbDataArray addObjectsFromArray:dataArray];
    [self.mainTableView reloadData];
}



- (void)refreshForNetworkError
{
    [self loadNewData];
}

- (void)showError
{
    if ([self.tbDataArray count] <= 0) {
        [self.errorViewTool showErrorView];
    } else {
        [self.errorViewTool hiddenErrorView];
    }
}


- (void)loadNewData {
    
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.tbDataArray count];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSObject<BTZBaseItemProtocol> *item = [self.tbDataArray objectAtIndex:indexPath.row];
    return [item bt_cellHeight];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSObject<BTZBaseItemProtocol> *item = [self.tbDataArray objectAtIndex:indexPath.row];
    NSString *cellIdentification = [item bt_cellClassName];
    
    BTZBaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentification];
    if (!cell) {
        if ([item bt_isXIB]) {//是XIB
            cell = [[[NSBundle mainBundle] loadNibNamed:[item bt_cellClassName] owner:self options:0] objectAtIndex:0];
        } else {//不是XIB
            if (!cellIdentification) {
                return nil;
            }
            Class ModelClass = NSClassFromString(cellIdentification);
            cell = [[ModelClass alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentification];
        }
        
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if ([item conformsToProtocol:@protocol(BTZBaseItemProtocol)]) {
        [cell updateCell:item];
    }
    return cell;
}

- (void)getErrorViewType:(BTZErrorViewType)type frame:(CGRect)frame {
    [self.errorViewTool getErrorViewWithFrame:frame type:type];
}



#pragma mark -懒加载
- (UITableView *)mainTableView {
    
    if (_mainTableView == nil) {
        _mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _mainTableView.backgroundColor = [UIColor clearColor];
        _mainTableView.showsHorizontalScrollIndicator = NO;
        _mainTableView.showsVerticalScrollIndicator = NO;
        [self.view addSubview:_mainTableView];
    }
    return _mainTableView;
    
}

- (NSMutableArray *)tbDataArray {
    if (_tbDataArray == nil) {
        _tbDataArray = [[NSMutableArray alloc] init];
    }
    return _tbDataArray;
}

- (BTZErrorViewTool *)errorViewTool {
    if (_errorViewTool == nil) {
        _errorViewTool = [[BTZErrorViewTool alloc] init];
        __weak typeof(self) weakSelf = self;
        _errorViewTool.clickAction = ^{
            [weakSelf loadNewData];
        };
        [self.mainTableView addSubview:[_errorViewTool getView]];
    }
    return _errorViewTool;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
