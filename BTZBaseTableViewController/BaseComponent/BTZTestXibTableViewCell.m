//
//  BTZTestXibTableViewCell.m
//  BTZBaseTableViewController
//
//  Created by Rathen on 2018/6/13.
//  Copyright © 2018年 Rathen. All rights reserved.
//

#import "BTZTestXibTableViewCell.h"
#import "BTZTestItem.h"

@implementation BTZTestXibTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)updateCell:(BTZTestItem *)item {
    self.titleLabel.text = item.titleStr;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}

@end
