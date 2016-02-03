//
//  ExchangeTableViewCell.h
//  IntegralDog
//
//  Created by wmm on 16/1/25.
//  Copyright © 2016年 hanen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExchangeTableViewCell : UITableViewCell

@property (strong, nonatomic) UIImageView *excImageView;
@property (strong, nonatomic) UILabel *excNameLab;
@property (strong, nonatomic) UILabel *excCodeLab;
@property (strong, nonatomic) UILabel *excValidityLab;
@property (strong, nonatomic) UILabel *excIntegralLab;

@end
