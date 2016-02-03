//
//  HeaderView.h
//  IntegralDog
//
//  Created by Hanen 3G 01 on 16/1/25.
//  Copyright © 2016年 hanen. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HeaderViewDelegate <NSObject>

- (void)jumpToOther;

@end

@interface HeaderView : UICollectionReusableView
@property (nonatomic, strong) NSString* IntegralNum;//积分数

@property (nonatomic, weak) id <HeaderViewDelegate>delegate;

+ (NSString *)resueIdentifer;
@end
