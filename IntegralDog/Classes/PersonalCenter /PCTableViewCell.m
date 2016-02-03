//
//  PCTableViewCell.m
//  IntegralDog
//
//  Created by wmm on 16/1/27.
//  Copyright © 2016年 hanen. All rights reserved.
//

#import "PCTableViewCell.h"
#import "Macro.h"

@implementation PCTableViewCell

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
        
        
        self.pcImgView = [[UIImageView alloc] initWithFrame:CGRectMake(30, 20, 20, 20)];
        
        self.pcNameLab = [[UILabel alloc] initWithFrame:CGRectMake(70, 20, 80, 20)];
        self.pcNameLab.font = [UIFont systemFontOfSize:17];
        self.pcNameLab.textColor = fontGrayColor;
        
        self.pcIntegralLab = [[UILabel alloc] initWithFrame:CGRectMake(150, 20, 70, 20)];
        self.pcIntegralLab.font = [UIFont systemFontOfSize:15];
        self.pcIntegralLab.textColor = mainOrangeColor;
        
        UIImageView *intoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth-50, 20, 12, 17)];
        intoImageView.image = [UIImage imageNamed:@"uc_Jiantou"];
        
        UILabel *lineLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 1)];
        lineLab.layer.borderWidth = 1;
        lineLab.layer.borderColor = [cellGrayColor CGColor];
        
        UILabel *lineLab2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 59, kScreenWidth, 1)];
        lineLab2.layer.borderWidth = 1;
        lineLab2.layer.borderColor = [cellGrayColor CGColor];
        
        [self.contentView addSubview:self.pcImgView];
        [self.contentView addSubview:self.pcNameLab];
        [self.contentView addSubview:self.pcIntegralLab];
        [self.contentView addSubview:intoImageView];
        [self.contentView addSubview:lineLab];
        [self.contentView addSubview:lineLab2];
        
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
