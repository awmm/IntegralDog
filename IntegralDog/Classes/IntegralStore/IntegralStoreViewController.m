//
//  IntegralStoreViewController.m
//  IntegralDog
//
//  Created by Hanen 3G 01 on 16/1/25.
//  Copyright © 2016年 hanen. All rights reserved.
//

#import "IntegralStoreViewController.h"
#import "SDCycleScrollView.h"
#import "ImageTextButton.h"
#import "IntegralMainViewCell.h"
#import "IntegralCollectionViewCell.h"
#import "HeaderView.h"
#import "IntegralModel.h"
#import "ExchangeTableViewController.h"
#import "Macro.h"

#define KScreenW [UIScreen mainScreen].bounds.size.width
#define KScreenH [UIScreen mainScreen].bounds.size.height

@interface IntegralStoreViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,HeaderViewDelegate>
{
    UITableView   *_mainTableView;
    UIView        *_headView;
    
    UICollectionView *_mainColletionView;
    
    
}
//数据源数组
@property (nonatomic, strong) NSMutableArray  *headImageArr;//头部广告
@property (nonatomic, strong) NSMutableArray  *headBtnTitleArr;//积分 兑换原则 兑换记录
@property (nonatomic, strong) NSArray *imageArr;
@property (nonatomic, strong) NSArray *titleArr;
@property (nonatomic, strong) NSArray *subtitleArr;
@end

@implementation IntegralStoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"push");
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBarHidden = NO;
    self.navigationItem.title = @"积分商城";
    
//    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 15, 15 * 50 / 28)];
//    [btn addTarget:self action:@selector(backToView:) forControlEvents:UIControlEventTouchUpInside];
//    [btn setImage:[UIImage imageNamed:@"Btn_Nourmal_Jiantou"] forState:UIControlStateNormal];
//    [btn setImage:[UIImage imageNamed:@"Btn_Push_Jiantou"] forState:UIControlStateSelected];
//    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
//    self.navigationItem.leftBarButtonItem = barItem;
    
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.IntegralNum = [NSString stringWithFormat:@"%d",1000];
//    self.navigationItem.title = @""
    
//    UILabel *titleL = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 40)];
//    titleL.text = @"积分商城";
//    self.navigationItem.titleView = titleL;
//    self.navigationController.navigationBar.topItem.title = @"积分商城";
    
//    self.title = @"积分商城";
//    NSLog(@"%@",self.navigationController.navigationItem.title);
//    [self creatSubView];
    [self addCollectionView];

}


#pragma mark --lazyload
//- (NSMutableArray *)headImageArr
//{
//    if (_headImageArr == nil) {
//        _headImageArr = [NSMutableArray arrayWithArray:@[[UIImage imageNamed:@"1.jpg"],[UIImage imageNamed:@"2.jpg"],[UIImage imageNamed:@"3.jpg"],[UIImage imageNamed:@"4.jpg"],[UIImage imageNamed:@"5.jpg"],[UIImage imageNamed:@"6.jpg"]]];
//    }
//    
//    return _headImageArr;
//}
//- (NSMutableArray *)headBtnTitleArr
//{
//    if (_headBtnTitleArr == nil) {
//        _headBtnTitleArr = [NSMutableArray arrayWithObjects:@"积分",@"兑换记录",@"兑换原则", nil];
//    }
//    
//    return _headBtnTitleArr;
//}
- (NSArray *)imageArr
{
    if (!_imageArr) {
        _imageArr = @[@"Btn_Normal_Hongjiuquan",@"Btn_Normal_Liuliangquan",@"Btn_Normal_Huazhaungpin",@"Btn_Normal_Haiwaiyou",@"Btn_Normal_Meishi",@"Btn_Normal_Gengduo"];
    }
    return _imageArr;
}
- (NSArray *)titleArr
{
    if (!_titleArr) {
        _titleArr = @[@"138元红酒券",@"10元移动流量券",@"50化妆品券",@"200海外旅游费",@"60没事进口券",@"更多积分更多大奖券"];
    }
    return _titleArr;
}
- (NSArray *)subtitleArr
{
    if (!_subtitleArr) {
        _subtitleArr = @[@"法国庄园，红酒的香韵",@"移动4G，快人一步",@"年轻在基因里，一触即发",@"尽情享受，难以忘怀",@"年轻在基因里，一触即发",@"尽情享受，难以忘怀"];
    }
    return _subtitleArr;
}



