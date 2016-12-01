//
//  QYNavView.m
//  commodity_sort
//
//  Created by MAC on 2016/11/24.
//  Copyright © 2016年 LGH. All rights reserved.
//

#import "QYNavView.h"
/**  屏幕宽高   */
#define kHeight [[UIScreen mainScreen] bounds].size.height
#define kWidth [[UIScreen mainScreen] bounds].size.width
/**  颜色   */
#define Color(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

@interface QYNavView ()<UITextFieldDelegate>
@property(nonatomic,strong)UIView *headBgView;
@property(nonatomic,strong)UIImageView *leftImgView;
@property(nonatomic,strong)UIButton *rightButton;
@property(nonatomic,strong)UITextField *searchTextField;
@property(nonatomic,strong)UIView *searchBgView;
@property(nonatomic,strong)UIImageView *searchView;
@property(nonatomic,strong)UIButton *searchVoiceBtn;
@end

@implementation QYNavView

- (instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        _headBgView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, kWidth, 64)];
        _headBgView.backgroundColor=[UIColor whiteColor];
        [self addSubview:_headBgView];
        
        _leftImgView=[[UIImageView alloc]initWithFrame:CGRectMake(10, 27, 30, 30)];
        _leftImgView.userInteractionEnabled=YES;
        _leftImgView.image=[UIImage imageNamed:@"left"];
        UITapGestureRecognizer *leftTap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(leftImgTap)];
        [_leftImgView addGestureRecognizer:leftTap];
        [self addSubview:_leftImgView];
        
        _searchBgView=[[UIView alloc]initWithFrame:CGRectMake(50, 20, kWidth-100, 40)];
        _searchBgView.backgroundColor=Color(224, 224, 224);
        _searchBgView.layer.masksToBounds=YES;
        _searchBgView.layer.cornerRadius=3;
        [self addSubview:_searchBgView];
        
        _searchView=[[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 30, 30)];
        _searchView.image=[UIImage imageNamed:@"search"];
        [_searchBgView addSubview:_searchView];
        
        _searchTextField=[[UITextField alloc]initWithFrame:CGRectMake(40, 5, kWidth-180, 30)];
        _searchTextField.backgroundColor=[UIColor clearColor];
        _searchTextField.textColor=[UIColor lightGrayColor];
        _searchTextField.font=[UIFont systemFontOfSize:14];
        _searchTextField.placeholder=@"请输入您要查询的关键词";
        _searchTextField.delegate=self;
        [_searchTextField addTarget:self action:@selector(textFieldEditChanged:) forControlEvents:UIControlEventEditingChanged];
        [_searchBgView addSubview:_searchTextField];
        
        _searchVoiceBtn=[[UIButton alloc]initWithFrame:CGRectMake(kWidth-135, 5, 30, 30)];
        [_searchVoiceBtn setImage:[UIImage imageNamed:@"voice"] forState:UIControlStateNormal];
        [_searchVoiceBtn setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
        [_searchVoiceBtn setTitle:@"voice" forState:UIControlStateNormal];
        _searchVoiceBtn.backgroundColor=[UIColor clearColor];
        [_searchVoiceBtn addTarget:self action:@selector(voiceBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [_searchBgView addSubview:_searchVoiceBtn];
        
        _rightButton=[[UIButton alloc]initWithFrame:CGRectMake(kWidth-40, 27, 30, 30)];
        [_rightButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [_rightButton setImage:[UIImage imageNamed:@"right"] forState:UIControlStateNormal];
        _rightButton.titleLabel.font=[UIFont systemFontOfSize:14];
        [_rightButton addTarget:self action:@selector(rightBtnTap:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_rightButton];
    }
    return self;
}

#pragma mark - left and right img tap
-(void)leftImgTap
{
    [self.delegate imgTap_left];
}

-(void)voiceBtnClicked:(UIButton *)btn
{
    if ([btn.titleLabel.text isEqualToString:@"voice"]) {
        NSLog(@"voice");
    }else{
        _searchTextField.text=@"";
        [_searchVoiceBtn setImage:[UIImage imageNamed:@"voice"] forState:UIControlStateNormal];
        [_searchVoiceBtn setTitle:@"voice" forState:UIControlStateNormal];
    }
}

-(void)rightBtnTap:(UIButton *)btn
{
    if ([btn.titleLabel.text isEqualToString:@"取消"]) {
        CGRect rect=_searchBgView.frame;
        rect.origin.x +=40;
        rect.size.width -=40;
        self.searchBgView.frame=rect;
        
        CGRect rect_t=self.searchTextField.frame;
        rect_t.size.width -=40;
        self.searchTextField.frame=rect_t;
        
        CGRect rect_v=self.searchVoiceBtn.frame;
        rect_v.origin.x -=40;
        self.searchVoiceBtn.frame=rect_v;
        
        [_rightButton setImage:[UIImage imageNamed:@"right"] forState:UIControlStateNormal];
        [_rightButton setTitle:@" " forState:UIControlStateNormal];
        
        [_searchVoiceBtn setImage:[UIImage imageNamed:@"voice"] forState:UIControlStateNormal];
        [_searchVoiceBtn setTitle:@"voice" forState:UIControlStateNormal];
        
        [_searchTextField resignFirstResponder];
        _searchTextField.text=@"";
    }else{
        [self.delegate imgTap_right];
    }
}

#pragma mark -UITextFieldDelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    CGRect rect=_searchBgView.frame;
    rect.origin.x -=40;
    rect.size.width +=40;
    self.searchBgView.frame=rect;
    
    CGRect rect_t=self.searchTextField.frame;
    rect_t.size.width +=40;
    self.searchTextField.frame=rect_t;
    
    CGRect rect_v=self.searchVoiceBtn.frame;
    rect_v.origin.x +=40;
    self.searchVoiceBtn.frame=rect_v;
    
    [_rightButton setImage:[UIImage imageNamed:@" "] forState:UIControlStateNormal];
    [_rightButton setTitle:@"取消" forState:UIControlStateNormal];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
}

- (void)textFieldEditChanged:(UITextField *)textField
{
    [self.delegate textFieldChange:textField];
    if (textField.text.length!=0) {
        [_searchVoiceBtn setImage:[UIImage imageNamed:@"cancel"] forState:UIControlStateNormal];
        [_searchVoiceBtn setTitle:@"cancel" forState:UIControlStateNormal];
    }else{
        [_searchVoiceBtn setImage:[UIImage imageNamed:@"voice"] forState:UIControlStateNormal];
        [_searchVoiceBtn setTitle:@"voice" forState:UIControlStateNormal];
    }
}

@end
