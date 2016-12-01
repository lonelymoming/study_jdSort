//
//  QYDetailButton.m
//  commodity_sort
//
//  Created by MAC on 2016/11/29.
//  Copyright © 2016年 LGH. All rights reserved.
//

#import "QYDetailButton.h"

@implementation QYDetailButton

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        self.titleLabel.font=[UIFont systemFontOfSize:12];
        self.titleLabel.textAlignment=NSTextAlignmentCenter;
        [self setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    }
    return self;
}

-(void)setDetail:(QYDetail *)detail
{
    _detail=detail;
    
    [self setTitle:detail.name forState:UIControlStateNormal];
    [self setImage:[UIImage imageNamed:detail.img] forState:UIControlStateNormal];
    [self addTarget:self action:@selector(btnClicked) forControlEvents:UIControlEventTouchUpInside];
}

-(void)btnClicked
{
    NSLog(@"%@",_detail.name);
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect

{
    CGFloat titleY =70;
    
    CGFloat titleW=60;
    
    CGFloat titleH = 20;
    
    return CGRectMake(contentRect.size.width/2-30, titleY, titleW, titleH);
    
}

-(CGRect)imageRectForContentRect:(CGRect)contentRect

{
    
    CGFloat imageW = 60;
    
    CGFloat imageH =60;
    
    return CGRectMake(contentRect.size.width/2-30, 10, imageW, imageH);
    
}

@end
