//
//  IntegralCollectionViewCell.m
//  IntegralDog
//
//  Created by Hanen 3G 01 on 16/1/25.
//  Copyright © 2016年 hanen. All rights reserved.
//

#import "IntegralCollectionViewCell.h"
#import "IntegralModel.h"
#import "Macro.h"

#define IsScreen375 [UIScreen mainScreen].bounds.size.width

@interface IntegralCollectionViewCell ()
{
    //cell标题
    UILabel      *_titleLabel;
    //cell副标题-> 描述
    UILabel      *_subTitleLable;
    //兑换
    UIButton     *_exchangeBtn;
    //图片
    UIImageView  *_imageView;
    //积分图标
    UIImageView  *_integralImage;
    //积分数
    UILabel     *_integralNumber;
}
//@property (nonatomic, strong) NSArray *imageArr;
//@property (nonatomic, strong) NSArray *titleArr;
//@property (nonatomic, strong) NSArray *subtitleArr;

@end

@implementation IntegralCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubviews];
    }
    return self;
}


- (void)addSubviews
{
    _titleLabel = [[UILabel alloc] init];
//    _titleLabel.backgroundColor = [UIColor redColor];
    _titleLabel.textAlignment = NSTextAlignmentLeft;
    _titleLabel.font = [UIFont systemFontOfSize:15.0f];
    [self.contentView addSubview:_titleLabel];
    
    _exchangeBtn = [[UIButton alloc] init];
    [_exchangeBtn setBackgroundImage:[UIImage imageNamed:@"Btn_Normal_Duihuan"] forState:UIControlStateNormal];
//    _exchangeBtn.backgroundColor = [UIColor orangeColor];
//    _exchangeBtn.layer.borderColor = [UIColor orangeColor].CGColor;
//    _exchangeBtn.layer.borderWidth = 0.5;
    
//    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:@"兑换"];
//    [attrStr setAttributes:@{NSForegroundColorAttributeName : [UIColor orangeColor], NSFontAttributeName : [UIFont systemFontOfSize:12.0f]} range:NSMakeRange(0, attrStr.length)];
//    [_exchangeBtn setAttributedTitle:attrStr forState:UIControlStateNormal];
    [self.contentView addSubview:_exchangeBtn];
    
    _subTitleLable = [[UILabel alloc] init];
    _subTitleLable.textAlignment = NSTextAlignmentLeft;
    _subTitleLable.font = [UIFont systemFontOfSize:12.0f];
    _subTitleLable.textColor = fontLightGrayColor;
//    _subTitleLable.backgroundColor = [UIColor orangeColor];
    [self.contentView addSubview:_subTitleLable];
    
    _imageView = [[UIImageView alloc] init];
//    _imageView.backgroundColor = [UIColor greenColor];
    [self.contentView addSubview:_imageView];
    
    _integralImage = [[UIImageView alloc] init];
//    _integralImage.backgroundColor = [UIColor cyanColor];
    [self.contentView addSubview:_integralImage];
    
    _integralNumber = [[UILabel alloc] init];
//    _integralNumber.backgroundColor = [UIColor redColor];
//    NSMutableAttributedString *attr = [NSMutableAttributedString alloc] ini
    [self.contentView addSubview:_integralNumber];
}

- (void)layoutSubviews
{
//    _titleLabel.frame = CGRectMake(10, 10, self.frame.size.width - 90, 20);
//    CGFloat h = 20;
//    CGFloat w = 84 * 20 /44;
//    _exchangeBtn.frame = CGRectMake(CGRectGetMaxX(_titleLabel.frame) + 15, 10, w, h);
//    
//    _subTitleLable.frame = CGRectMake(_titleLabel.frame.origin.x, CGRectGetMaxY(_titleLabel.frame) + 2, self.frame.size.width, 15);
//    
//    _imageView.frame = CGRectMake(_titleLabel.frame.origin.x, CGRectGetMaxY(_subTitleLable.frame) + 3, 100, self.frame.size.height - CGRectGetMaxY(_subTitleLable.frame) - 3 - 5);
//    
//    _integralImage.frame = CGRectMake(CGRectGetMaxX(_imageView.frame) + 5, self.frame.size.height - 20, 15, 15);
//    
//    _integralNumber.frame = CGRectMake(CGRectGetMaxX(_integralImage.frame), _integralImage.frame.origin.y, self.frame.size.width - CGRectGetMaxX(_integralImage.frame), 15);
    
}
- (void)setModel:(IntegralModel *)model
{
    CGFloat allSpace;//上左的距离
    CGFloat someSpace;//积分数字 距离左边
    if (IsScreen375 == 320) {
        allSpace = 3;
        someSpace = 5;
    }else if (IsScreen375 == 375){
        allSpace = 15;
        someSpace = 5;
    }else{
        allSpace = 15;
        someSpace = 30;
    }
    _model = model;
    _titleLabel.text = _model.title;
    CGFloat width = [_model.title boundingRectWithSize:CGSizeMake(MAXFLOAT, 20) options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:15.0f] , NSForegroundColorAttributeName : fontBlackColor} context:nil].size.width;
    NSLog(@"%f",width);
    _titleLabel.frame = CGRectMake(allSpace, allSpace, width, 20);
    //兑换按钮的 比例缩小
    CGFloat h = 15;
    CGFloat w = 84 * h /44;
    _exchangeBtn.frame = CGRectMake(CGRectGetMaxX(_titleLabel.frame) + 3, allSpace + 2, w, h);
    _subTitleLable.frame = CGRectMake(_titleLabel.frame.origin.x, CGRectGetMaxY(_titleLabel.frame) + 2, self.frame.size.width, 15);
    
    _imageView.frame = CGRectMake(_titleLabel.frame.origin.x, CGRectGetMaxY(_subTitleLable.frame) + 3, 100, self.frame.size.height - CGRectGetMaxY(_subTitleLable.frame) - 20);
    
    _integralImage.frame = CGRectMake(CGRectGetMaxX(_imageView.frame) + someSpace, self.frame.size.height - 20, 10, 10);
    
    _integralNumber.frame = CGRectMake(CGRectGetMaxX(_integralImage.frame), _integralImage.frame.origin.y, self.frame.size.width - CGRectGetMaxX(_integralImage.frame), _integralImage.frame.size.height);
    _integralNumber.adjustsFontSizeToFitWidth = YES;
    
    _subTitleLable.text = _model.subTitle;
    _imageView.image = [UIImage imageNamed:_model.imageName];
    
    
    NSMutableAttributedString *integralAttr = [[NSMutableAttributedString alloc] initWithString:@"10000"];
    [integralAttr setAttributes:@{NSForegroundColorAttributeName : mainOrangeColor, NSFontAttributeName : [UIFont systemFontOfSize:13.0f]} range:NSMakeRange(0, [integralAttr length])];
    _integralNumber.attributedText = integralAttr;
    
    _integralImage.image = [UIImage imageNamed:@"Btn_Normal_Jifenganniu"];
}

+(NSString *)reuseIdentifier
{
    return @"IntegralCollectionViewCellId";
}
@end
