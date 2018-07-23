//
//  BTZTestXibTableViewCell.h
//  BTZBaseTableViewController
//
//  Created by Rathen on 2018/6/13.
//  Copyright © 2018年 Rathen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BTZBaseTableViewCellProtocol.h"

@interface BTZTestXibTableViewCell : UITableViewCell <BTZBaseTableViewCellProtocol>
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end
