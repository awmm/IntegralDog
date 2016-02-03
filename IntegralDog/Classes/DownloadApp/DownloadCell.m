//
//  DownloadCell.m
//  IntegralDog
//
//  Created by User on 16/1/22.
//  Copyright © 2016年 hanen. All rights reserved.
//

#import "DownloadCell.h"
#import "AppDelegate.h"
#import "Macro.h"
@implementation DownloadCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.clipsToBounds = YES;
        CGFloat width = [[[NSUserDefaults standardUserDefaults] objectForKey:@"width"] floatValue];
        _TitleImage = [[UIImageView alloc] initWithFrame:CGRectMake3(8, 10, 55, 55)];
        _AppName = [[UILabel alloc] initWithFrame:CGRectMake2(72, 8, 227, 21)];
        _AppName.tag = 0;
        _typeLab = [[UILabel alloc] initWithFrame:CGRectMake2(72, 20, 28, 21)];
        _typeLab.text = @"工具";
        _typeLab.tag = 1;
        _xing1 = [[UIImageView alloc] initWithFrame:CGRectMake2(72, 45, 8, 8)];
        _xing1.image = [UIImage imageNamed:@"Btn_Normal_Xingxinga.png"];
        _xing2 = [[UIImageView alloc] initWithFrame:CGRectMake2(81, 45, 8, 8)];
        _xing2.image = [UIImage imageNamed:@"Btn_Normal_Xingxinga.png"];
        _xing3 = [[UIImageView alloc] initWithFrame:CGRectMake2(90, 45, 8, 8)];
        _xing3.image = [UIImage imageNamed:@"Btn_Normal_Xingxinga.png"];
        _xing4 = [[UIImageView alloc] initWithFrame:CGRectMake2(99, 45, 8, 8)];
        _xing4.image = [UIImage imageNamed:@"Btn_Normal_Xingxinga.png"];
        _xing5 = [[UIImageView alloc] initWithFrame:CGRectMake2(108, 45, 8, 8)];
        _xing5.image = [UIImage imageNamed:@"Btn_Normal_Xingxingb.png"];
        _DownCount = [[UILabel alloc] initWithFrame:CGRectMake2(122, 37, 109, 24)];
        _DownCount.text = @"(剩余下载量3555次)";
        _DownCount.tag = 2;
        _jifenBg = [[UIImageView alloc] initWithFrame:CGRectMake2(260, 25, 50, 22)];
        _jifenBg.image = [UIImage imageNamed:@"Btn_Normal_Jifendi.png"];
        _moneyPic = [[UIImageView alloc] initWithFrame:CGRectMake2(268, 33, 7, 7)];
        _moneyPic.image = [UIImage imageNamed:@"Btn_Normal_Jifen 2"];
        _jifen = [[UILabel alloc] initWithFrame:CGRectMake2(277, 31, 35, 11)];
        _jifen.text = @"1000";
        _jifen.tag = 3;
        _jifen.textColor = [UIColor whiteColor];
        _DownCount.textColor = fontLightGrayColor;
        _typeLab.textColor = fontLightGrayColor;
        [self setFontLabel:_AppName byscale:width];
        [self setFontLabel:_typeLab byscale:width];
        [self setFontLabel:_DownCount byscale:width];
        [self setFontLabel:_jifen byscale:width];
        [self.contentView addSubview:self.TitleImage];
        [self.contentView addSubview:self.AppName];
        [self.contentView addSubview:self.typeLab];
        [self.contentView addSubview:self.xing1];
        [self.contentView addSubview:self.xing2];
        [self.contentView addSubview:self.xing3];
        [self.contentView addSubview:self.xing4];
        [self.contentView addSubview:self.xing5];
        [self.contentView addSubview:self.DownCount];
        [self.contentView addSubview:self.jifenBg];
        [self.contentView addSubview:self.jifen];
        [self.contentView addSubview:self.moneyPic];
        
    };
    
    return self;
}

- (void)setFontLabel:(UILabel *)label  byscale:(CGFloat )width
{

    int size;
    if (width == 1) {
        size = 14;
    }
    else if (width >1&&width <1.29) {
        size = 16;
    }
    else
    {
        size = 17;
    }
    if (label.tag == 0) {
        [label setFont:[UIFont systemFontOfSize:size]];

    }
    else
    {
    [label setFont:[UIFont systemFontOfSize:size-4]];
    }
}


CG_INLINE CGRect
CGRectMake2(CGFloat x,CGFloat y,CGFloat width,CGFloat height)
{
    AppDelegate *app = [UIApplication sharedApplication].delegate;
    return CGRectMake(x * app.autoSizeScaleX, y * app.autoSizeScaleY, width * app.autoSizeScaleX, height * app.autoSizeScaleY);
}
CG_INLINE CGRect
CGRectMake3(CGFloat x,CGFloat y,CGFloat width,CGFloat height)
{
    AppDelegate *app = [UIApplication sharedApplication].delegate;
    return CGRectMake(x * app.autoSizeScaleX, y * app.autoSizeScaleY, width * app.autoSizeScaleX, height * app.autoSizeScaleX);
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
