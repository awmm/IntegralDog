//
//  DownloadHistoryCell.m
//  IntegralDog
//
//  Created by HanenDev on 16/1/25.
//  Copyright © 2016年 hanen. All rights reserved.
//

#import "DownloadHistoryCell.h"
#import "UIView+Extension.h"
#import "Macro.h"

#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width
#define STARTX 15.0f

@implementation DownloadHistoryCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        UIView *view = [[UIView alloc]init];
        view.backgroundColor = [UIColor colorWithRed:(20.0f/255.0f) green:(30.0f/255.0f) blue:(40.0f/255.0f) alpha:0.5f];
        self.selectedBackgroundView = view;
        
        self.imagView = [[UIImageView alloc]initWithFrame:CGRectMake(STARTX, 20, 80, 80)];
        [self.contentView addSubview:self.imagView];
        
        self.nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(_imagView.maxX + 10, 20, SCREENWIDTH - _imagView.maxX, 25)];
        self.nameLabel.textColor = titleBlackColor;
        [self.contentView addSubview:self.nameLabel];
        
        self.editionLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.nameLabel.x, self.nameLabel.maxY + 2.5, SCREENWIDTH - _imagView.maxX, 20)];
        self.editionLabel.textColor = fontLightGrayColor;
        self.editionLabel.font = [UIFont systemFontOfSize:14.0f];
        [self.contentView addSubview:self.editionLabel];
        
        self.updataLabel = [[UILabel alloc]initWithFrame:CGRectMake(_nameLabel.x, _editionLabel.maxY + 2.5, _nameLabel.width, 25)];
        self.updataLabel.textColor = fontLightGrayColor;
        self.updataLabel.font = [UIFont systemFontOfSize:14.0f];
        [self.contentView addSubview:self.updataLabel];
        
        self.picView = [[UIImageView alloc]initWithFrame:CGRectMake(SCREENWIDTH - 80 , self.editionLabel.y , 15, 13)];
        [self.contentView addSubview:self.picView];
        
        self.countLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.picView.maxX + 3, self.editionLabel.y - 5, 80, 25)];
        self.countLabel.textColor = lightOrangeColor;
        self.countLabel.font = [UIFont systemFontOfSize:16.0f];
        [self.contentView addSubview:self.countLabel];
        
        UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 119.0f, SCREENWIDTH, 1)];
        lineView.backgroundColor = cellGrayColor;
        [self.contentView addSubview:lineView];
        
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
