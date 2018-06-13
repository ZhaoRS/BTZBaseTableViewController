//
//  BTZBaseTbaleViewController.h
//  OrangeStage
//
//  Created by Rathen on 2018/6/11.
//  Copyright © 2018年 com.3wchina. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BTZErrorViewTool.h"

typedef void(^BTZBaseTbaleViewControllerRequestBlock)(NSString *url, NSDictionary *parameters);

@interface BTZBaseTbaleViewController : UIViewController




@property (nonatomic, strong) UITableView *mainTableView;

/**
 Cell是否为XIB  YES是XIB  NO不是  默认NO
 */
@property (nonatomic, assign) BOOL cellIsXIB;
/**
 数据数组
 */
@property (nonatomic, strong) NSMutableArray *tbDataArray;

/**
 每页多少数据
 */
@property (nonatomic, assign) int pageSize;

/**
 当前第几页
 */
@property (nonatomic, assign) int currentPage;

/**
 tableview正在上啦加载或者下拉刷新
 */
@property (nonatomic, assign) BOOL isTableLoading;

/**
 传入网络请求URL
 */
- (NSString *)getTableRequestUrl;
- (NSDictionary *)getTableRequestParamer;
/**
 *  第一次加载
 */
- (void)loadNewData;

- (void)loadNewDataWithRequest:(BTZBaseTbaleViewControllerRequestBlock)requestBlock;

- (void)getErrorViewType:(BTZErrorViewType)type frame:(CGRect)frame;

/**
 *  下拉刷新
 */
- (void)setMJRefresh;

/**
 *  上拉加载
 */
- (void)setLoadMore;




/**
 网络请求成功传入item数组 刷新tableView

 @param result 成功数据
 @param operation NSURLSessionDataTask
 */
- (void)serviceWithResult:(NSArray *)result operation:(NSURLSessionDataTask *)operation;

- (void)serviceFailedWithError:(NSError *)error operation:(NSURLSessionDataTask *)operation;

@end
