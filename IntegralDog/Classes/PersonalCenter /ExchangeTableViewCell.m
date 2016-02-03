//
//  ExchangeTableViewCell.m
//  IntegralDog
//
//  Created by wmm on 16/1/25.
//  Copyright © 2016年 hanen. All rights reserved.
//

#import "ExchangeTableViewCell.h"
#import "Macro.h"

@implementation ExchangeTableViewCell

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
        
        self.excImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20.0f, 22.5f, 95.0f, 95.0f)];
        self.excNameLab = [[UILabel alloc] initWithFrame:CGRectMake(140.0f, 25.0f, 120.0f, 20.0f)];
        self.excNameLab.font = [UIFont systemFontOfSize:17];
        self.excNameLab.textColor = fontBlackColor;
        
        self.excCodeLab = [[UILabel alloc] initWithFrame:CGRectMake(140.0f, 52.0f, 120.0f, 20.0f)];
        self.excCodeLab.font = [UIFont systemFontOfSize:13];
        self.excCodeLab.textColor = fontLightGrayColor;
        self.excValidityLab = [[UILabel alloc] initWithFrame:CGRectMake(140.0f, 70.0f, 120.0f, 20.0f)];
        self.excValidityLab.font = [UIFont systemFontOfSize:13];
        self.excValidityLab.textColor = fontLightGrayColor;
        
        UIImageView *excIntegralImage = [[UIImageView alloc] initWithFrame:CGRectMake(140.0f, 100.0f, 15.0f, 15.0f)];
        excIntegralImage.image = [UIImage imageNamed:@"int_Jifen"];
        self.excIntegralLab = [[UILabel alloc] initWithFrame:CGRectMake(160.0f, 98.0f, 100.0f, 20.0f)];
        self.excIntegralLab.font = [UIFont systemFontOfSize:13];
        self.excIntegralLab.textColor = fontLightGrayColor;
        
        UIImageView *exchangedlImage = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth-80.0f, 60.0f, 60.0f, 25.0f)];
        exchangedlImage.image = [UIImage imageNamed:@"int_Duihuan"];
        
        UILabel *lineLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 139, kScreenWidth, 1)];
        lineLab.layer.borderWidth = 1;
        lineLab.layer.borderColor = [cellGrayColor CGColor];
        
        [self.contentView addSubview:self.excImageView];
        [self.contentView addSubview:self.excNameLab];
        [self.contentView addSubview:self.excCodeLab];
        [self.contentView addSubview:self.excValidityLab];
        [self.contentView addSubview:excIntegralImage];
        [self.contentView addSubview:self.excIntegralLab];
        [self.contentView addSubview:exchangedlImage];
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
