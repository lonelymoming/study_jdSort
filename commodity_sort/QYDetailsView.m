//
//  QYDetailsView.m
//  commodity_sort
//
//  Created by MAC on 2016/11/28.
//  Copyright © 2016年 LGH. All rights reserved.
//

#import "QYDetailsView.h"
#import "UIView+Extension.h"
#import "QYDetail.h"
#import "QYDetailButton.h"

@implementation QYDetailsView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)setDetailsArray:(NSArray *)detailsArray
{
    _detailsArray = detailsArray;
    
    int detailsCount = (int)detailsArray.count;
    
    // 创建足够数量的控件
    while (self.subviews.count < detailsCount) {
        QYDetailButton *detailButton = [[QYDetailButton alloc] init];
        [self addSubview:detailButton];
    }
    
    NSMutableArray *detailArray=[NSMutableArray array];
    for (NSDictionary *dict in detailsArray) {
        QYDetail *detail=[[QYDetail alloc]init];
        detail=[QYDetail detailWithDict:dict];
        [detailArray addObject:detail];
    }
    
    // 遍历所有的控件
    for (int i = 0; i<self.subviews.count; i++) {
        QYDetailButton *detailButton = self.subviews[i];
        
        if (i < detailsCount) { // 显示
            detailButton.detail = detailArray[i];
            detailButton.hidden = NO;
        } else { // 隐藏
            detailButton.hidden = YES;
        }
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 设置尺寸和位置
    int detailsCount = (int)self.detailsArray.count;
    int maxCol=3;
    for (int i = 0; i<detailsCount; i++) {
        QYDetailButton *detailButton = self.subviews[i];
        
        int col = i % maxCol;
        detailButton.x = col * (kWidth-100)/3;
        
        int row = i / maxCol;
        detailButton.y = row * 100;
        detailButton.width = (kWidth-100)/3;
        detailButton.height = 100;
    }
}

+ (CGSize)sizeWithCount:(int)count
{
    // 最大列数
    int maxCols = 3;
    int cols = (count >= maxCols)? maxCols : count;
    CGFloat detailsW = cols * (kWidth-100)/3;
    
    // 行数
    int rows = (count + maxCols - 1) / maxCols;
    CGFloat detailsH = rows * 100;
    
    return CGSizeMake(detailsW, detailsH);
}

@end
