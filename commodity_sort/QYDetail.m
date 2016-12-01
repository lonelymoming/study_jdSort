//
//  QYDetail.m
//  commodity_sort
//
//  Created by MAC on 2016/11/25.
//  Copyright © 2016年 LGH. All rights reserved.
//

#import "QYDetail.h"

@implementation QYDetail

+(instancetype)detailWithDict:(NSDictionary *)dict
{
    QYDetail *detail=[[QYDetail alloc]init];
    [detail setValuesForKeysWithDictionary:dict];
    return detail;
}

@end
