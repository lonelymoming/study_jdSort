//
//  QYCommodityViewController.m
//  commodity_sort
//
//  Created by MAC on 2016/11/24.
//  Copyright © 2016年 LGH. All rights reserved.
//

#import "QYCommodityViewController.h"
#import "QYNavView.h"
#import "QYCommodityCell.h"
#import "QYCommodity.h"
#import "QYContent.h"
#import "QYContentCell.h"
#import "QYDetailsViewFrame.h"

/**  屏幕宽高   */
#define kHeight [[UIScreen mainScreen] bounds].size.height
#define kWidth [[UIScreen mainScreen] bounds].size.width
/**  颜色   */
#define Color(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

@interface QYCommodityViewController ()<QYNavViewDelegate,UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)QYNavView *navView;
@property(nonatomic,strong)UITableView *m_tableView;
@property(nonatomic,strong)UITableView *detailTableView;
@property(nonatomic,strong)NSArray *dataArray;
@property(nonatomic,strong)NSArray *detailDataArray;
@end

@implementation QYCommodityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=Color(232, 232, 232);
    
    [self createNavView];
    
    [self createTableView];
}

-(void)createNavView
{
    _navView=[[QYNavView alloc]initWithFrame:CGRectMake(0, 0, kWidth, 64)];
    _navView.backgroundColor=[UIColor clearColor];
    _navView.delegate=self;
    [self.view addSubview:_navView];
}

-(void)createTableView
{
    _m_tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 65, 80, kHeight-65)];
    _m_tableView.delegate=self;
    _m_tableView.dataSource=self;
    _m_tableView.tag=0;
    _m_tableView.backgroundColor=[UIColor clearColor];
    _m_tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_m_tableView];
    
    _detailTableView=[[UITableView alloc]initWithFrame:CGRectMake(90, 65, kWidth-100, kHeight-75)];
    _detailTableView.delegate=self;
    _detailTableView.dataSource=self;
    _detailTableView.tag=1;
    _detailTableView.backgroundColor=[UIColor clearColor];
    _detailTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_detailTableView];
}

-(NSArray *)dataArray
{
    if (_dataArray==nil) {
        NSString *path=[[NSBundle mainBundle]pathForResource:@"commodity" ofType:@"plist"];
        NSArray *dictArray=[NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *commodityArray=[NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            QYCommodity *commodity=[QYCommodity commodityWithDict:dict];
            [commodityArray addObject:commodity];
        }
        _dataArray=commodityArray;
    }
    return _dataArray;
}

-(NSArray *)detailFrameWithContent:(NSArray *)details
{
    NSMutableArray *frame=[NSMutableArray array];
    for(QYContent *content in details)
    {
        QYDetailsViewFrame *detailsFrame=[[QYDetailsViewFrame alloc]init];
        detailsFrame.content=content;
        [frame addObject:detailsFrame];
    }
    return frame;
}

-(NSArray *)detailDataArray
{
    if (_detailDataArray==nil) {
        NSString *path=[[NSBundle mainBundle]pathForResource:@"details" ofType:@"plist"];
        NSArray *dictArray=[[NSArray arrayWithContentsOfFile:path] objectAtIndex:0];
        
        NSMutableArray *detailArray=[NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            QYContent *content=[QYContent contentWithDict:dict];
            [detailArray addObject:content];
        }
        _detailDataArray=[self detailFrameWithContent:detailArray];
    }
    return _detailDataArray;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (tableView.tag) {
        case 0:
            return self.dataArray.count;
            break;
        case 1:
            return self.detailDataArray.count;
            break;
        default:
            break;
    }
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    QYCommodityCell *commodityCell=[[QYCommodityCell alloc]init];
    QYContentCell *contentCell=[[QYContentCell alloc]init];
    switch (tableView.tag) {
        case 0:
            commodityCell=[QYCommodityCell cellWithTableView:tableView];
            commodityCell.commodity=self.dataArray[indexPath.row];
            return commodityCell;
            break;
        case 1:
            contentCell=[QYContentCell cellWithTableView:tableView];
            contentCell.detailsFrame=self.detailDataArray[indexPath.row];
            return contentCell;
            break;
        default:
            break;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    QYDetailsViewFrame *detailsFrame=[[QYDetailsViewFrame alloc]init];
    switch (tableView.tag) {
        case 0:
            return 44;
            break;
        case 1:
            detailsFrame=self.detailDataArray[indexPath.row];
            return detailsFrame.cellHeight;
            break;
        default:
            break;
    }
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (tableView.tag) {
        case 0:
            [self selectRowForAction:indexPath];
            break;
        case 1:
            break;
        default:
            break;
    }
}

//选中分类改变标题和背景色
-(void)selectRowForAction:(NSIndexPath *)indexPath
{
    NSMutableArray *array=[NSMutableArray array];
    for (QYCommodity *commodity in _dataArray) {
        commodity.type=0;
        [array addObject:commodity];
    }
    QYCommodity *commodity=self.dataArray[indexPath.row];
    commodity.type=1;
    [array replaceObjectAtIndex:indexPath.row withObject:commodity];
    _dataArray=array;
    [_m_tableView reloadData];
    
    [self selectClassRefreashData:indexPath];
    
    [self selectClassToScrol:indexPath];
}
//选中分类加载对应数据并刷新TableView
-(void)selectClassRefreashData:(NSIndexPath *)indexPath
{
    NSString *path=[[NSBundle mainBundle]pathForResource:@"details" ofType:@"plist"];
    NSArray *dictArray;
    if (indexPath.row>3) {
        dictArray=[[NSArray arrayWithContentsOfFile:path] objectAtIndex:0];
    }else{
        dictArray=[[NSArray arrayWithContentsOfFile:path] objectAtIndex:indexPath.row];
    }
        
    NSMutableArray *detailArray=[NSMutableArray array];
    for (NSDictionary *dict in dictArray) {
        QYContent *content=[QYContent contentWithDict:dict];
        [detailArray addObject:content];
    }
    _detailDataArray=[self detailFrameWithContent:detailArray];
    
    [_detailTableView reloadData];
}
//选中分类根据实际情况滚动
-(void)selectClassToScrol:(NSIndexPath *)indexPath
{
    if (indexPath.row>=5&&_dataArray.count-indexPath.row>5) {
        if (_m_tableView.contentSize.height-(kHeight-65)-44*(indexPath.row-5)>0) {
             [_m_tableView setContentOffset:CGPointMake(0, 44*(indexPath.row-5)) animated:YES];
        }else{
            [_m_tableView setContentOffset:CGPointMake(0, _m_tableView.contentSize.height-(kHeight-65)) animated:YES];
        }
    }else if (_dataArray.count-indexPath.row<=5){
        [_m_tableView setContentOffset:CGPointMake(0, _m_tableView.contentSize.height-(kHeight-65)) animated:YES];
    }else{
        [_m_tableView setContentOffset:CGPointMake(0, 0) animated:YES];
    }
}

#pragma mark - QYNavViewDelegate
-(void)imgTap_right
{
    NSLog(@"imgTap_right");
}

-(void)imgTap_left
{
    NSLog(@"imgTap_left");
}

-(void)textFieldChange:(UITextField *)textField
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
