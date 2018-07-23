//
//  UIViewController+BaseController.m
//  BTZBaseTableViewController
//
//  Created by Rathen on 2018/6/28.
//  Copyright © 2018年 Rathen. All rights reserved.
//

#import "UIViewController+BaseController.h"
#import <objc/runtime.h>
#import "MJRefresh.h"

@interface UIViewController ()

@property (nonatomic, strong) BTZErrorViewTool *errorViewTool;

@end

static const void *kErrorViewToolKey = &kErrorViewToolKey;
static const void *kRequestBlocKey = &kRequestBlocKey;

@implementation UIViewController (BaseController)

#pragma mark -网络请求
- (NSString *)getTableRequestUrl {
    return nil;
}


- (NSDictionary *)getTableRequestParamer {
    return nil;
}

- (void)loadNewData {
    
}

- (void)loadNewDataWithRequest:(BTZBaseTbaleViewControllerRequestBlock)requestBlock {
    if (requestBlock && [self getTableRequestUrl] && [self getTableRequestParamer]) {
        self.requestBlock = requestBlock;
        requestBlock([self getTableRequestUrl], [self getTableRequestParamer]);
    }
    
    
}


#pragma mark -刷新
- (void)setMJRefreshScrollView:(UIScrollView *)scrollView action:(SEL)action {
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(action)];
    header.lastUpdatedTimeLabel.hidden = YES;
    scrollView.mj_header = header;
}

- (void)setLoadMoreScrollView:(UIScrollView *)scrollView action:(SEL)action {
    scrollView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(action)];
}

- (BTZBaseTbaleViewControllerRequestBlock)requestBlock {
    return objc_getAssociatedObject(self, kRequestBlocKey);
}

- (void)setRequestBlock:(BTZBaseTbaleViewControllerRequestBlock)requestBlock {
    return objc_setAssociatedObject(self, kRequestBlocKey, requestBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}


#pragma mark - 错误视图
- (BTZErrorViewTool *)errorViewTool {
    return objc_getAssociatedObject(self, kErrorViewToolKey);
}

- (void)setErrorViewTool:(BTZErrorViewTool *)errorViewTool {
    return objc_setAssociatedObject(self, kErrorViewToolKey, errorViewTool, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)loadErrorViewWithType:(BTZErrorViewType)errorType frame:(CGRect)frame refreshAction:(void(^)(BTZErrorViewAtionType actionType))refreshAction{
    if (self.errorViewTool == nil) {
        
        self.errorViewTool = [[BTZErrorViewTool alloc] init];
        [self.errorViewTool getErrorViewWithFrame:frame type:errorType];
        self.errorViewTool.clickAction = ^{
            if (refreshAction) {
                refreshAction(BTZErrorViewAtionTypeGotoPage);
            }
        };
        
        self.errorViewTool.noServiceAction = ^{
            if (refreshAction) {
                refreshAction(BTZErrorViewAtionTypeRefresh);
            }
        };
        [self.view addSubview:[self.errorViewTool getView]];
    }
}



@end
