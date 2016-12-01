//
//  QYDetail.h
//  commodity_sort
//
//  Created by MAC on 2016/11/25.
//  Copyright © 2016年 LGH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QYDetail : NSObject

@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *img;

+(instancetype)detailWithDict:(NSDictionary *)dict;
@end
