//
//  RegisterViewController.m
//  IntegralDog
//
//  Created by Hanen 3G 01 on 16/1/22.
//  Copyright © 2016年 hanen. All rights reserved.
//

#import "RegisterViewController.h"
#import "Macro.h"

#define KscreenW [UIScreen mainScreen].bounds.size.width
#define KScreenH [UIScreen mainScreen].bounds.size.height


@interface RegisterViewController ()<UITextFieldDelegate>
{
    
    UIImageView   *_phoneView;
    UILabel       *_registerLabel;
    //键盘弹出的高度
    CGFloat   _KeyBoardShowHeight;
    CGFloat   _lastViewY;
    int       _countTimer;
    NSTimer  *timer;
    
    //提交注册按钮
    UIButton  *_postRegisteBtn;
    
    NSMutableAttributedString *attrStr;
}

@property (nonatomic, strong) NSArray *titleArr;
@property (nonatomic, strong) NSArray *subTitleArr;
@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *leftBtn = [[UIButton alloc]initWithFrame:CGRectMake(15, 25, 15, 25)];
    [leftBtn setImage:[UIImage imageNamed:@"Btn_Nourmal_Jiantou"] forState:UIControlStateNormal];
    [leftBtn setImage:[UIImage imageNamed:@"Btn_Push_Jiantou"] forState:UIControlStateSelected];
    [leftBtn addTarget:self action:@selector(goToBack:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:leftBtn];
    
   
    [self drawView];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}


#pragma mark--lazyload
- (NSArray *)titleArr
{
    if (_titleArr == nil) {
        _titleArr = [NSArray arrayWithObjects:@"手机号",@"验证码",@"登陆密码",@"确认密码", nil];
    }
    
    return _titleArr;
}
- (NSArray *)subTitleArr
{
    if (_subTitleArr == nil) {
        _subTitleArr = [NSArray arrayWithObjects:@"请输入手机号",@"点击输入验证码",@"6-14位字母、数字和符号",@"再次输入密码", nil];
    }
    return _subTitleArr;
}
#pragma mark --添加视图
/**
 @brief 绘制子视图
 */
- (void)drawView
{
    CGFloat topSpace ;
    CGFloat ImageWidth ;//顶部图标的宽高
    CGFloat registerLabelWidth ;//注册账号标题的宽度
    CGFloat registerLabelHeight;
    CGFloat textfieldWidth;//输入框的宽度
    CGFloat leftSpace;//左右两边空出的位置
    CGFloat RegisterBtn_input_space;
    if(KscreenW == 375){
        RegisterBtn_input_space = 10;
        topSpace = 70;
        ImageWidth = 80;//顶部图标的宽高
        registerLabelWidth = 100;//注册账号标题的宽度
        registerLabelHeight = 40;
        textfieldWidth = 150 +50;//输入框的宽度
        leftSpace = 50;//左右两边空出的位置
    }else{//plus
        RegisterBtn_input_space = 5;
        topSpace = 100;
        ImageWidth = 50;//顶部图标的宽高
        registerLabelWidth = 100;//注册账号标题的宽度
        registerLabelHeight = 30;
        textfieldWidth = 125 +75;//输入框的宽度
        leftSpace = 50;//左右两边空出的位置
    }
   
    
    //顶部图标
    _phoneView = [[UIImageView alloc] initWithFrame:CGRectMake( CGRectGetMidX(self.view.frame) - ImageWidth / 2.0f , topSpace, ImageWidth, ImageWidth)];
    _phoneView.image = [UIImage imageNamed:@"Btn_Normal_zc"];
    _phoneView.layer.cornerRadius = ImageWidth / 2.0;
    _phoneView.layer.masksToBounds = YES;
    _phoneView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:_phoneView];
    
    //注册账号标题
    _registerLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMidX(self.view.frame) - 50 , CGRectGetMaxY(_phoneView.frame) , registerLabelWidth, registerLabelHeight)];
    _registerLabel.text = @"注册账号";
    _registerLabel.textColor = fontDarkGrayColor;
    _registerLabel.textAlignment = NSTextAlignmentCenter;
    _registerLabel.font = [UIFont boldSystemFontOfSize:20.0f];
    [self.view addSubview:_registerLabel];
    
   //前四个label
  
    CGFloat  labelW = 60;
    CGFloat  labelH = 35;
    CGFloat  lineHeight = 1;
    CGFloat  space = 40;
    
    for (int i = 0 ; i < 4; i++) {
        CGFloat  imageW;
        CGFloat  imageH ;
        CGFloat  spac ;
        if (i == 0) {
           imageW = 11;
           imageH = 12;
            spac = 0;
        }else if ( i == 1) {
            imageW = 16;
            imageH = 13;
            spac = 0;
        }else{
            imageW = 14;
            imageH = 12;
            spac = 1;
        }
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(leftSpace, CGRectGetMaxY(_registerLabel.frame) + 20 + 30 + (labelH + space + lineHeight + spac) * i, imageW, imageH + 5)];//加20 。 10 的调整图标位置
//        imageView.backgroundColor = [UIColor redColor];
        NSString *string = [NSString stringWithFormat:@"Btn_Normal_%d",i+1];
        imageView.image = [UIImage imageNamed:string];
        [self.view addSubview:imageView];
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(imageView.frame) +5,CGRectGetMaxY(_registerLabel.frame) + 40 + (labelH + lineHeight + space + 2)* i, labelW, labelH)];
//        titleLabel.backgroundColor = [UIColor redColor];
        titleLabel.textAlignment = NSTextAlignmentLeft;
        titleLabel.text = self.titleArr[i];
        titleLabel.font = [UIFont systemFontOfSize:14.0f];
        titleLabel.textColor = fontLightGrayColor;
        [self.view addSubview:titleLabel];
        
        //给个线
        [self.view addSubview:[self getLineViewWth:CGRectMake(leftSpace, CGRectGetMaxY(titleLabel.frame), KscreenW - leftSpace * 2, lineHeight)]];
        if (i == 3) {
            _lastViewY = CGRectGetMaxY(titleLabel.frame) + lineHeight;
        }
        
        //添加输入框
        CGRect rect;
        if (i != 1) {
           rect  = CGRectMake(CGRectGetMaxX(titleLabel.frame) + 3, titleLabel.frame.origin.y + 1, textfieldWidth, labelH);
        }else{
            rect  = CGRectMake(CGRectGetMaxX(titleLabel.frame) + 3, titleLabel.frame.origin.y + 1, textfieldWidth, labelH);

        }
        UITextField * inputField = [[UITextField alloc] initWithFrame:rect];
        inputField.placeholder = self.subTitleArr[i];
