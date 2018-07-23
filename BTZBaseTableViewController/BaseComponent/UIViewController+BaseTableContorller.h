//
//  UIViewController+BaseTableContorller.h
//  BTZBaseTableViewController
//
//  Created by Rathen on 2018/6/22.
//  Copyright © 2018年 Rathen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@interface UIViewController (BaseTableContorller)<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *mainTbaleView;

@property (nonatomic, strong) NSMutableArray *tbDataArray;

- (void)loadTableView;

- (void)loadTbDataArray;

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
