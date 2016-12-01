//
//  QYContentCell.m
//  commodity_sort
//
//  Created by MAC on 2016/11/25.
//  Copyright © 2016年 LGH. All rights reserved.
//

#import "QYContentCell.h"
#import "QYContent.h"
#import "QYDetailsView.h"
#import "QYDetailsViewFrame.h"

/**  屏幕宽高   */
#define kHeight [[UIScreen mainScreen] bounds].size.height
#define kWidth [[UIScreen mainScreen] bounds].size.width
/**  颜色   */
#define Color(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

@implementation QYContentCell

+(instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID=@"contentCell";
    QYContentCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell=[[QYContentCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //去掉cell选中状态
        self.selectionStyle=UITableViewCellSelectionStyleNone;
        self.backgroundColor=[UIColor clearColor];
        
        [self setupOriginal];
    }
    return self;
}

/**        初始化         */
-(void)setupOriginal
{
    //整体
    UIView *mainView=[[UIView alloc]init];
    mainView.backgroundColor=[UIColor clearColor];
    [self.contentView addSubview:mainView];
    self.mainView=mainView;
    //标题
    UILabel *titleLabel=[[UILabel alloc]init];
    titleLabel.font=[UIFont systemFontOfSize:14];
    titleLabel.textColor=[UIColor blackColor];
    [self.contentView addSubview:titleLabel];
    self.titleLabel=titleLabel;
    //商品
    QYDetailsView *detailsView=[[QYDetailsView alloc]init];
    detailsView.backgroundColor=[UIColor whiteColor];
    [self.contentView addSubview:detailsView];
    self.detailsView=detailsView;
}

-(void)setDetailsFrame:(QYDetailsViewFrame *)detailsFrame
{
    _detailsFrame=detailsFrame;
    QYContent *details=detailsFrame.content;
    
    self.mainView.frame=detailsFrame.mainViewFrame;
    
    self.titleLabel.frame=detailsFrame.titleLabelFrame;
    self.titleLabel.text=details.title;
    
    self.detailsView.frame=detailsFrame.detailsViewFrame;
    self.detailsView.detailsArray=details.details;
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
