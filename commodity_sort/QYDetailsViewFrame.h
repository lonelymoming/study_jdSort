//
//  QYDetailsViewFrame.h
//  commodity_sort
//
//  Created by MAC on 2016/11/28.
//  Copyright © 2016年 LGH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "QYContent.h"

@interface QYDetailsViewFrame : NSObject

@property(nonatomic,strong)QYContent *content;

@property (assign,nonatomic)CGRect mainViewFrame;//整体
@property (assign,nonatomic)CGRect titleLabelFrame;
@property (assign,nonatomic)CGRect detailsViewFrame;

@property (assign,nonatomic)CGFloat cellHeight;//cell高
@end
