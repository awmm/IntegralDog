//
//  HeaderView.m
//  IntegralDog
//
//  Created by Hanen 3G 01 on 16/1/25.
//  Copyright © 2016年 hanen. All rights reserved.
//

#import "HeaderView.h"
#import "SDCycleScrollView.h"
#import "ImageTextButton.h"
#import "Macro.h"
#define KScreenW [UIScreen mainScreen].bounds.size.width
#define KScreenH [UIScreen mainScreen].bounds.size.height

@interface HeaderView ()
{
    CGFloat  _lastY;
}
//数据源数组
@property (nonatomic, strong) NSMutableArray  *headImageArr;//头部广告
@property (nonatomic, strong) NSMutableArray  *headBtnTitleArr;//积分 兑换原则 兑换记录
@property (nonatomic, strong) NSMutableArray  *headBtnImageArr;
@end

@implementation HeaderView
- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.IntegralNum = [NSString stringWithFormat:@"%d",1000];
        self.backgroundColor = [UIColor colorWithRed:236.0 / 255 green:235.0/255 blue:232.0/255 alpha:1];
        [self addSubviews];
        
    }
    return self;
}
#pragma mark --lazyload
- (NSMutableArray *)headImageArr
{
    if (_headImageArr == nil) {
        _headImageArr = [NSMutableArray arrayWithArray:@[[UIImage imageNamed:@"Btn_Normal_Jifenjianainhua"],[UIImage imageNamed:@"Btn_Normal_Jifenjianainhua"],[UIImage imageNamed:@"Btn_Normal_Jifenjianainhua"],[UIImage imageNamed:@"Btn_Normal_Jifenjianainhua"],[UIImage imageNamed:@"Btn_Normal_Jifenjianainhua"],[UIImage imageNamed:@"Btn_Normal_Jifenjianainhua"]]];
    }
    
    return _headImageArr;
}
- (NSMutableArray *)headBtnTitleArr
{
    if (_headBtnTitleArr == nil) {
        _headBtnTitleArr = [NSMutableArray arrayWithObjects:@"积分",@"兑换记录",@"兑换原则", nil];
    }
    
    return _headBtnTitleArr;
}

- (NSMutableArray *)headBtnImageArr
{
    if (!_headBtnImageArr) {
        _headBtnImageArr = [NSMutableArray arrayWithArray:@[@"Btn_Normal_Jifen",@"Btn_Normal_Jilu",@"Btn_Normal_Guize"]];
    }
    return _headBtnImageArr;
}
- (void)addSubviews
{
    
    //    _headView.backgroundColor = [UIColor lightGrayColor];
    CGFloat btnSapce = 0.4;
    CGFloat btnW = (KScreenW - btnSapce * 2) / 3.0f;
    CGFloat btnH = 60;
    SDCycleScrollView *headScrollView = [[SDCycleScrollView alloc] initWithFrame:CGRectMake(0, 0, KScreenW, 180)];
    headScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleClassic;
    headScrollView.localizationImagesGroup  = self.headImageArr;
    headScrollView.pageControlDotSize = CGSizeMake(5, 5);
    [self addSubview:headScrollView];
    
    for (int i = 0; i < self.headBtnTitleArr.count; i ++) {
//        NSLog(@"%@",self.headBtnTitleArr[i]);
        ImageTextButton *btn = [[ImageTextButton alloc] initWithFrame:CGRectMake((btnW + btnSapce) * i, CGRectGetMaxY(headScrollView.frame), btnW, btnH)];
        [btn addTarget:self action:@selector(handleBtn:) forControlEvents:UIControlEventTouchUpInside];
                btn.backgroundColor = [UIColor whiteColor];
        if (i == 0) {
            [btn setTitleColor:[UIColor colorWithWhite:0.4 alpha:0.6] forState:UIControlStateNormal];
            NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@%@",self.IntegralNum,self.headBtnTitleArr[i]]];
            
            [attrStr setAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:13.0f]} range:NSMakeRange(0, attrStr.length)];
            [attrStr setAttributes:@{NSForegroundColorAttributeName : [UIColor orangeColor] ,NSFontAttributeName : [UIFont systemFontOfSize:13.0f]} range:NSMakeRange(0, self.IntegralNum.length)];
            
            [btn setAttributedTitle:attrStr forState:UIControlStateNormal];
            
        }else{
            [btn setTitle:self.headBtnTitleArr[i] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor colorWithWhite:0.3 alpha:1] forState:UIControlStateNormal];
            
            btn.titleLabel.font = [UIFont systemFontOfSize:13.0f];
        }
        btn.titleLabel.textAlignment = NSTextAlignmentCenter;
        if (i == self.headBtnTitleArr.count - 1) {
            _lastY = CGRectGetMaxY(btn.frame);
        }
        [btn setImage:[UIImage imageNamed:self.headBtnImageArr[i]] forState:UIControlStateNormal];
        [self addSubview:btn];
    }
    
    CGFloat vieHeight = 40.0f;
    CGFloat midGrayHeight = 10;
    UIView *vie = [[UIView alloc] initWithFrame:CGRectMake(0, _lastY + midGrayHeight , KScreenW, vieHeight)];
    vie.backgroundColor = [UIColor whiteColor];
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 120,vieHeight)];
    [btn setTitle:@"大家都在兑" forState:UIControlStateNormal];
    [btn setTitleColor:fontDarkGrayColor forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:14.0f];
    btn.imageEdgeInsets = UIEdgeInsetsMake(10, 10, 15, 95);
    btn.titleEdgeInsets = UIEdgeInsetsMake(10, -35, 10, 0);
    ;    [btn setImage:[UIImage imageNamed:@"Btn_Normal_Jiangpin"] forState:UIControlStateNormal];
    [vie addSubview:btn];
//    NSLog(@"%@",NSStringFromCGRect);
    [self addSubview:vie];
//    
//    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(btn.frame) , KScreenW, 0.5)];
//    lineView.backgroundColor = [UIColor colorWithWhite:0.8 alpha:0.5];
//    [vie addSubview:lineView];
    
}

- (void)handleBtn:(UIButton *)btn
{
    if ([btn.titleLabel.text isEqualToString:@"兑换记录"]) {
        if ([self.delegate respondsToSelector:@selector(jumpToOther)]) {
            [self.delegate jumpToOther];
        }
    }
}

+(NSString *)resueIdentifer
{
    return @"collectionHeadId";
}
@end
