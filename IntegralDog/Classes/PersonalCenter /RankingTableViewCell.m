//
//  RankingTableViewCell.m
//  IntegralDog
//
//  Created by wmm on 16/1/27.
//  Copyright © 2016年 hanen. All rights reserved.
//

#import "RankingTableViewCell.h"
#import "Macro.h"

@implementation RankingTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.clipsToBounds = YES;
        //选中单元格
//        UIView *bgView = [[UIView alloc] init];
//        bgView.backgroundColor = [UIColor colorWithRed:(20.0f/255.0f) green:(30.0f/255.0f) blue:(40.0f/255.0f) alpha:0.5f];
//        self.selectedBackgroundView = bgView;
        
        self.imageView.contentMode = UIViewContentModeCenter;
        
        self.rankNumLab = [[UILabel alloc] initWithFrame:CGRectMake(30, 35, 40, 20)];
        self.rankNumLab.font = [UIFont systemFontOfSize:15];
        self.rankNumLab.textColor = fontDarkGrayColor;
        self.rankNumLab.textAlignment = NSTextAlignmentCenter;
        self.rankHeaderView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 15, 60, 60)];
        
        UILabel *rankNCLab = [[UILabel alloc] initWithFrame:CGRectMake(180, 35, 40, 20)];
        rankNCLab.font = [UIFont systemFontOfSize:15];
        rankNCLab.textColor = fontLightGrayColor;
        rankNCLab.text = @"昵称:";
        
        self.rankNameLab = [[UILabel alloc] initWithFrame:CGRectMake(225, 35, 70, 20)];
        self.rankNameLab.font = [UIFont systemFontOfSize:15];
        self.rankNameLab.textColor = fontBlackColor;
        
        self.rankNumImgView = [[UIImageView alloc] initWithFrame:CGRectMake(280, 35, 20, 20)];
        
        UIImageView *rankImageView = [[UIImageView alloc] initWithFrame:CGRectMake(335, 35, 15, 20)];
        rankImageView.image = [UIImage imageNamed:@"rank_Jifenanniu"];
        
        self.rankIntegralLab = [[UILabel alloc] initWithFrame:CGRectMake(355, 35, 50, 20)];
        self.rankIntegralLab.font = [UIFont systemFontOfSize:15];
        self.rankIntegralLab.textColor = mainOrangeColor;
        
        UILabel *lineLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 89, kScreenWidth, 1)];
        lineLab.layer.borderWidth = 1;
        lineLab.layer.borderColor = [cellGrayColor CGColor];
        
        [self.contentView addSubview:self.rankNumLab];
        [self.contentView addSubview:self.rankHeaderView];
        [self.contentView addSubview:rankNCLab];
        [self.contentView addSubview:self.rankNameLab];
        [self.contentView addSubview:self.rankNumImgView];
        [self.contentView addSubview:rankImageView];
        [self.contentView addSubview:self.rankIntegralLab];
        [self.contentView addSubview:lineLab];
        
    }
    return self;
}

- (void)awakeFromNib {
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end
