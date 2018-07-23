//
//  UIViewController+BaseTableContorller.m
//  BTZBaseTableViewController
//
//  Created by Rathen on 2018/6/22.
//  Copyright © 2018年 Rathen. All rights reserved.
//

#import "UIViewController+BaseTableContorller.h"
#import <objc/runtime.h>
#import "BTZBaseItemProtocol.h"
#import "BTZBaseTableViewCellProtocol.h"
#import "UIViewController+BaseController.h"

static const void *ktableViewKey = &ktableViewKey;
static const void *kTbDataArray = &kTbDataArray;

@implementation UIViewController (BaseTableContorller)

- (void)setLoadMore {
    [self setLoadMoreScrollView:self.mainTbaleView action:@selector(loadMoreData)];
}

- (void)setMJRefresh {
    [self setMJRefreshScrollView:self.mainTbaleView action:@selector(loadRefreshNewData)];
}

- (void)loadMoreData {
    
}

- (void)loadRefreshNewData {
    
}


#pragma mark -代理方法
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
    
    UITableViewCell<BTZBaseTableViewCellProtocol> *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentification];
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



#pragma mark -数组
- (NSMutableArray *)tbDataArray {
    return objc_getAssociatedObject(self, kTbDataArray);
}

- (void)setTbDataArray:(NSMutableArray *)tbDataArray {
    return objc_setAssociatedObject(self, kTbDataArray, tbDataArray, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark
- (UITableView *)mainTbaleView {
    return objc_getAssociatedObject(self, ktableViewKey);
}

- (void)setMainTbaleView:(UITableView *)mainTbaleView {
    return objc_setAssociatedObject(self, ktableViewKey, mainTbaleView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)loadTableView {
    if (self.mainTbaleView == nil) {
        self.mainTbaleView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
        self.mainTbaleView.delegate = self;
        self.mainTbaleView.dataSource = self;
        [self.view addSubview:self.mainTbaleView];
    }
}

- (void)loadTbDataArray {
    if (self.tbDataArray == nil) {
        self.tbDataArray = [[NSMutableArray alloc] init];
    }
}




@end
