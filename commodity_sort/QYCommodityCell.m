//
//  QYCommodityCell.m
//  commodity_sort
//
//  Created by MAC on 2016/11/25.
//  Copyright © 2016年 LGH. All rights reserved.
//

#import "QYCommodityCell.h"
#import "QYCommodity.h"

/**  屏幕宽高   */
#define kHeight [[UIScreen mainScreen] bounds].size.height
#define kWidth [[UIScreen mainScreen] bounds].size.width
/**  颜色   */
#define Color(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

@implementation QYCommodityCell

+(instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID=@"commodityCell";
    QYCommodityCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell=[[QYCommodityCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle=UITableViewCellSelectionStyleNone;
        
        UIView *mainView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 80, 44)];
        mainView.backgroundColor=Color(232, 232, 232);
        
        self.titleLab=[[UILabel alloc]initWithFrame:CGRectMake(0, 1, 80, 43)];
        self.titleLab.font=[UIFont systemFontOfSize:14];
        self.titleLab.textAlignment=NSTextAlignmentCenter;
        [mainView addSubview:self.titleLab];
        
        [self.contentView addSubview:mainView];
    }
    return self;
}

-(void)setCommodity:(QYCommodity *)commodity
{
    _commodity=commodity;
    
    self.titleLab.text=_commodity.title;
    
    switch (_commodity.type) {
        case 0:
            self.titleLab.backgroundColor=[UIColor whiteColor];
            self.titleLab.textColor=[UIColor blackColor];
            break;
        case 1:
            self.titleLab.backgroundColor=Color(232, 232, 232);
            self.titleLab.textColor=[UIColor redColor];
            break;
        default:
            break;
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
