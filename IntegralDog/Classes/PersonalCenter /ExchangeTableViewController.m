//
//  ExchangeTableViewController.m
//  IntegralDog
//
//  Created by wmm on 16/1/25.
//  Copyright © 2016年 hanen. All rights reserved.
//

#import "ExchangeTableViewController.h"
#import "Macro.h"
#import "ExchangeTableViewCell.h"

@interface ExchangeTableViewController ()

@property (nonatomic, strong) NSArray *excImageArr;
@property (nonatomic, strong) NSArray *excNameArr;
@property (nonatomic, strong) NSArray *excCodeArr;
@property (nonatomic, strong) NSArray *excValidityArr;
@property (nonatomic, strong) NSArray *excIntegralArr;

@end

@implementation ExchangeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"兑换记录";
    self.navigationController.navigationBarHidden = NO;
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 15, 15 * 50 / 28)];
    [btn addTarget:self action:@selector(backToView:) forControlEvents:UIControlEventTouchUpInside];
    [btn setImage:[UIImage imageNamed:@"Btn_Nourmal_Jiantou"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"Btn_Push_Jiantou"] forState:UIControlStateSelected];
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = barItem;
    
//    UITableView *excTableView=[[UITableView alloc]initWithFrame:CGRectMake(0.0f, 0.0f, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
    UITableView *excTableView=[UITableView new];
    excTableView.delegate=self;
    excTableView.dataSource=self;
    excTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.view.userInteractionEnabled = YES;
    [self.view addSubview:excTableView];
    
    for (UIView *view in self.view.subviews) {view.translatesAutoresizingMaskIntoConstraints = NO;}
    NSDictionary *views = NSDictionaryOfVariableBindings(excTableView);
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[excTableView]-60-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-0-[excTableView]-0-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:views]];
    
    _excImageArr = @[@"int_Hongjiuquan",@"int_Liuliangquan",@"int_Huazhuangpinquan",@"int_Haiwaiyouquan",@"int_Meishiquan",@"int_Hongjiuquan",@"int_Liuliangquan",@"int_Huazhuangpinquan",@"int_Haiwaiyouquan",@"int_Meishiquan"];
    _excNameArr = @[@"138元红酒券",@"10元移动流量券",@"50元化妆品券",@"200元海外游费",@"68元进口美食券",@"138元红酒券",@"10元移动流量券",@"50元化妆品券",@"200元海外游费",@"68元进口美食券"];
    _excCodeArr = @[@"券码:EXY09385",@"券码:EXY09385",@"券码:EXY09385",@"券码:EXY09385",@"券码:EXY09385",@"券码:EXY09385",@"券码:EXY09385",@"券码:EXY09385",@"券码:EXY09385",@"券码:EXY09385"];
    _excValidityArr = @[@"有效期:2016.2.28",@"有效期:2016.2.28",@"有效期:2016.2.28",@"有效期:2016.2.28",@"有效期:2016.2.28",@"有效期:2016.2.28",@"有效期:2016.2.28",@"有效期:2016.2.28",@"有效期:2016.2.28",@"有效期:2016.2.28"];
    _excIntegralArr = @[@"10000",@"8000",@"6800",@"3000",@"3000",@"10000",@"8000",@"6800",@"3000",@"3000"];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = NO;
    self.tabBarController.hidesBottomBarWhenPushed = YES;
}
- (void)viewWillDisappear:(BOOL)animated
{
    self.tabBarController.hidesBottomBarWhenPushed = NO;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 140;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"ExchangeTableViewCell";
    ExchangeTableViewCell *cell = (ExchangeTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[ExchangeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    cell.excImageView.image = [UIImage imageNamed:_excImageArr[indexPath.row]];
    cell.excNameLab.text = _excNameArr[indexPath.row];
    cell.excCodeLab.text = _excCodeArr[indexPath.row];
    cell.excValidityLab.text = _excValidityArr[indexPath.row];
    cell.excIntegralLab.text = _excIntegralArr[indexPath.row];
    
    return cell;
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
