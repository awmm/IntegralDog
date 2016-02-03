//
//  SettingViewController.m
//  IntegralDog
//
//  Created by Hanen 3G 01 on 16/1/21.
//  Copyright © 2016年 hanen. All rights reserved.
//

#import "SettingViewController.h"
#import "OutLoginCell.h"
#import "NormalItemCell.h"
#import "AboutUsController.h"
#import "LoginViewController.h"
#import "Macro.h"
#import "TabbarController.h"
#import "AppDelegate.h"

#define KScreenW [UIScreen mainScreen].bounds.size.width
#define KScreenH [UIScreen mainScreen].bounds.size.height


@interface SettingViewController ()<UITableViewDataSource, UITableViewDelegate,OutLoginCellDelegate>
{
    UITableView    *_settingTableView;
    
}

/**
  @brief 设置项数组
 */
@property (nonatomic, strong) NSMutableArray *itemArray;
@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

//       self.tabBarController.hidesBottomBarWhenPushed = YES;
//    _itemArray = [NSMutableArray arrayWithCapacity:0];
    self.navigationController.navigationBarHidden = NO;
    self.navigationItem.title = @"更多";
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 15, 15 * 50 / 28)];
    [btn addTarget:self action:@selector(backToView:) forControlEvents:UIControlEventTouchUpInside];
    [btn setImage:[UIImage imageNamed:@"Btn_Nourmal_Jiantou"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"Btn_Push_Jiantou"] forState:UIControlStateSelected];
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = barItem;
    
    [self initTableView];
}

- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = NO;
 
    self.tabBarController.hidesBottomBarWhenPushed = YES;
//    AppDelegate *delegate  = [UIApplication sharedApplication].delegate;
//    TabbarController *tabVC =  delegate.tabbarController;
//    tabVC.hidesBottomBarWhenPushed = YES;
//
//    //    self.hidesBottomBarWhenPushed = YES;
   
}

- (void)viewWillDisappear:(BOOL)animated
{
    self.tabBarController.hidesBottomBarWhenPushed = NO;
}
#pragma mark --lazyload
- (NSMutableArray *)itemArray
{
    if (_itemArray == nil) {
//        _itemArray = [NSMutableArray arrayWithCapacity:0];
        _itemArray = [NSMutableArray arrayWithArray:@[@[@"关于我们",@"功能介绍"],@[@"版本更新",@"帮助与反馈"],@[@"通知",@"清除缓存"],@[@"退出登录"]]];
    }
    
    return _itemArray;
}
#pragma mark --tableview部分
/**
 *  初始化tableView
 */
- (void)initTableView
{
    
    _settingTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, KScreenW, KScreenH) style:UITableViewStylePlain];
    _settingTableView.delegate = self;
    _settingTableView.dataSource = self;
    _settingTableView.backgroundColor = bGGrayColor;
    
    _settingTableView.scrollEnabled = NO;
    _settingTableView.separatorStyle = UITableViewCellSelectionStyleNone;
    [self.view addSubview:_settingTableView];

}

