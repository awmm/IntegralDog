//
//  ImageTextButton.m
//  app1
//
//  Created by Hanen 3G 01 on 16/1/12.
//  Copyright © 2016年 Hanen 3G 01. All rights reserved.
//

#import "ImageTextButton.h"

#define labelH 40//button按钮中文字占得高度

@implementation ImageTextButton

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGRect titleRect = CGRectMake(0, contentRect.size.height -  labelH + 5, contentRect.size.width, labelH);

    return titleRect;
}


- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGRect imageRect = CGRectMake(contentRect.size.width / 2.0 - (contentRect.size.height - labelH) / 2.0, 10 , contentRect.size.height  - labelH, contentRect.size.height - labelH);
    return imageRect;
}
@end
