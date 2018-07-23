//
//  BTZTestItem.m
//  OrangeStage
//
//  Created by Rathen on 2018/6/11.
//  Copyright © 2018年 com.3wchina. All rights reserved.
//

#import "BTZTestItem.h"


@implementation BTZTestItem

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.titleStr = @"xib";
        
    }
    return self;
}


- (CGFloat)bt_cellHeight {
    return 100.f;
}

- (NSString *)bt_cellClassName {
    return @"BTZTestXibTableViewCell";
}

- (BOOL)bt_isXIB {
    return YES;
}
@end
