//
//  IntegralCollectionViewCell.h
//  IntegralDog
//
//  Created by Hanen 3G 01 on 16/1/25.
//  Copyright © 2016年 hanen. All rights reserved.
//

#import <UIKit/UIKit.h>

@class IntegralModel;

@interface IntegralCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) IntegralModel * model;

+ (NSString *)reuseIdentifier;
@end
