//
//  QYDetailsView.h
//  commodity_sort
//
//  Created by MAC on 2016/11/28.
//  Copyright © 2016年 LGH. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kWidth [[UIScreen mainScreen] bounds].size.width

@interface QYDetailsView : UIView

@property(nonatomic,strong)NSArray * detailsArray;

+ (CGSize)sizeWithCount:(int)count;
@end
