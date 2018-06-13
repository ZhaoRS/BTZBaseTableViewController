//
//  BTZTestItem.m
//  OrangeStage
//
//  Created by Rathen on 2018/6/11.
//  Copyright © 2018年 com.3wchina. All rights reserved.
//

#import "BTZTestItem.h"

@implementation BTZTestItem

- (void)setType:(int)type {
    switch (type) {
        case 1:
            {
                self.titleStr = @"这是XIB";
                self.cellName = @"BTZTestXibTableViewCell";
                self.cellHeight = 50;
                self.isXibCell = YES;
            }
            break;
        case 2:
        {
            self.titleStr = @"这是纯代码";
            self.cellName = @"BTZTestTableViewCell";
            self.cellHeight = 60;
            self.isXibCell = NO;
        }
            break;
            
        default:
            break;
    }
}

@end
