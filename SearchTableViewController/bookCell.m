//
//  bookCell.m
//  SearchTableViewController
//
//  Created by admin on 15/7/30.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "bookCell.h"

@implementation bookCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self!=nil) {
        [self.textLabel setTextColor:[UIColor redColor]];
    }
    return self;
}
@end
