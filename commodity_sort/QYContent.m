//
//  QYContent.m
//  commodity_sort
//
//  Created by MAC on 2016/11/25.
//  Copyright © 2016年 LGH. All rights reserved.
//

#import "QYContent.h"

@implementation QYContent

+(instancetype)contentWithDict:(NSDictionary *)dict
{
    QYContent *content=[[QYContent alloc]init];
    [content setValuesForKeysWithDictionary:dict];
    return content;
}

@end
