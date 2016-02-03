//
//  TabbarController.m
//  IntegralDog
//
//  Created by User on 16/1/22.
//  Copyright © 2016年 hanen. All rights reserved.
//

#import "TabbarController.h"
#import "CustomButton.h"
#import "AppDelegate.h"
#import "DownLoadVC.h"
#import "PersonalCenterViewController.h"
#import "SettingViewController.h"
#import "IntegralStoreViewController.h"
#import "Macro.h"
#import "BaseNavController.h"
@interface TabbarController ()
{
    UIImageView *_tabBarView;//自定义的覆盖原先的tarbar的控件
    CustomButton * _previousBtn;//记录前一次选中的按钮
    UILabel * _previousLab;
    NSMutableArray *_labArr;
    
}

@end

@implementation TabbarController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        self.view.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    for (UIView* obj in self.tabBar.subviews) {
        if (obj != _tabBarView) {
            [obj removeFromSuperview];
        }
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _tabBarView = [[UIImageView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-60, 320*self.view.frame.size.width/320.0, 60)];
    _tabBarView.userInteractionEnabled = YES;
    _tabBarView.backgroundColor = [UIColor whiteColor];
    _labArr = [[NSMutableArray alloc] init];
    
    [self.view addSubview:_tabBarView];
    DownLoadVC * first = [[DownLoadVC alloc]init];
    BaseNavController * navi1 = [[BaseNavController alloc]initWithRootViewController:first];
    
    IntegralStoreViewController * second = [[IntegralStoreViewController alloc]init];
    BaseNavController * navi2 = [[BaseNavController alloc]initWithRootViewController:second];
    
    PersonalCenterViewController* third = [[PersonalCenterViewController alloc]init];
    BaseNavController * navi3 = [[BaseNavController alloc]initWithRootViewController:third];
    //    SettingViewController *settingController = [[SettingViewController alloc] init];
    //    UINavigationController *nav4 = [[UINavigationController alloc] initWithRootViewController:settingController];
    
    self.viewControllers = [NSArray arrayWithObjects:navi1,navi2,navi3, nil];
    
    [self creatButtonWithNormalName:@"Btn_Normal_Yingyongxizai" andSelectName:@"Btn_Push_Yingyongxiazai" andTitle:@"应用下载" andIndex:0];
    [self creatButtonWithNormalName:@"Btn_Normal_Jifenshangcheng" andSelectName:@"Btn_Push_Jifenshangcheng" andTitle:@"积分商城" andIndex:1];
    [self creatButtonWithNormalName:@"Btn_Normal_Gerenzhongxin" andSelectName:@"Btn_Push_Gerenzhongxin" andTitle:@"个人中心" andIndex:2];
    CustomButton * button = _tabBarView.subviews[0];
    [self changeViewController:button];
    
}
-(void)setHidesBottomBarWhenPushed:(BOOL)hidesBottomBarWhenPushed{
    _tabBarView.hidden = hidesBottomBarWhenPushed;
}
#pragma mark 创建广告ScrollView
+ (void)creatScrollViewaddView:(UIView *)view  With:(UIImage *)advertImg Withframe:(CGRect)rect
{
    UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:rect];
    scroll.pagingEnabled =YES;
    scroll.bounces = NO;
    scroll.contentSize = CGSizeMake(scroll.frame.size.width*5, 0);
    
    for (int i = 0; i<5; i++) {
        UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake2(320*i, 0, 320, 40)];
        img.image = advertImg;
        [scroll addSubview:img];
    }
    
    [view addSubview:scroll];
}

#pragma mark 创建一个按钮
- (void)creatButtonWithNormalName:(NSString *)normal andSelectName:(NSString *)selected andTitle:(NSString *)title andIndex:(int)index{
    CGFloat buttonW = _tabBarView.frame.size.width / 3;
    CGFloat buttonH = _tabBarView.frame.size.height/2;
    
    UILabel *xianLab = [[UILabel alloc] initWithFrame:CGRectMake1(0, 0, _tabBarView.frame.size.width, 1)];
    xianLab.backgroundColor = [UIColor lightGrayColor];
    [_tabBarView addSubview:xianLab];
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake1(100 * index, 45, buttonW, 10)];
    lab.text = title;
    lab.textColor = [UIColor lightGrayColor];
    lab.font = [UIFont fontWithName:@"Helvetica-Bold" size:11];
    [_labArr addObject:lab];
    [_tabBarView addSubview:lab];
    CustomButton * customButton = [[CustomButton alloc] init];
    customButton.tag = index;
    customButton.center = CGPointMake(lab.center.x, buttonH);
    customButton.bounds = CGRectMake1(0, 0, 35, 55);
    [customButton setImage:[UIImage imageNamed:normal] forState:UIControlStateNormal];
    
    //这里设置选中状态的图片。
    [customButton setImage:[UIImage imageNamed:selected] forState:UIControlStateSelected];
    
    
    [customButton addTarget:self action:@selector(changeViewController:) forControlEvents:UIControlEventTouchDown];
    lab.textAlignment = NSTextAlignmentCenter;
    
    
    [_tabBarView addSubview:customButton];
    
    if(index == 0)//设置第一个选择项。（默认选择项）
    {
        _previousLab = lab;
        lab.textColor = purpleColor;
        _previousBtn = customButton;
        _previousBtn.selected = YES;
    }
}

#pragma mark 按钮被点击时调用
- (void)changeViewController:(CustomButton *)sender
{
    if(self.selectedIndex != sender.tag){
        self.selectedIndex = sender.tag; //切换不同控制器的界面
        _previousBtn.selected = ! _previousBtn.selected;
        _previousLab.textColor = [UIColor lightGrayColor];
        UILabel *lab = [_labArr objectAtIndex:sender.tag];
        lab.textColor = purpleColor;
        
        _previousLab = lab;
        _previousBtn = sender;
        _previousBtn.selected = YES;
    }
}

CG_INLINE CGRect
CGRectMake1(CGFloat x,CGFloat y,CGFloat width,CGFloat height)
{
    //创建appDelegate 在这不会产生类的对象,(不存在引起循环引用的问题)
    AppDelegate *app = [UIApplication sharedApplication].delegate;
    //计算返回
    return CGRectMake(x * app.autoSizeScaleX, y, width, height);
}
CG_INLINE CGRect
CGRectMake2(CGFloat x,CGFloat y,CGFloat width,CGFloat height)
{
    AppDelegate *app = [UIApplication sharedApplication].delegate;
    return CGRectMake(x * app.autoSizeScaleX, y * app.autoSizeScaleY, width * app.autoSizeScaleX, height * app.autoSizeScaleY);
}

@end