//        inputField.backgroundColor = [UIColor redColor];
        [inputField setValue:[UIFont boldSystemFontOfSize:14] forKeyPath:@"_placeholderLabel.font"];//设置textfield的placeholder文字字体 及颜色 _placeholderLabel.textcolor
        inputField.delegate = self;
        inputField.borderStyle = UITextBorderStyleNone;
        inputField.tag = 48 + i;
        if (i == 0 || i == 1) {
            inputField.keyboardType = UIKeyboardTypeNumberPad;
        }
        [self.view addSubview:inputField];
        
        if (i == 1) {
            UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(KscreenW - leftSpace - labelW - 40, inputField.frame.origin.y + 5, labelW + 50 , labelH - 10)];
//            [btn setTitle:@"获取验证码" forState:UIControlStateNormal];
//            btn.layer.borderColor = [UIColor orangeColor].CGColor;
//            btn.layer.borderWidth = 0.3;
//            [btn setBackgroundColor:[UIColor redColor]];
            
                attrStr = [[NSMutableAttributedString alloc] initWithString:@"获取验证码"];
                [attrStr setAttributes:@{NSForegroundColorAttributeName : [UIColor orangeColor], NSFontAttributeName : [UIFont systemFontOfSize:14.0f]} range:NSMakeRange(0, attrStr.length)];
                [btn setAttributedTitle:attrStr forState:UIControlStateNormal];
            btn.titleLabel.font = [UIFont systemFontOfSize:14.0f];
            btn.titleLabel.textColor = lightOrangeColor;
            [btn addTarget:self action:@selector(sendNumToPhone) forControlEvents:UIControlEventTouchUpInside];
            btn.tag = 12;
            [self.view addSubview:btn];
        }
       
    }
    CGFloat postRegisterBtnW ;
    CGFloat postRegisterBtnH ;
    CGFloat postLeftSpace ;
    if(KscreenW == 375){
        postLeftSpace = 40;
        postRegisterBtnW = KscreenW - 2 * leftSpace;
        postRegisterBtnH = 50;
    }else if (KscreenW == 320){
        postLeftSpace = 50;
        postRegisterBtnW = KscreenW - 2 * leftSpace;
        postRegisterBtnH = 40;
    }else {
        postLeftSpace = 50;
        postRegisterBtnW = KscreenW - 2 * leftSpace;
        postRegisterBtnH = 50;
    }
    _postRegisteBtn = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMidX(self.view.frame) - (KscreenW - 2 * leftSpace) / 2.0 , _lastViewY + 60, postRegisterBtnW, postRegisterBtnH)];
    //[_postRegisteBtn setTitle:@"提交注册" forState:UIControlStateNormal];
    //[_postRegisteBtn setBackgroundColor:[UIColor orangeColor]];
    [_postRegisteBtn setImage:[UIImage imageNamed:@"Btn_Normal_zhuce"] forState:UIControlStateNormal];
    [_postRegisteBtn setImage:[UIImage imageNamed:@"Btn_Push_zhuce"] forState:UIControlStateSelected];
    [_postRegisteBtn addTarget:self action:@selector(postRegister:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_postRegisteBtn];

}
- (void)goToBack:(UIButton *)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark -提交注册
- (void)postRegister:(UIButton *)btn
{
    NSLog(@"提交注册");
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - 发送验证码到手机
- (void)sendNumToPhone
{
    
    UIButton *btn = [self.view viewWithTag:12];
    UITextField *textField = [self.view viewWithTag:48];
    if ([textField.text isEqualToString:@""]){
       //
        NSLog(@"不好意思，手机号是空的。。。");
        [self alertViewController:@"提示" message:@"手机号是空的。。。"];
        return;
    }else if(![self boolenPhone:textField.text]){
        [self alertViewController:@"提示" message:@"手机号输入错误哦。。。"];
    }else if ([btn.currentAttributedTitle isEqualToAttributedString:attrStr]) {
          _countTimer = 60;
        //发送验证码到手机
        btn.enabled = NO;
        
        //发送一段请求

        timer =  [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(changeBtnTitle) userInfo:nil repeats:YES];
        
    }
}

- (void)changeBtnTitle
{
    UIButton *btn = [self.view viewWithTag:12];
    _countTimer--;
    NSMutableAttributedString *countStr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%d秒后重新发送", _countTimer]];
    [countStr setAttributes:@{NSForegroundColorAttributeName : [UIColor lightGrayColor], NSFontAttributeName : [UIFont systemFontOfSize:14.0f]} range:NSMakeRange(0, countStr.length)];
    [btn setAttributedTitle:countStr forState:UIControlStateNormal];
//    [btn setTitle:[NSString stringWithFormat:@"%d秒后重新发送", _countTimer] forState:UIControlStateNormal];
//    [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
//    btn.titleLabel.font = [UIFont systemFontOfSize:15.0f];
    if (_countTimer < 0) {
        [timer invalidate];
        NSMutableAttributedString *attriTitle = [[NSMutableAttributedString alloc] initWithString:@"获取验证码"];
        [attriTitle setAttributes:@{NSForegroundColorAttributeName : lightOrangeColor, NSFontAttributeName : [UIFont systemFontOfSize:14.0f]} range:NSMakeRange(0, attrStr.length)];
        [btn setAttributedTitle:attriTitle forState:UIControlStateNormal];
//        [btn setBackgroundColor:[UIColor redColor]];
        btn.enabled = YES;
    }
}
#pragma mark --textfiled代理方法
//textfiled代理方法 结束输入的时候判断每个输入是否正确
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
    if (textField.tag == 48) {
        NSLog(@"%@",textField.text);
        if (![self boolenPhone:textField.text]) {
//            NSLog(@"输入手机号不正确，重输吧亲！");
            [self alertViewController:@"提示" message:@"你输入的手机号不对哦，请重新输入"];
            return;
        }
    }else if (textField.tag == 50){
        if (textField.text.length < 4) {
            [self alertViewController:@"提示" message:@"密码长度不能少于6位，请重新输入"];
        }
        UITextField *sureField = [self.view viewWithTag:51];
        if (sureField.text) {
            if (![sureField.text isEqualToString:textField.text]) {
               [self alertViewController:@"提示" message:@"两次输入密码不一致，请重新输入"];
            }
        }
    }else if(textField.tag == 51){
        UITextField *field = [self.view viewWithTag:50];
//        NSLog(@" 50 ——>%@, 51--->%@",field.text,textField.text);
        if (![field.text isEqualToString:textField.text]) {
            [self alertViewController:@"提示" message:@"两次输入密码不一致，请重新输入"];
        }
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if ([string isEqualToString:@"\n"]) {
        return YES;
    }
    NSString * toBeStr = [textField.text stringByReplacingCharactersInRange:range withString:string];
    if(textField.tag == 49){
        if ([toBeStr length] > 4) {
            textField.text =  [toBeStr substringToIndex:4];
            [self alertViewController:@"提示" message:@"你输入的验证码过长，请重新输入"];
            return NO;
        }
    }
    if (textField.tag == 50){
        if (textField.text.length >14) {
            textField.text = [toBeStr substringToIndex:13];
            NSLog(@"给个提醒 密码过长");
            [self alertViewController:@"提示" message:@"密码长度不能超过14位，请重新输入"];
            return NO;
        }
    }
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}


//弹出框
-(void)alertViewController:(NSString *)title message:(NSString *)message{
    
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:title message:message delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
    [alertView show];
    
}

/**
 @brief 传入rect 添加横线
 @param rect 横线的位置
 */
- (UIView *)getLineViewWth:(CGRect) rect
{
    UIView *view = [[UIView alloc] initWithFrame:rect];
    view.backgroundColor = menuGrayColor;
    return view;
}
/**
   @brief 传入rect 添加盖板
   @param rect 盖板的位置
 */
- (UIView *)giveCoverView:(CGRect)rect
{
    UIView *cover = [[UIView alloc] initWithFrame:rect];
    cover.backgroundColor = [UIColor whiteColor];
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [cover addGestureRecognizer:tapGesture];

    return cover;
}

- (void)handleTap:(UIGestureRecognizer *)tapGesture
{
    for (int i = 0; i < 4; i ++) {
        UITextField *field = [self.view viewWithTag:48 + i];
        [field resignFirstResponder];
    }
}

- (void)keyboardShow:(NSNotification *)noti
{
    //先移除上一次点击加上的盖板
    UIView *cover = [self.view viewWithTag:11];
    if (cover) {
        [cover removeFromSuperview];
    }
    NSDictionary *userInfo = [noti userInfo];
    NSValue *value = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    
    CGRect keyBoardRect = [value CGRectValue];
    _KeyBoardShowHeight = keyBoardRect.size.height;
    CGFloat diff = 0;

    if (keyBoardRect.origin.y < CGRectGetMaxY(_postRegisteBtn.frame)) {
        diff = ABS(CGRectGetMaxY(_postRegisteBtn.frame) - keyBoardRect.origin.y);
    }
//    //高度差
//    CGFloat diffHeight = KScreenH - CGRectGetMaxY(_registerLabel.frame) - _KeyBoardShowHeight;
    
    self.view.transform = CGAffineTransformMakeTranslation(0, -diff);
    //不需要有盖板了
//    UIView *coverView = [self giveCoverView:CGRectMake(0, _lastViewY, KscreenW, diffHeight)];
//    coverView.tag = 11;
//    [self.view addSubview:coverView];
    
}

- (void)keyboardWillHide:(NSNotification *)noti
{
//    UIView *vie = [self.view viewWithTag:11];
//    [vie removeFromSuperview];
    self.view.transform = CGAffineTransformIdentity;
}

//判断11位数是否是手机号
-(BOOL)boolenPhone:(NSString *)phoneText{
    if (phoneText.length < 11)
    {
        return NO;
    }else{
        /**
         * 移动号段正则表达式
         */
        NSString *CM_NUM = @"^((13[4-9])|(147)|(15[0-2,7-9])|(178)|(18[2-4,7-8]))\\d{8}|(1705)\\d{7}$";
        /**
         * 联通号段正则表达式
         */
        NSString *CU_NUM = @"^((13[0-2])|(145)|(15[5-6])|(176)|(18[5,6]))\\d{8}|(1709)\\d{7}$";
        /**
         * 电信号段正则表达式
         */
        NSString *CT_NUM = @"^((133)|(153)|(177)|(18[0,1,9]))\\d{8}$";
        NSPredicate *pred1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM_NUM];
        BOOL isMatch1 = [pred1 evaluateWithObject:phoneText];
        NSPredicate *pred2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU_NUM];
        BOOL isMatch2 = [pred2 evaluateWithObject:phoneText];
        NSPredicate *pred3 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT_NUM];
        BOOL isMatch3 = [pred3 evaluateWithObject:phoneText];
        if (isMatch1 | isMatch2 | isMatch3) {
            return YES;
        }else{
            return NO;
        }
    }
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
