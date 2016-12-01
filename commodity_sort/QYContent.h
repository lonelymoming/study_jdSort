//
//  QYContent.h
//  commodity_sort
//
//  Created by MAC on 2016/11/25.
//  Copyright © 2016年 LGH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QYContent : NSObject

@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)NSArray *details;

+(instancetype)contentWithDict:(NSDictionary *)dict;
@end
