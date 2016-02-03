//
//  IntegralMainViewCell.m
//  IntegralDog
//
//  Created by Hanen 3G 01 on 16/1/25.
//  Copyright © 2016年 hanen. All rights reserved.
//

#import "IntegralMainViewCell.h"


static NSString * celId = @"IntegralMainViewCellID";
@implementation IntegralMainViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    IntegralMainViewCell *cell = [tableView dequeueReusableCellWithIdentifier:celId];
    if (!cell) {
        cell = [[IntegralMainViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:celId];
        [cell addSubviews];
    }
    
    return cell;
}


- (void)addSubviews
{
    
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
