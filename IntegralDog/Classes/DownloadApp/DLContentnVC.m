//
//  DLContentnVC.m
//  IntegralDog
//
//  Created by User on 16/1/25.
//  Copyright © 2016年 hanen. All rights reserved.
//

#import "DLContentnVC.h"
#import "AppDelegate.h"
#import "Macro.h"

@interface DLContentnVC ()

@end
CGFloat _width;
@implementation DLContentnVC

- (void)viewWillAppear:(BOOL)animated
{
    self.tabBarController.tabBar.hidden = YES;
    self.tabBarController.hidesBottomBarWhenPushed = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
     _width = [[[NSUserDefaults standardUserDefaults] objectForKey:@"width"] floatValue];
    self.title = @"应用下载";
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, 0, 10, 20);
    
    [backBtn setImage:[UIImage imageNamed:@"Btn_Nourmal_Jiantou"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(doBack:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = backItem;
    UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake1(20, 65, 90, 90)];
    img.image = [UIImage imageNamed:@"图片.jpg"];
    img.layer.cornerRadius = 10;
    [self.view addSubview:img];
   
    [self addcontent];
   }

- (void)addcontent
{
    
    UILabel *appName = [[UILabel alloc] initWithFrame:CGRectMake2(120, 60, 150, 30)];
    appName.tag = 0;
    appName.text = @"蘑菇街";
    UIButton *downloadButt = [[UIButton alloc] initWithFrame:CGRectMake2(275, 123, 35, 16)];
    [downloadButt setImage:[UIImage imageNamed:@"Btn_Normal_Xiazai"] forState:UIControlStateNormal];
    [self.view addSubview:appName];
    [self.view addSubview:downloadButt];
    
    UILabel *xianlab = [[UILabel alloc] initWithFrame:CGRectMake2(20, 160, 300, 0.5)];
    xianlab.backgroundColor = fontLightGrayColor2;
    xianlab.alpha = 0.5;
    [self.view addSubview:xianlab];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake2(20, 170, 100, 30)];
    label.text = @"下载说明:";
    label.tag = 6;
    UILabel *wanchenglabel = [[UILabel alloc] initWithFrame:CGRectMake2(120, 117, 60, 30)];
    wanchenglabel.text = @"完成下载";
    wanchenglabel.tag = 1;
    wanchenglabel.textColor = fontLightGrayColor;
    UILabel *jianglilabel = [[UILabel alloc] initWithFrame:CGRectMake2(170, 117, 60, 30)];
    jianglilabel.text = @"奖励";
    jianglilabel.tag = 2;
    [label setFont:[UIFont fontWithName:@"Helvetica-Bold" size:16]];
    
    UILabel *content = [[UILabel alloc] initWithFrame:CGRectMake2(20, 175, 280, 120)];
    content.numberOfLines = 0;
    content.textColor = fontLightGrayColor;
    content.tag = 7;
    content.text = @"中国优质的女性购物电商平台，云集上千家款式时尚、风格独特、价格合理的买手店铺。资深时尚买手为8000万女性用户精选当季流行服饰、鞋子、箱包、美妆等潮流商品，网罗全球时尚热门资讯，传授超具个性的搭配技巧。让每个女性轻松享受购物乐趣，令时尚变得触手可及。";
    [self.view addSubview:content];
    [self.view addSubview:label];

    
    UILabel *typeLab = [[UILabel alloc] initWithFrame:CGRectMake2(120, 80, 100, 20)];
    typeLab.text = @"工具";
    typeLab.tag = 3;
    UIImageView *xing1 = [[UIImageView alloc] initWithFrame:CGRectMake2(120, 115, 8, 8)];
    xing1.image = [UIImage imageNamed:@"Btn_Normal_Xingxinga.png"];
    UIImageView *xing2 = [[UIImageView alloc] initWithFrame:CGRectMake2(128, 115, 8, 8)];
    xing2.image = [UIImage imageNamed:@"Btn_Normal_Xingxinga.png"];
    UIImageView *xing3 = [[UIImageView alloc] initWithFrame:CGRectMake2(136, 115, 8, 8)];
    xing3.image = [UIImage imageNamed:@"Btn_Normal_Xingxinga.png"];
    UIImageView *xing4 = [[UIImageView alloc] initWithFrame:CGRectMake2(144, 115, 8, 8)];
    xing4.image = [UIImage imageNamed:@"Btn_Normal_Xingxinga.png"];
    UIImageView *xing5 = [[UIImageView alloc] initWithFrame:CGRectMake2(152, 115, 8, 8)];
    xing5.image = [UIImage imageNamed:@"Btn_Normal_Xingxingb.png"];
    UILabel *DownCount = [[UILabel alloc] initWithFrame:CGRectMake2(165, 112, 100, 14)];
    DownCount.text = @"(剩余下载量3555次)";
    DownCount.tag = 4;
    UIImageView *moneyPic = [[UIImageView alloc] initWithFrame:CGRectMake2(200, 126, 12, 12)];
    moneyPic.image = [UIImage imageNamed:@"Btn_Normal_money"];
    UILabel *jifen = [[UILabel alloc] initWithFrame:CGRectMake2(215, 123, 40, 16)];
    jifen.text = @"1000";
    jifen.tag = 5;
    jifen.textColor = lightOrangeColor;
    DownCount.textColor = fontLightGrayColor;
    typeLab.textColor = fontLightGrayColor;

    [self setFontLabel:wanchenglabel byscale:_width];
    [self setFontLabel:jianglilabel byscale:_width];
    [self setFontLabel:appName byscale:_width];
    [self setFontLabel:typeLab byscale:_width];
    [self setFontLabel:DownCount byscale:_width];
    [self setFontLabel:jifen byscale:_width];
    [self setFontLabel:content byscale:_width];
    
    [self.view addSubview:wanchenglabel];
    [self.view addSubview:jianglilabel];
    [self.view addSubview:typeLab];
    [self.view addSubview:xing1];
    [self.view addSubview:xing2];
    [self.view addSubview:xing3];
    [self.view addSubview:xing4];
    [self.view addSubview:xing5];
    [self.view addSubview:DownCount];
    [self.view addSubview:jifen];
    [self.view addSubview:moneyPic];
    
}

- (void)setFontLabel:(UILabel *)label  byscale:(CGFloat )width
{
    int size;
    if (width == 1) {
        size = 14;
    }
    else  if (width >1&&width <1.29) {
        size = 16;
    }
    else
    {
        size = 18;
    }
    if (label.tag == 0) {
        [label setFont:[UIFont systemFontOfSize:size]];
        
    }
    else
    {
        [label setFont:[UIFont systemFontOfSize:size-4]];
    }
}

- (void)doBack:(UIButton *)butt
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
- (void)viewWillDisappear:(BOOL)animated
{
    self.tabBarController.hidesBottomBarWhenPushed = NO;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

CG_INLINE CGRect
CGRectMake1(CGFloat x,CGFloat y,CGFloat width,CGFloat height)
{
    AppDelegate *app = [UIApplication sharedApplication].delegate;
    return CGRectMake(x * app.autoSizeScaleX, y * app.autoSizeScaleY, width * app.autoSizeScaleX, height * app.autoSizeScaleX);
}
CG_INLINE CGRect
CGRectMake2(CGFloat x,CGFloat y,CGFloat width,CGFloat height)
{
    AppDelegate *app = [UIApplication sharedApplication].delegate;
    return CGRectMake(x * app.autoSizeScaleX, y * app.autoSizeScaleY, width * app.autoSizeScaleX, height * app.autoSizeScaleY);
}


@end
