//
//  NormalItemCell.m
//  IntegralDog
//
//  Created by Hanen 3G 01 on 16/1/21.
//  Copyright © 2016年 hanen. All rights reserved.
//

#import "NormalItemCell.h"
#define KScreenW [UIScreen mainScreen].bounds.size.width

@interface NormalItemCell ()
{
    UIView    *_lineView;
    
    UIImageView *_arrowView;
  
}
@end


@implementation NormalItemCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString * NormalItemCellID = @"normalCellId";
    NormalItemCell *cell = [tableView dequeueReusableCellWithIdentifier:NormalItemCellID];
    if (cell == nil) {
        cell = [[NormalItemCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NormalItemCellID];

        [cell addSubviews];//
    }
    
    return cell;
    
}

- (void)addSubviews
{
    _lineView = [[UIView alloc] init];
    [self addSubview:_lineView];
    _lineView.frame = CGRectMake(0, [NormalItemCell cellHeight] - 1, KScreenW, 1);//不能用self.frame.size.height 会一直使用未返回的cell默认高度 44
    _lineView.backgroundColor = [UIColor colorWithRed:236.0 / 255 green:235.0/255 blue:232.0/255 alpha:1];
    
    _arrowView = [[UIImageView alloc] init];
    [self addSubview:_arrowView];
    CGFloat arrowH = 15;
    CGFloat arrowW = arrowH * 22 / 38;
    _arrowView.frame = CGRectMake(KScreenW - 40, ([NormalItemCell cellHeight] - arrowH) / 2.0f, arrowW, arrowH);
    _arrowView.image = [UIImage imageNamed:@"uc_Jiantou"];
    
}
//用layoutsubviews 可以使用self的高度来设定线的高度， 但是对cell默认的textLabel 和右箭头有影响会消失。。
//- (void)layoutSubviews
//{
//    _lineView.frame = CGRectMake(0, self.frame.size.height - 1, self.frame.size.width, 1);
//    _lineView.backgroundColor = [UIColor colorWithWhite:0.4 alpha:0.8];
//    
//    
//}


+ (CGFloat)cellHeight
{
    return 50;
}

#pragma mark --重写两个方法 保证 线被点击的时候不会消失
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    [super setHighlighted:highlighted animated:YES];
    
    _lineView.backgroundColor = [UIColor colorWithRed:236.0 / 255 green:235.0/255 blue:232.0/255 alpha:1];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:YES];
    _lineView.backgroundColor = [UIColor colorWithRed:236.0 / 255 green:235.0/255 blue:232.0/255 alpha:1];
}

//- (void)awakeFromNib {
//    // Initialization code
//}
//
//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//
//    // Configure the view for the selected state
//}

@end
