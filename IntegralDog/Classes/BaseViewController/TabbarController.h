//
//  TabbarController.h
//  IntegralDog
//
//  Created by User on 16/1/22.
//  Copyright © 2016年 hanen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TabbarController : UITabBarController
@property (nonatomic, retain)UIButton *selectedBtn;


+ (void)creatScrollViewaddView:(UIView *)view  With:(UIImage *)advertImg Withframe:(CGRect)rect;

@end
