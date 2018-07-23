//
//  BTZBaseItemProtocol.h
//  BTZBaseTableViewController
//
//  Created by Rathen on 2018/6/22.
//  Copyright © 2018年 Rathen. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BTZBaseItemProtocol <NSObject>


- (NSString *)bt_cellClassName;

- (CGFloat)bt_cellHeight;

- (BOOL)bt_isXIB;

@end
