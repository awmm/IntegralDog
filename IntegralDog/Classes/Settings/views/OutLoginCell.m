//
//  OutLoginCell.m
//  IntegralDog
//
//  Created by Hanen 3G 01 on 16/1/21.
//  Copyright © 2016年 hanen. All rights reserved.
//

#import "OutLoginCell.h"
#define H 50.0f //btn 高度
#define Is375Screen [UIScreen mainScreen].bounds.size.width == 375
#define Is320Screen [UIScreen mainScreen].bounds.size.width == 320
@interface OutLoginCell ()
{
    UIButton   *_outloginBtn;
    
    
}
@end

static NSString *outLoginCellId = @"outLoginCellId";
@implementation OutLoginCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    OutLoginCell *cell = [tableView dequeueReusableCellWithIdentifier:outLoginCellId];
    cell.backgroundColor = [UIColor redColor];
    if (cell == nil) {
        cell = [[OutLoginCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:outLoginCellId];
        
        [cell addSubviews];
    }
    
    return cell;
    
}

- (void)addSubviews
{
    _outloginBtn = [[UIButton alloc] init];
//    [_outloginBtn setTitle:@"退出登录" forState:UIControlStateNormal];
    _outloginBtn.titleLabel.font = [UIFont systemFontOfSize:14.0f];
    _outloginBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [_outloginBtn addTarget:self action:@selector(handleOutLogin:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_outloginBtn];
    
}

- (void)layoutSubviews
{
    _outloginBtn.frame = CGRectMake(50, [OutLoginCell cellHeight] - H, self.frame.size.width - 100, H);
    [_outloginBtn setBackgroundImage:[UIImage imageNamed:@"Btn_Normal_Tuichu"] forState:UIControlStateNormal];
    [_outloginBtn setBackgroundImage:[UIImage imageNamed:@"Btn_Push_Tuichu"] forState:UIControlStateSelected];
//    [_outloginBtn setBackgroundImage:[OutLoginCell getImageWithColor:[UIColor orangeColor] withCGRect:_outloginBtn.bounds] forState:UIControlStateNormal];
}

+(CGFloat)cellHeight
{
    CGFloat cellH;
    if ((Is375Screen)) {
        cellH = 100;
    }else if (Is320Screen){
        cellH = 80;
    }else{
        cellH = 130;
    }
    return  cellH;
}

#pragma mark --退出登录
- (void)handleOutLogin:(UIButton *)btn
{
    NSLog(@"退出登录");
        if ([_delegate respondsToSelector:@selector(clickOutLogin)]) {
            [_delegate clickOutLogin];
        }
   
}

/**
 @brief 传入颜色 返回图片
 */
+ (UIImage *)getImageWithColor:(UIColor *)color withCGRect:(CGRect )rect
{
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context =  UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *ima = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return ima;
}
//- (void)awakeFromNib {
//    // Initialization code
//}
//
//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//
//   
//}

@end
