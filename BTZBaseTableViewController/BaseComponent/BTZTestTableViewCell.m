//
//  BTZTestTableViewCell.m
//  OrangeStage
//
//  Created by Rathen on 2018/6/11.
//  Copyright © 2018年 com.3wchina. All rights reserved.
//

#import "BTZTestTableViewCell.h"
#import "BTZTestItem.h"
@interface BTZTestTableViewCell ()

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation BTZTestTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self creatView];
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}
- (void)creatView {
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    [self.contentView addSubview:self.titleLabel];
    
}
- (void)updateCell:(BTZTestItem *)item {
    self.titleLabel.text = item.titleStr;
}


@end
