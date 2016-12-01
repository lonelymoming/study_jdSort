//
//  QYCommodityCell.h
//  commodity_sort
//
//  Created by MAC on 2016/11/25.
//  Copyright © 2016年 LGH. All rights reserved.
//

#import <UIKit/UIKit.h>

@class QYCommodity;
@interface QYCommodityCell : UITableViewCell

@property(nonatomic,strong)QYCommodity *commodity;
@property(nonatomic,strong)UILabel *titleLab;
@property(nonatomic,strong)UIColor *color;

+(instancetype)cellWithTableView:(UITableView *)tableView;
@end
