//
//  LoginViewController.m
//  IntegralDog
//
//  Created by HanenDev on 16/1/25.
//  Copyright © 2016年 hanen. All rights reserved.
//

#import "LoginViewController.h"
#import "UIView+Extension.h"
#import "Toast+UIView.h"
#import "JudgeNumber.h"
#import "RegisterViewController.h"
#import "TabbarController.h"
#import "Macro.h"

#define SCREENWIDTH self.view.bounds.size.width
#define SCREENHEIGHT self.view.bounds.size.height

#define WIDTH SCREENWIDTH - 2*40
#define HEIGHT 40.0f


@interface LoginViewController ()<UITextFieldDelegate,UIGestureRecognizerDelegate>
{
    UITextField *telTextField;
    UITextField *passwordTextField;
    UIButton    *loginBtn;
}
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardDidHideNotification object:nil];
}

- (void)createView
{
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
    imageView.image = [UIImage imageNamed:@"Bg.jpg"];
    [self.view addSubview:imageView];
    
    telTextField = [[UITextField alloc]initWithFrame:CGRectMake(40, self.view.centerY+ 30 , WIDTH, HEIGHT)];
    telTextField.backgroundColor = [UIColor clearColor];
    telTextField.placeholder = @"输入积分狗账号登录";
    telTextField.borderStyle = UITextBorderStyleNone;
    telTextField.keyboardType = UIKeyboardTypeNumberPad;
    telTextField.delegate = self;
    [self.view addSubview:telTextField];
    
    passwordTextField = [[UITextField alloc]initWithFrame:CGRectMake(telTextField.x, telTextField.maxY+20, WIDTH, HEIGHT)];
    passwordTextField.backgroundColor = [UIColor clearColor];
    passwordTextField.placeholder = @"请输入密码";
    passwordTextField.borderStyle = UITextBorderStyleNone;
    passwordTextField.secureTextEntry = YES;
    passwordTextField.delegate = self;
    [self.view addSubview:passwordTextField];
    
    for (int i=0; i<2; i++) {
        UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(telTextField.x, telTextField.maxY + i*(20+40), WIDTH, 1)];
        lineView.backgroundColor = cellGrayColor;
        [self.view addSubview:lineView];
    }
    
    UIButton *forgetBtn = [[UIButton alloc]initWithFrame:CGRectMake(passwordTextField.maxX - 80, passwordTextField.y, 80, HEIGHT)];
    [forgetBtn setTitle:@"忘记密码?" forState:UIControlStateNormal];
    [forgetBtn setTitleColor:fontLightGrayColor forState:UIControlStateNormal];
    [forgetBtn.titleLabel setFont:[UIFont systemFontOfSize:15.0f]];
    [forgetBtn addTarget:self action:@selector(toSearchMima:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:forgetBtn];
    
    loginBtn = [[UIButton alloc]initWithFrame:CGRectMake(telTextField.x, passwordTextField.maxY+40 + 30, WIDTH , HEIGHT + 10)];
    //[loginBtn setTitle:@"登 陆" forState:UIControlStateNormal];
    //[loginBtn setBackgroundColor:[UIColor orangeColor]];
    [loginBtn setImage:[UIImage imageNamed:@"Btn_Normal_login"] forState:UIControlStateNormal];
    [loginBtn setImage:[UIImage imageNamed:@"Btn_Login_Selected"] forState:UIControlStateSelected];
    [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(clickToMain:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
    
    UILabel *registerLabel = [[UILabel alloc]initWithFrame:CGRectMake(loginBtn.x, loginBtn.maxY + 20, WIDTH, 30)];
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc]initWithString:@"没有账号?我要注册"];
    [string addAttribute:NSForegroundColorAttributeName value:fontLightGrayColor2 range:NSMakeRange(0, 5)];
    [string addAttribute:NSForegroundColorAttributeName value:fontLightGrayColor range:NSMakeRange(5, 4)];
    registerLabel.attributedText = string;
    registerLabel.font = [UIFont systemFontOfSize:15.0f];
    registerLabel.textAlignment = NSTextAlignmentCenter;
    registerLabel.userInteractionEnabled = YES;
    [self.view addSubview:registerLabel];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(goToRegisterView:)];
    tapGesture.delegate = self;
    tapGesture.numberOfTapsRequired=1;
    [registerLabel addGestureRecognizer:tapGesture];
}
#pragma mark
#pragma mark textfield 代理
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}


- (void)clickToMain:(UIButton *)sender
{
    if ([telTextField.text isEqualToString:@""]) {
        
        [self.view makeToast:@"请输入用户名"];
        return;
    }
    
    if ([passwordTextField.text isEqualToString:@""]) {
        
        [self.view makeToast:@"请输入密码"];
        return;
    }
    
    BOOL isPhone = [JudgeNumber boolenPhone:telTextField.text];
    if (isPhone == NO) {
        
        [self.view makeToast:@"请输入正确的手机号"];
        return;
    }
    
    [telTextField resignFirstResponder];
    [passwordTextField resignFirstResponder];
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    window.rootViewController = [[TabbarController alloc]init];
    
}

- (void)toSearchMima:(UIButton *)sender
{
    NSLog(@"忘记密码");
}

- (void)goToRegisterView:(UITapGestureRecognizer *)sender{
    NSLog(@"前去注册");
    [self presentViewController:[[RegisterViewController alloc]init] animated:YES completion:nil];
}

- (void)keyboardWillShow:(NSNotification *)notify{
    
    NSDictionary *dic = notify.userInfo;
    CGRect keyFrame = [dic [UIKeyboardFrameEndUserInfoKey]CGRectValue];
    CGFloat diff = ABS(keyFrame.origin.y - loginBtn.maxY);
    CGFloat time = [dic [UIKeyboardAnimationDurationUserInfoKey]doubleValue];
    if (loginBtn.maxY > keyFrame.origin.y)  {
        [UIView animateWithDuration:time animations:^{
            CGAffineTransform transform = CGAffineTransformMakeTranslation(0, -diff);
            self.view.transform = transform;
        }];
    }
}

- (void)keyboardWillHide:(NSNotification *)notify{
    NSDictionary *dic = notify.userInfo;
    
    CGFloat timer = [dic [UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    [UIView animateWithDuration:timer animations:^{
        CGAffineTransform form = CGAffineTransformIdentity;
        self.view.transform = form;
    }];
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