#pragma makr -- tableview的代理方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//    NSLog(@"%ld",_itemArray.count);
    return self.itemArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
 
    return [self.itemArray[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0 ){
        UITableViewCell *cell = [NormalItemCell cellWithTableView:tableView];
//        NSLog(@"%@",self.itemArray[indexPath.section][indexPath.row]);
        cell.textLabel.text = self.itemArray[indexPath.section][indexPath.row];
        cell.textLabel.textColor = fontGrayColor;
        cell.textLabel.font = [UIFont systemFontOfSize:14.0f];
//        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }else if (indexPath.section == 1){
        UITableViewCell *cell = [NormalItemCell cellWithTableView:tableView];
        cell.textLabel.text = self.itemArray[indexPath.section][indexPath.row];
        cell.textLabel.textColor = fontGrayColor;
        cell.textLabel.font = [UIFont systemFontOfSize:14.0f];
//        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }else if (indexPath.section == 2){
        UITableViewCell *cell = [NormalItemCell cellWithTableView:tableView];
        cell.textLabel.text = self.itemArray[indexPath.section][indexPath.row];
        cell.textLabel.textColor = fontGrayColor;
        cell.textLabel.font = [UIFont systemFontOfSize:14.0f];
        //        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }else if (indexPath.section == _itemArray.count - 1){
        OutLoginCell *cell = [OutLoginCell cellWithTableView:tableView];
        cell.textLabel.text = self.itemArray[indexPath.section][indexPath.row];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor clearColor];
        cell.delegate = self;
//        cell.backgroundColor = [UIColor colorWithWhite:0.8 alpha:0.5];
        return cell;
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if(indexPath.section == 0 && indexPath.row == 0 ){
//        AboutUsController *aboutVC= [[AboutUsController alloc] init];
//        [self.navigationController pushViewController:aboutVC animated:YES];
    }else if ( indexPath.section == 1 && indexPath.row == 0){
        NSString *currentVersion = [[NSBundle mainBundle] infoDictionary][(NSString *)kCFBundleVersionKey];
        //发送请求去appstrore
       NSString * newsVersion = [self getNewsVersionFromStroe];
        
        if (![newsVersion isEqualToString:currentVersion])
            
        {
          
            
        } else {
//            [MBProgressHUD showSuccess:@"暂无新版本" toView:self.view];
        }

    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KScreenW, 10)];
    return view;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    if (indexPath.section != self.itemArray.count - 1) {
        return [NormalItemCell cellHeight];
    }else{
        return [OutLoginCell cellHeight];
    }
    return 44;
}

- (void)clickOutLogin
{
    LoginViewController *loginVC = [[LoginViewController alloc] init];
    [self presentViewController:loginVC animated:YES completion:nil];
}
#pragma mark --从appStroe里获取app的最新版本
- (NSString *)getNewsVersionFromStroe
{
    NSString *newVersion;
//    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] init];
//    
//    [manager POST:@"http://itunes.apple.com/search" parameters:[[NSDictionary alloc] initWithObjectsAndKeys:APP_NAME,@"term",@"software",@"entity",nil] success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
//        //        NSData *data = (NSData *)response;
//        //
//        //        id res = [NSJSONSerializationJSONObjectWithData:data options:NSJSONReadingMutableContainerserror:nil];
//        id res = responseObject;
//        
//        //        NSLog(@"res.class==%@",[res class]);
//        //
//        //        NSLog(@"res == %@",res);
//        //
//        //        NSLog(@"results class == %@",[[res objectForKey:@"results"]class]);
//        
//        NSArray *arr = [res objectForKey:@"results"];
//        
//        for (id config in arr)
//            
//        {
//            
//            NSString *bundle_id = [config valueForKey:@"bundleId"];
//            
//            if ([bundle_id isEqualToString:APP_BUNDLE_IDENTIFIER]) {
//                
//                [MyTool hideHUDFromView:self.view];
//                
//                app_id  = [config valueForKey:@"trackId"];
//                
//                updateURL = [config valueForKey:@"trackViewUrl"];
//                
//                NSString *app_Name = [config valueForKey:@"trackName"];
//                
//                NSString *newVersion = [config valueForKey:@"version"];
//                
//               NSLog(@"app_id == %@,app_Name == %@,version == %@",app_id,app_Name,version);
//                
//                [self checkUpdate:version];
//                
//            } else {
////                [MBProgressHUD showError:@"您安装的是测试版本！" toView:self.view];
//            }
//            
//        }
//    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
//        [MyTool hideHUDFromView:self.view];
//        
////        [MBProgressHUD showError:@"检测失败，当前无网络连接！" toView:self.view];
//    }];
    
    return newVersion;
}

- (void)backToView:(UIButton *)btn
{
    [self.navigationController popViewControllerAnimated:YES];
}


//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
