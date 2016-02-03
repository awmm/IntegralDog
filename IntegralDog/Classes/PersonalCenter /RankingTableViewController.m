//
//  RankingTableViewController.m
//  IntegralDog
//
//  Created by wmm on 16/1/27.
//  Copyright © 2016年 hanen. All rights reserved.
//

#import "RankingTableViewController.h"
#import "RankingTableViewCell.h"
#import "Macro.h"

@interface RankingTableViewController ()

@property (nonatomic, strong) UILabel *dateLabel;
@property (nonatomic, strong) UISegmentedControl *segment;

@end

@implementation RankingTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"排行榜";
    self.navigationController.navigationBarHidden = NO;
    
//    self.navigationItem.backBarButtonItem.title = @"";
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 15, 15 * 50 / 28)];
    [btn addTarget:self action:@selector(backToView:) forControlEvents:UIControlEventTouchUpInside];
    [btn setImage:[UIImage imageNamed:@"Btn_Nourmal_Jiantou"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"Btn_Push_Jiantou"] forState:UIControlStateSelected];
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = barItem;
    
    NSArray *arr = [[NSArray alloc]initWithObjects:@"日榜",@"周榜",@"月榜",@"总榜", nil];
    _segment = [[UISegmentedControl alloc]initWithItems:arr];
    //在没有设置[segment setApportionsSegmentWidthsByContent:YES]时，每个的宽度按segment的宽度平分
//    segment.frame = CGRectMake(30, 80, kScreenWidth-60, 40);
    _segment.selectedSegmentIndex = 0;
    _segment.tintColor = mainOrangeColor;
    [_segment addTarget:self action:@selector(changeRankView:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_segment];
    
//    UIView *dateView = [[UIView alloc]initWithFrame:CGRectMake(0.0f, 130.0f, kScreenWidth, 40)];
//    dateView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"rank_bgPaihangbeijing"]];
//    
//    UIImageView *dateImgView = [[UIImageView alloc]initWithFrame:CGRectMake(80.0f, 140.0f, kScreenWidth, 30)];
//    dateImgView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"rank_bgPaihangbeijing"]];
//    
//    [self.view addSubview:dateView];
//    
//    [self.view addSubview:dateView];
    
    
    UIImageView *dateView = [UIImageView new];
    dateView.image = [UIImage imageNamed:@"rank_bgPaihangbeijing"];
    [self.view addSubview:dateView];
    
    
    UIImageView *dateImgView = [UIImageView new];
    dateImgView.image = [UIImage imageNamed:@"rank_Shijianjilu"];
    [self.view addSubview:dateImgView];
    
    _dateLabel = [UILabel new];
    _dateLabel.font = [UIFont systemFontOfSize:18];
    _dateLabel.textAlignment = NSTextAlignmentCenter;
    _dateLabel.numberOfLines = 0;
    _dateLabel.lineBreakMode = NSLineBreakByWordWrapping;
    
    NSDate *  senddate=[NSDate date];
    
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    
    [dateformatter setDateFormat:@"YYYY.MM.dd"];
    
    NSString *  locationString=[dateformatter stringFromDate:senddate];
    _dateLabel.text =[NSString stringWithFormat:@"%@  0:00-24:00",locationString];
    _dateLabel.textColor = [UIColor whiteColor];
    _dateLabel.font = [UIFont boldSystemFontOfSize:15];
    [self.view addSubview:_dateLabel];
    
    UITableView *excTableView=[UITableView new];
    excTableView.delegate=self;
    excTableView.dataSource=self;
    excTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.view.userInteractionEnabled = YES;

    [self.view addSubview:excTableView];
    
    for (UIView *view in self.view.subviews) {view.translatesAutoresizingMaskIntoConstraints = NO;}
    NSDictionary *views = NSDictionaryOfVariableBindings(_segment, dateView, dateImgView, _dateLabel,excTableView);
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-84-[_segment(40)]"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-20-[_segment]-20-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:views]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-144-[dateView(40)]"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-0-[dateView]-0-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:views]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-150-[dateImgView(25)]-60-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-100-[dateImgView(20)]"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-150-[_dateLabel(25)]"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-130-[_dateLabel]"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-200-[excTableView]-0-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-0-[excTableView]-0-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:views]];
}

- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = NO;
    self.tabBarController.hidesBottomBarWhenPushed = YES;
}

//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        self.hidesBottomBarWhenPushed=YES;
//    }
//    return self;
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 8;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 90;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"RankingTableViewCell";
    RankingTableViewCell *cell = (RankingTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[RankingTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.rankNumLab.text = [NSString stringWithFormat: @"%ld", (long)(indexPath.row+1)];
    cell.rankNameLab.text = @"小饼干";
    cell.rankIntegralLab.text = @"5000";
    cell.rankHeaderView.image = [UIImage imageNamed:[NSString stringWithFormat:@"rank_header%ld",(long)(indexPath.row+1)]];
    if (indexPath.row == 0) {
        cell.rankNumLab.text = @"NO.1";
        cell.rankNameLab.text = @"小鹿";
        cell.rankNumImgView.image = [UIImage imageNamed:@"rank_Bangshou"];
        cell.rankIntegralLab.text = @"8000";
    }
    if (indexPath.row == 1) {
        cell.rankNumLab.text = @"NO.2";
        cell.rankNameLab.text = @"雪儿";
        cell.rankNumImgView.image = [UIImage imageNamed:@"rank_Dier"];
        cell.rankIntegralLab.text = @"7680"; 
    }
    if (indexPath.row == 2) {
        cell.rankNumLab.text = @"NO.3";
        cell.rankNameLab.text = @"羊羊羊";
        cell.rankNumImgView.image = [UIImage imageNamed:@"rank_Disan"];
        cell.rankIntegralLab.text = @"7680";
    }


    
    return cell;
}

-(void)changeRankView:(UISegmentedControl *)control{
    if (_segment.selectedSegmentIndex == 0) {

        NSLog(@"111");
    }else if(_segment.selectedSegmentIndex == 1){

    }else if(_segment.selectedSegmentIndex == 2){

    }else if(_segment.selectedSegmentIndex == 3){

    }
}
- (void)viewWillDisappear:(BOOL)animated
{
    self.tabBarController.hidesBottomBarWhenPushed = NO;
}


- (void)backToView:(UIButton *)btn
{
    [self.navigationController popViewControllerAnimated:YES];
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
