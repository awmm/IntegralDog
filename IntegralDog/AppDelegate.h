//
//  AppDelegate.h
//  IntegralDog
//
//  Created by wmm on 16/1/21.
//  Copyright © 2016年 hanen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TabbarController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    UITabBarController* tabBarViewController;
}
@property (strong, nonatomic) UIWindow *window;
@property(nonatomic,assign)CGFloat autoSizeScaleX;
@property(nonatomic,assign)CGFloat autoSizeScaleY;
@property (strong ,nonatomic) TabbarController * tabbarController;

@end

