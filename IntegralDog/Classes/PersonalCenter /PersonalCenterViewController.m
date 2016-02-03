//
//  PersonalCenterViewController.m
//  IntegralDog
//
//  Created by wmm on 16/1/21.
//  Copyright © 2016年 hanen. All rights reserved.
//

#import "PersonalCenterViewController.h"
#import "QRCodeGenerator.h"
#import "Macro.h"
#import "IntegralStoreViewController.h"
#import "ExchangeTableViewController.h"
#import "DownloadHistoryViewController.h"
#import "RankingTableViewController.h"
#import "PCTableViewCell.h"
#import "SettingViewController.h"

@interface PersonalCenterViewController ()

@property (nonatomic, strong) UIImageView *headerImageView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *phoneLabel;

@property (strong , nonatomic) UIImage *qRImage;

@property (nonatomic, strong) UILabel *integralLabel;

@end

@implementation PersonalCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBarHidden = YES;
//    self.navigationItem.backBarButtonItem.title = @"";

    [self initWithViews];
}

- (void)initWithViews
{
    UIImageView *topBgView = [UIImageView new];
    topBgView.image = [UIImage imageNamed:@"uc_Yonghu.png"];
    
    [self.view addSubview:topBgView];
    
    _headerImageView = [UIImageView new];
    _headerImageView.layer.cornerRadius = 5;
    _headerImageView.clipsToBounds = YES;
    _headerImageView.image = [UIImage imageNamed:@"uc_Touxiang.png"];
    [self.view addSubview:_headerImageView];
    
    _nameLabel = [UILabel new];
    _nameLabel.textAlignment = NSTextAlignmentCenter;
    _nameLabel.numberOfLines = 0;
    _nameLabel.lineBreakMode = NSLineBreakByWordWrapping;
    _nameLabel.text = @"Julie";
    _nameLabel.textColor = [UIColor whiteColor];
    _nameLabel.font = [UIFont boldSystemFontOfSize:20];
    [self.view addSubview:_nameLabel];
    
    _phoneLabel = [UILabel new];
    _phoneLabel.textAlignment = NSTextAlignmentCenter;
    _phoneLabel.numberOfLines = 0;
    _phoneLabel.lineBreakMode = NSLineBreakByWordWrapping;
    _phoneLabel.text = @"13636362323";
    _phoneLabel.textColor = [UIColor whiteColor];
    _phoneLabel.font = [UIFont systemFontOfSize:18];
    [self.view addSubview:_phoneLabel];
    
    UIImageView *qRPlusView = [UIImageView new];
    qRPlusView.image = [UIImage imageNamed:@"uc_Jiahao.png"];
    [self.view addSubview:qRPlusView];
    
    
    UIImageView *qRBgView = [UIImageView new];
    qRBgView.image = [UIImage imageNamed:@"uc_Tuoyuan.png"];
    [self.view addSubview:qRBgView];
    
    
    _qRImage = [QRCodeGenerator qrImageForString:@"https://github.com/FyhSky" imageSize:80];
    UIImageView *qRImageView = [UIImageView new];
    [qRImageView setImage:_qRImage];
    [self.view addSubview:qRImageView];
    
    UIButton *moreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    // btn.frame = rect_screen;
//    moreBtn.frame = CGRectMake(kScreenWidth-50, 50, 30, 30);
    [moreBtn setImage:[UIImage imageNamed:@"uc_Shezhi.png"] forState:UIControlStateNormal];
    [moreBtn addTarget:self action:@selector(moreButClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:moreBtn];
    
    
    UITableView *ucTableView=[UITableView new];
    ucTableView.delegate=self;
    ucTableView.dataSource=self;
    ucTableView.separatorStyle = UITableViewCellSelectionStyleNone;
    ucTableView.scrollEnabled =NO;
    
    [self.view addSubview:ucTableView];
    
    for (UIView *view in self.view.subviews) {view.translatesAutoresizingMaskIntoConstraints = NO;}
    NSDictionary *views = NSDictionaryOfVariableBindings(topBgView, _headerImageView, _nameLabel, _phoneLabel, qRPlusView, qRBgView, qRImageView, ucTableView, moreBtn);
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[topBgView(230)]"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-0-[topBgView]-0-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:views]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-50-[_headerImageView(100)]"
                                                                      options:NSLayoutFormatAlignAllCenterX
                                                                      metrics:nil
                                                                        views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"[_headerImageView(100)]"
                                                                      options:NSLayoutFormatAlignAllCenterX
                                                                      metrics:nil
                                                                        views:views]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_headerImageView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
    
    
    
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-170-[_nameLabel]"
                                                                      options:NSLayoutFormatAlignAllCenterX
                                                                      metrics:nil
                                                                        views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"[_nameLabel(150)]"
                                                                      options:NSLayoutFormatAlignAllCenterX
                                                                      metrics:nil
                                                                        views:views]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_nameLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-195-[_phoneLabel]"
                                                                      options:NSLayoutFormatAlignAllCenterX
                                                                      metrics:nil
                                                                        views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"[_phoneLabel(150)]"
                                                                      options:NSLayoutFormatAlignAllCenterX
                                                                      metrics:nil
                                                                        views:views]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_phoneLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
    
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-150-[qRPlusView(10)]"
                                                                      options:NSLayoutFormatAlignAllCenterX
                                                                      metrics:nil
                                                                        views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"[qRPlusView(10)]-78-|"
                                                                      options:NSLayoutFormatAlignAllCenterX
                                                                      metrics:nil
                                                                        views:views]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-150-[qRBgView(60)]"
                                                                      options:NSLayoutFormatAlignAllCenterX
                                                                      metrics:nil
                                                                        views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"[qRBgView(60)]-20-|"
                                                                      options:NSLayoutFormatAlignAllCenterX
                                                                      metrics:nil
                                                                        views:views]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-158-[qRImageView(43)]"
                                                                      options:NSLayoutFormatAlignAllCenterX
                                                                      metrics:nil
                                                                        views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"[qRImageView(43)]-28-|"
                                                                      options:NSLayoutFormatAlignAllCenterX
                                                                      metrics:nil
                                                                        views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-230-[ucTableView(600)]"
                                                                      options:NSLayoutFormatAlignAllCenterX
                                                                      metrics:nil
                                                                        views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[ucTableView]|"
                                                                      options:NSLayoutFormatAlignAllCenterX
                                                                      metrics:nil
                                                                        views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-40-[moreBtn(25)]"
                                                                      options:NSLayoutFormatAlignAllCenterX
                                                                      metrics:nil
                                                                        views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"[moreBtn(25)]-25-|"
                                                                      options:NSLayoutFormatAlignAllCenterX
                                                                      metrics:nil
                                                                        views:views]];
    
}

- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    static NSString *iden=@"cell";
//    UITableViewCell * cell=[tableView dequeueReusableCellWithIdentifier:iden];
//    if (cell==nil)
//    {
//        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:iden];
//    }
    static NSString *CellIdentifier = @"PCTableViewCell";
    PCTableViewCell *cell = (PCTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[PCTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    
//    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    NSLog(@"%ld",(long)indexPath.row);
    
    if(indexPath.section == 0){
        cell.pcImgView.image = [UIImage imageNamed:@"uc_Jifenchoujiang.png"];
        cell.pcNameLab.text = @"积分抽奖";
    }
    if(indexPath.section == 1){
        cell.pcImgView.image = [UIImage imageNamed:@"uc_Jifen.png"];
        cell.pcNameLab.text = @"积分签到";
    }
    if(indexPath.section == 2){
        cell.pcImgView.image = [UIImage imageNamed:@"uc_Paihangbang.png"];
        cell.pcNameLab.text = @"排行榜";
    }
    if(indexPath.section == 3){
        cell.pcImgView.image = [UIImage imageNamed:@"uc_Jilu.png"];
        cell.pcNameLab.text = @"下载记录";
    }
    if(indexPath.section == 4){
        cell.pcImgView.image = [UIImage imageNamed:@"uc_Zhinengkefu.png"];
        cell.pcNameLab.text = @"智能客服";
    }
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(indexPath.section == 0){
        
//        IntegralStoreViewController *vc = [[IntegralStoreViewController alloc] init];
//        vc.IntegralNum = @"10000";
//        [self.navigationController pushViewController:vc animated:YES];
//        NSLog(@"push ");
    }
    if(indexPath.section == 2){
        RankingTableViewController *vc = [[RankingTableViewController alloc] init];
        [self.navigationController pushViewController:vc animated:NO];

    }
    if(indexPath.section == 3){
        DownloadHistoryViewController *vc = [[DownloadHistoryViewController alloc] init];
        [self.navigationController pushViewController:vc animated:NO];

    }

    
}

-(void)moreButClick{
    SettingViewController *vc = [[SettingViewController alloc] init];
    [self.navigationController pushViewController:vc animated:NO];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */


@end
