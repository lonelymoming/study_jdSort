//
//  QYDetailsViewFrame.m
//  commodity_sort
//
//  Created by MAC on 2016/11/28.
//  Copyright © 2016年 LGH. All rights reserved.
//

#import "QYDetailsViewFrame.h"
#import "QYDetailsView.h"

@implementation QYDetailsViewFrame

-(void)setContent:(QYContent *)content
{
    _content=content;
    
    CGFloat titleX=0;
    CGFloat titleY=10;
    CGFloat titleW=120;
    CGFloat titleH=20;
    self.titleLabelFrame=(CGRect){{titleX,titleY},{titleW,titleH}};
    
    CGFloat detailsX=0;
    CGFloat detailsY=CGRectGetMaxY(self.titleLabelFrame)+10;
    CGSize detailsSize=[QYDetailsView sizeWithCount:(int)[content.details count]];
    self.detailsViewFrame=(CGRect){{detailsX,detailsY},detailsSize};
    
    CGFloat mainX=0;
    CGFloat mainY=0;
    CGFloat mainW=kWidth-100;
    CGFloat mainH=CGRectGetMaxY(self.detailsViewFrame);
    self.mainViewFrame=(CGRect){{mainX,mainY},{mainW,mainH}};
    
    self.cellHeight=CGRectGetMaxY(self.detailsViewFrame);
}

@end
