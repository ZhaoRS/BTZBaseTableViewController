//
//  UIViewController+BaseController.h
//  BTZBaseTableViewController
//
//  Created by Rathen on 2018/6/28.
//  Copyright © 2018年 Rathen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BTZErrorViewTool.h"

typedef void(^BTZBaseTbaleViewControllerRequestBlock)(NSString *url, NSDictionary *parameters);

@interface UIViewController (BaseController)


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

@property (nonatomic, copy) BTZBaseTbaleViewControllerRequestBlock requestBlock;

/**
 *  下拉刷新
 */
- (void)setMJRefreshScrollView:(UIScrollView *)scrollView action:(SEL)action;

/**
 *  上拉加载
 */
- (void)setLoadMoreScrollView:(UIScrollView *)scrollView action:(SEL)action;


@end
