//
//  DownLoadVC.m
//  IntegralDog
//
//  Created by User on 16/1/22.
//  Copyright © 2016年 hanen. All rights reserved.
//

#import "DownLoadVC.h"
#import "AppDelegate.h"
#import "TabbarController.h"
#import "DownloadCell.h"
#import "DLContentnVC.h"
#import "Macro.h"
#define HEIGHT self.view.frame.size.height/480.0
#define WIDTH self.view.frame.size.width/320.0
@interface DownLoadVC ()

@end

UIButton *endButton;
NSMutableArray *_PicArr;
NSMutableArray *_appNameArr;
UIPageControl *_page;
UIScrollView *_scrollView;
int _timeCount;
int _PAGENUM;

@implementation DownLoadVC

- (void)viewWillAppear:(BOOL)animated
{
    self.tabBarController.tabBar.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _PAGENUM = 3;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithFloat:WIDTH] forKey:@"width"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    self.navigationItem.title = @"应用下载";
    _PicArr = [[NSMutableArray alloc] initWithObjects:@"Btn_Normal_Baiduyingyong",@"Btn_Normal_Faceu",@"Btn_Normal_Quanmingkge",@"Btn_Normal_QQyinyue",@"Btn_Normal_Meituantuangou",@"Btn_Normal_Weibo", nil];
    
    _appNameArr = [[NSMutableArray alloc] initWithObjects:@"百度应用 - 百度一下，你就知道",@"Faceu - 激萌的特效相机",@"全民K歌",@"QQ音乐 - 听歌K歌FM电台",@"美团团购 - 团购，电影，美食...",@"微博", nil];\
    [self creatTableView];
    UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake2(0, 0, 320, 20)];
    img.image = [UIImage imageNamed:@"Btn_Normal_Gongxi"];
    
    UIImageView *labaImg = [[UIImageView alloc] init];
    labaImg.center = CGPointMake(37, img.center.y);
    labaImg.bounds = CGRectMake(0, 0, 12*HEIGHT, 12*HEIGHT);
    labaImg.image = [UIImage imageNamed:@"Btn_Normal_Gongxilaba"];
    
    UILabel *lab1 =[[UILabel alloc] init];
    lab1.center = CGPointMake(60*WIDTH, img.center.y);
    lab1.bounds = CGRectMake(0, 0, 29*WIDTH, 14*HEIGHT);
    lab1.text = @"恭喜";
    lab1.textColor = [UIColor whiteColor];
    
    UILabel *lab2 = [[UILabel alloc] init];
    UILabel *name = [[UILabel alloc] init];
    name.center = CGPointMake(lab1.center.x+lab1.frame.size.width/2.0+18, img.center.y);
    name.bounds = CGRectMake(0, 0, 29*WIDTH, 14*HEIGHT);
    name.text = @"小明";

    lab2.center = CGPointMake(name.center.x+name.frame.size.width/2.0+5+91, img.center.y);
    lab2.bounds = CGRectMake(0, 0, 186, 14*HEIGHT);
    lab2.textColor = [UIColor whiteColor];
    lab2.text = @"成功下载百度应用，积分累积到";
    
    UILabel *goal = [[UILabel alloc] init];
    goal.center = CGPointMake(lab2.center.x+lab2.frame.size.width/2.0+8, img.center.y);
    goal.bounds = CGRectMake(0, 0, 29*WIDTH, 14*HEIGHT);
    goal.text = @"300";
    
    [self setFontLabel:name byscale:WIDTH];
    [self setFontLabel:lab1 byscale:WIDTH];
    [self setFontLabel:lab2 byscale:WIDTH];
    [self setFontLabel:goal byscale:WIDTH];
    name.textColor = mainOrangeColor;
    goal.textColor = mainOrangeColor;
    
    [self.view addSubview:img];
    [self.view addSubview:labaImg];
    [self.view addSubview:lab1];
    [self.view addSubview:lab2];
    [self.view addSubview:name];
    [self.view addSubview:goal];
}

- (void)setFontLabel:(UILabel *)label  byscale:(CGFloat )width
{
    int size;
    if (width >1||width <1.29) {
        size = 12;
    }
    else
    {
        size = 14;
    }
    [label setFont:[UIFont fontWithName:@"Helvetica-Bold" size:size]];
}

