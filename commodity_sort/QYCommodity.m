//
//  QYCommodity.m
//  commodity_sort
//
//  Created by MAC on 2016/11/25.
//  Copyright © 2016年 LGH. All rights reserved.
//

#import "QYCommodity.h"

@implementation QYCommodity

+(instancetype)commodityWithDict:(NSDictionary *)dict
{
    QYCommodity *commodity=[[QYCommodity alloc]init];
    [commodity setValuesForKeysWithDictionary:dict];
    return commodity;
}

@end
