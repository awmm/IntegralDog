//
//  OutLoginCell.h
//  IntegralDog
//    ___________   __________          __
//   / _________/  / ________/         /  \
//  / /           | |                 / /\ \
//  | |           | |      ____      / /  \ \
//  | |           | |     /__  |    / /____\ \
//  | |           | |        | |   / /______\ \
//  |  \_________ |  \_______| |  / /        \ \
//   \__________/  \___________| /_/          \_\
//
//  Created by Hanen 3G 01 on 16/1/21.
//  Copyright © 2016年 hanen. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol OutLoginCellDelegate <NSObject>

- (void)clickOutLogin;

@end

@interface OutLoginCell : UITableViewCell

@property (nonatomic, weak) id <OutLoginCellDelegate> delegate;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

+ (CGFloat)cellHeight;
@end
