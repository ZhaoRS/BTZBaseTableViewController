//
//  BTZTestTableViewController.m
//  OrangeStage
//
//  Created by Rathen on 2018/6/11.
//  Copyright © 2018年 com.3wchina. All rights reserved.
//

#import "BTZTestTableViewController.h"
#import "BTZTestItem.h"
#import "UIViewController+BaseTableContorller.h"

@interface BTZTestTableViewController ()

@end

@implementation BTZTestTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self loadTableView];
    [self loadTbDataArray];
    [self loadNewData];
//    [self setLoadMore];
//    [self setMJRefresh];
//    [self getErrorViewType:BTZErrorViewTypeCoupon frame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    

}

//- (NSString *)getTableRequestUrl {
//    return @"这里填写网络请求的URL";
//}
//
//- (NSDictionary *)getTableRequestParamer {
//    //这里填写参数
//    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
//    [dict setValue:@(self.currentPage) forKey:@"currentPage"];
//    [dict setValue:@(self.pageSize) forKey:@"pageSize"];
//    [dict setValue:@2 forKey:@"type"];
//    return dict;
//}

- (void)loadNewData {
    //1.loading
    //2.调用这个方法
//    [self loadNewDataWithRequest:^(NSString *url, NSDictionary *parameters) {
//        __weak typeof(self) weakSelf = self;
//        //这里使用网络请求
////        [HSHTTPClient request:POST URLString:url parameters:parameters success:^(id json) {
////            NSString *code = json[@"code"];
////            NSString *msg = json[@"msg"];
////            NSDictionary *result = json[@"result"];
////            if (code.intValue == 100000) {
////                NSArray *array = [result objectForKey:@"data"];
////                if (array.count > 0) {
////                    NSArray *dataArray = [BTZTestItem mj_objectArrayWithKeyValuesArray:[result objectForKey:@"data"]];
////                    [weakSelf serviceWithResult:dataArray operation:nil];
////                }
////
////            }else {
////
////            }
////
////
////        } failure:^(NSError *error) {
////            [self serviceFailedWithError:error operation:nil];
////        }];
//        NSMutableArray *array = [[NSMutableArray alloc] init];
//        for (int i = 0; i< 10; i ++) {
//            BTZTestItem *item = [[BTZTestItem alloc] init];
//            if (i % 2 == 0) {
//                item.type = 1;
//            } else {
//                item.type = 2;
//            }
//
//            [array addObject:item];
//        }
//        [weakSelf serviceWithResult:array operation:nil];
//
//    }];
    
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (int i = 0; i< 10; i ++) {
        BTZTestItem *item = [[BTZTestItem alloc] init];
        if (i % 2 == 0) {
            item.type = 1;
        } else {
            item.type = 2;
        }
        
        [self.tbDataArray addObject:item];
    }
    [self.mainTbaleView reloadData];
    

    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}






@end