- (void)creatTableView
{
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake1(0, 20, 320, 100)];
    _scrollView.contentSize = CGSizeMake(_scrollView.frame.size.width*3, 0);
    _scrollView.pagingEnabled =YES;
    _scrollView.bounces = NO;
    _scrollView.showsHorizontalScrollIndicator = FALSE;
    _scrollView.delegate = self;
    
    [self.view addSubview:_scrollView];
    _page = [[UIPageControl alloc] initWithFrame:CGRectMake1(250, 100, 40, 20)];
    _page.numberOfPages = _PAGENUM;
    
    _page.currentPage = 0;
    _timeCount = 0;
    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(scrollTimer) userInfo:nil repeats:YES];
    
    [self.view addSubview:_page];
    
    for (int i = 0 ; i < _PAGENUM; i++) {
        UIImageView *tubiaoImage = [[UIImageView alloc] initWithFrame:CGRectMake2(_scrollView.frame.size.width*i, 0, 320, 100)];
        tubiaoImage.image = [UIImage imageNamed:@"Btn_Normal_Xinchunjifen"];
        [_scrollView addSubview:tubiaoImage];

    }
    UIImageView *xiazai = [[UIImageView alloc] initWithFrame:CGRectMake1(15, 125, 10, 10)];
    xiazai.image = [UIImage imageNamed:@"Btn_Normal_Xiazai2"];
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake1(32, 123, 100, 15)];
    title.text = @"大家都在下载";
    title.textColor = fontLightGrayColor;
    title.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:title];
    [self.view addSubview:xiazai];
    UITableView *tableview = [[UITableView alloc] initWithFrame:CGRectMake2(0, 142*HEIGHT, 320, 350)];
    tableview.delegate = self;
    tableview.dataSource = self;
    tableview.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    //[tableview registerNib:[UINib nibWithNibName:@"DownloadCell" bundle:nil] forCellReuseIdentifier:@"DownloadCell"];
    UILabel *xianlab = [[UILabel alloc] initWithFrame:CGRectMake1(0, 140, 320, 0.5)];
    xianlab.backgroundColor = fontLightGrayColor2;
    [self.view addSubview:tableview];
    [self.view addSubview:xianlab];
    
}

- (void)scrollTimer
{
    NSLog(@"1111");
    _timeCount++;
    if
        (_timeCount == _PAGENUM) {
            _timeCount= 0;
            _scrollView.contentOffset = CGPointMake(0, 0);
            _page.currentPage = 0;
        }
    //[_scrollView scrollRectToVisible:CGRectMake(_timeCount * 320.0*WIDTH, 0, 320.0*WIDTH, 100.0*HEIGHT) animated:YES];
    
    [UIView animateWithDuration:1.0 animations:^{
        [UIView setAnimationRepeatCount:0];
        _scrollView.contentOffset = CGPointMake(_timeCount * 320.0*WIDTH, 0);
    }
    completion:^(BOOL finished) {
                          _page.currentPage = (int)_scrollView.contentOffset.x/_scrollView.frame.size.width;
                     }];
   
}

- (void)ButtonClick:(UIButton *)butt
{
    [endButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [butt setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    endButton = butt;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    _page.currentPage = (int)scrollView.contentOffset.x/_scrollView.frame.size.width;
}
#pragma mark ------------------------UITableView Delegate-----------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _PicArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *str = @"DownloadCell";
     DownloadCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if(cell == nil)
    {
    DownloadCell *cell = [[DownloadCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    
    cell.TitleImage.image = [UIImage imageNamed:[_PicArr objectAtIndex:indexPath.row]];
    cell.AppName.text = [_appNameArr objectAtIndex:indexPath.row];
    return cell;
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 80*self.view.frame.size.height/480.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    DLContentnVC *vc = [[DLContentnVC alloc] init];
    [self.navigationController pushViewController:vc animated:NO];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

CG_INLINE CGRect
CGRectMake1(CGFloat x,CGFloat y,CGFloat width,CGFloat height)
{
    AppDelegate *app = [UIApplication sharedApplication].delegate;
    return CGRectMake(x * app.autoSizeScaleX, y * app.autoSizeScaleY, width * app.autoSizeScaleX, height * app.autoSizeScaleY);
}

CG_INLINE CGRect
CGRectMake2(CGFloat x,CGFloat y,CGFloat width,CGFloat height)
{
    AppDelegate *app = [UIApplication sharedApplication].delegate;
    return CGRectMake(x , y , width * app.autoSizeScaleX, height * app.autoSizeScaleY);
}

@end