- (void)addCollectionView
{
    UICollectionViewFlowLayout *folwLayOut = [[UICollectionViewFlowLayout alloc] init];
    folwLayOut.minimumInteritemSpacing = 0.5;//每项
    folwLayOut.minimumLineSpacing = 1;//每行
    
    _mainColletionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, KScreenW, KScreenH - 64 - 49) collectionViewLayout:folwLayOut];
    _mainColletionView.delegate = self;
    _mainColletionView.dataSource = self;
    _mainColletionView.backgroundColor = cellGrayColor;
    [_mainColletionView registerClass:[IntegralCollectionViewCell class] forCellWithReuseIdentifier:[IntegralCollectionViewCell reuseIdentifier]];
    
    [_mainColletionView registerClass:[HeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[HeaderView resueIdentifer]];
    [self.view addSubview:_mainColletionView];
    
}
#pragma mark --创建tableview
//- (void)creatSubView
//{
//    _mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, KScreenW, KScreenH) style:UITableViewStylePlain];
//    _mainTableView.delegate = self;
//    _mainTableView.dataSource = self;
//    [self.view addSubview:_mainTableView];
//    
//    _mainTableView.tableHeaderView = [self getheadView];
//}

- (UIView *)getheadView
{
    UIView *view;
    view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KScreenW, 200)];
    //    _headView.backgroundColor = [UIColor lightGrayColor];
    CGFloat btnW = KScreenW / 3.0f;
    CGFloat btnH = 50;
    SDCycleScrollView *headScrollView = [[SDCycleScrollView alloc] initWithFrame:CGRectMake(0, 0, KScreenW, 200 - btnH)];
    headScrollView.localizationImagesGroup  = self.headImageArr;
    headScrollView.pageControlDotSize = CGSizeMake(5, 5);
    [view addSubview:headScrollView];
    
    for (int i = 0; i < self.headBtnTitleArr.count; i ++) {
        NSLog(@"%@",self.headBtnTitleArr[i]);
        ImageTextButton *btn = [[ImageTextButton alloc] initWithFrame:CGRectMake(btnW * i, _headView.frame.size.height - btnH, btnW, btnH)];
        [btn addTarget:self action:@selector(handleBtn:) forControlEvents:UIControlEventTouchUpInside];
        //        btn.backgroundColor = [UIColor redColor];
        if (i == 0) {
            NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@%@",self.IntegralNum,self.headBtnTitleArr[i]]];
            
            [attrStr setAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:15.0f],NSForegroundColorAttributeName : fontDarkGrayColor} range:NSMakeRange(0, attrStr.length)];
            [attrStr setAttributes:@{NSForegroundColorAttributeName : mainOrangeColor} range:NSMakeRange(0, self.IntegralNum.length)];
            
            [btn setAttributedTitle:attrStr forState:UIControlStateNormal];
            
        }else{
            [btn setTitle:self.headBtnTitleArr[i] forState:UIControlStateNormal];
            [btn setTitleColor:fontDarkGrayColor forState:UIControlStateNormal];
            
            btn.titleLabel.font = [UIFont systemFontOfSize:15.0f];
        }
        btn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [view addSubview:btn];
    }
    return view;
}
- (void)handleBtn:(UIButton *)btn
{
    NSLog(@"%@",btn.currentAttributedTitle);
}

//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    
//    
//    return _headView;
//    
//}
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return 15;
//}
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    return 10;
//}
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    IntegralMainViewCell *cell = [IntegralMainViewCell cellWithTableView:tableView];
//    
//    return cell;
//}

#pragma mark --collectionview
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 6;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    IntegralCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[IntegralCollectionViewCell reuseIdentifier] forIndexPath:indexPath];
    
    IntegralModel *model = [[IntegralModel alloc] init];
    model.title = self.titleArr[indexPath.item];
    model.subTitle = self.subtitleArr[indexPath.item];
    model.imageName = self.imageArr[indexPath.item];
    cell.model = model;
    return cell;
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    //从复用池中取出头部或者尾部视图 kind就会区别是头部还是尾部视图
    HeaderView *myView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:[HeaderView resueIdentifer] forIndexPath:indexPath];
    myView.delegate = self;
    
    //如果myview为空 collectionView会根据注册的类自动创建myView
    return myView;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    //如果垂直滑动 则视图宽度与屏幕一样
    //如果是水平  则视图的高度与屏幕一样// 原设总宽度290 多1 以背景色充当线条分割
    return CGSizeMake(KScreenW, 291);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return  CGSizeMake(KScreenW / 2.0-0.5 ,140);
}

- (void)jumpToOther
{
    ExchangeTableViewController *exchange = [[ExchangeTableViewController alloc] init];
    [self.navigationController pushViewController:exchange animated:YES];
}

- (void)viewWillAppear:(BOOL)animated{
//    self.navigationController.navigationBarHidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)backToView:(UIButton *)btn
{
//    for (UIViewController *controller in self.navigationController.viewControllers) {
//        if ([controller isKindOfClass:[你要跳转到的Controller class]]) {
//            [self.navigationController popToViewController:controller animated:YES];
//        }
//    }
    [self.navigationController popViewControllerAnimated:YES];
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
