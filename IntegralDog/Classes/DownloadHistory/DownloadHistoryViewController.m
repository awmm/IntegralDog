//
//  DownloadHistoryViewController.m
//  IntegralDog
//
//  Created by HanenDev on 16/1/25.
//  Copyright © 2016年 hanen. All rights reserved.
//

#import "DownloadHistoryViewController.h"
#import "DownloadHistoryCell.h"
#import "Macro.h"

#define SCREENWIDTH self.view.bounds.size.width
#define SCREENHEIGHT self.view.bounds.size.height

@interface DownloadHistoryViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)NSArray *picArr;
@property (nonatomic,strong)NSArray *titleArr;
@property (nonatomic,strong)NSArray *editionArr;
@property (nonatomic,strong)NSArray *countArr;
@end

@implementation DownloadHistoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBarHidden = NO;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.title = @"下载记录";
    UIButton *backBtn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 15, 25)];
    [backBtn setImage:[UIImage imageNamed:@"Btn_Nourmal_Jiantou"] forState:UIControlStateNormal];
    [backBtn setImage:[UIImage imageNamed:@"Btn_Push_Jiantou"] forState:UIControlStateSelected];
    [backBtn addTarget:self action:@selector(goToBack) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:backBtn];
    _picArr = @[@"Btn_Normal_Xiangji_03",@"Btn_Normal_Xiecheng_07",@"Btn_Normal_weixin_10",@"Btn_Normal_Bantang_12",@"Btn_Normal_kugou_14",@"Btn_Normal_In_01"];
    _titleArr = @[@"相机360-动感贴纸，炫酷小视频",@"携程旅行-定酒店机票火车票",@"微信",@"半塘-帮你买到好东西",@"酷狗音乐-《我是歌手》第四季",@"in-超萌贴纸美图相机"];
    _editionArr = @[@"版本9.0.0  134MB",@"版本6.12.4  98.4MB",@"版本87.6.0  134MB",@"版本9.0.0  884MB",@"版本88.6.8  134MB",@"版本8.11.3  112MB"];
    _countArr = @[@"500",@"450",@"360",@"345",@"226",@"186"];
    
    [self createTableView];
    
}
- (void)createTableView{
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREENWIDTH, SCREENHEIGHT - 64) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.rowHeight = 120.0f;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //tableView.scrollEnabled = NO;
    [self.view addSubview:tableView];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return section == 0 ? 4 : 2;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40.0f;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view=[[UIView alloc]init];
    view.backgroundColor = bGGrayColor;
    UIImageView *picView = [[UIImageView alloc]initWithFrame:CGRectMake(15, 10, 20, 20)];
    picView.image = [UIImage imageNamed:@"Btn_Normal_Shijianjilu"];
    [view addSubview:picView];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(30+10, 10, SCREENWIDTH, 20)];
    label.textColor = fontLightGrayColor2;
    label.font = [UIFont systemFontOfSize:14.0f];
    if (section == 0) {
         label.text = @"下载于 2016.01.31";
    }else if (section ==1){
        label.text = @"下载于 2016.02.18";
    }
    
    label.textColor = [UIColor grayColor];
    [view addSubview:label];
    return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"cell";
    DownloadHistoryCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[DownloadHistoryCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.section == 0) {
        cell.imagView.image = [UIImage imageNamed:_picArr[indexPath.row]];
        
        cell.nameLabel.text = _titleArr[indexPath.row];
        
        cell.editionLabel.text = _editionArr[indexPath.row];
        
        cell.updataLabel.text = @"新功能已更新";
        
        cell.picView.image = [UIImage imageNamed:@"Btn_Normal_Jifenganniu"];
        
        cell.countLabel.text = _countArr[indexPath.row];
    }else if (indexPath.section == 1){
        cell.imagView.image = [UIImage imageNamed:_picArr[indexPath.row + 4]];
        
        cell.nameLabel.text = _titleArr[indexPath.row +4];
        
        cell.editionLabel.text = _editionArr[indexPath.row + 4];
        
        cell.updataLabel.text = @"新功能已更新";
        
        cell.picView.image = [UIImage imageNamed:@"Btn_Normal_Jifenganniu"];
        
        cell.countLabel.text = _countArr[indexPath.row + 4];
    }
    
    
    return cell;
}

- (void)goToBack{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillDisappear:(BOOL)animated
{
    self.tabBarController.hidesBottomBarWhenPushed = NO;
}

- (void)viewWillAppear:(BOOL)animated
{
    self.tabBarController.hidesBottomBarWhenPushed = YES;
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
