//
//  QYNavView.h
//  commodity_sort
//
//  Created by MAC on 2016/11/24.
//  Copyright © 2016年 LGH. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol QYNavViewDelegate <NSObject>
@optional
-(void)imgTap_left;
-(void)imgTap_right;

-(void)textFieldBegin;
-(void)textFieldEnd;
-(void)textFieldChange:(UITextField *)textField;

@end

@interface QYNavView : UIView
@property(nonatomic,strong)id<QYNavViewDelegate>delegate;

@end
