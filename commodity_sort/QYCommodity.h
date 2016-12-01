//
//  QYCommodity.h
//  commodity_sort
//
//  Created by MAC on 2016/11/25.
//  Copyright © 2016年 LGH. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum
{
    QYCommodityTypeWhite=0,
    QYCommodityTypeGray=1
}QYCommodityType;

@interface QYCommodity : NSObject

@property(nonatomic,strong)NSString *title;
@property(nonatomic,assign)QYCommodityType type;

+(instancetype)commodityWithDict:(NSDictionary *)dict;
@end
