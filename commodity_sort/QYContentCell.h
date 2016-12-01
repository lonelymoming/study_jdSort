//
//  QYContentCell.h
//  commodity_sort
//
//  Created by MAC on 2016/11/25.
//  Copyright © 2016年 LGH. All rights reserved.
//

#import <UIKit/UIKit.h>

@class QYDetailsViewFrame;
@class QYDetailsView;
@interface QYContentCell : UITableViewCell
@property(nonatomic,strong)QYDetailsViewFrame *detailsFrame;

@property (strong,nonatomic)UIView *mainView;
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)QYDetailsView *detailsView;

+(instancetype)cellWithTableView:(UITableView *)tableView;
@end
