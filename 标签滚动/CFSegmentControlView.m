//
//  CFSegmentControlView.m
//  标签滚动
//
//  Created by ZXGavin on 15/12/30.
//  Copyright © 2015年 ZXGavin. All rights reserved.
//

#import "CFSegmentControlView.h"

@interface CFSegmentControlView ()

@property(nonatomic, strong)UIView *moveView;
@property(nonatomic, strong)UIView *labelView;

@property(nonatomic, assign)CGFloat viewWidth;
@property(nonatomic, assign)CGFloat viewHight;

@end

@implementation CFSegmentControlView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _viewWidth = frame.size.width;
        _viewHight = frame.size.height;
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    [self tolerancePropertySet];
    [self creatNomalLabel];
    [self.moveView addSubview:self.labelView];
    [self addSubview:self.moveView];
}

- (void)tolerancePropertySet
{
    if (_titleArray == nil) {
        _titleArray = @[@"设置标题栏", @"测试", @"set titles"];
    }
    if (_nomalTitleColor == nil) {
        _nomalTitleColor = [UIColor blackColor];
    }
    if (_highLightTitleColor == nil) {
        _highLightTitleColor = [UIColor whiteColor];
    }
    if (_highLightViewColor == nil) {
        _highLightViewColor = [UIColor redColor];
    }
    if (_titleFont == nil) {
        _titleFont = [UIFont systemFontOfSize:15];
    }
    
}

- (void)tapAction:(UITapGestureRecognizer *)tap
{
    [self.delegate tapLabelWithIndex:tap.view.tag - 1000];
    
    [UIView animateWithDuration:_duration animations:^{
        _moveView.frame = CGRectMake((tap.view.tag - 1000) * _viewWidth / _titleArray.count, 0, _viewWidth / _titleArray.count, _viewHight);
        _labelView.frame = CGRectMake(-(tap.view.tag - 1000) * _viewWidth / _titleArray.count, 0, _viewWidth / _titleArray.count, _viewHight);
        
    }];
    
}

- (void)creatNomalLabel
{
    for (NSInteger i = 0; i < _titleArray.count; i++) {
        
        UILabel *label = [self creatLabelWithTextColor:_nomalTitleColor Index:i];
        label.tag = 1000 + i;
        label.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
        [label addGestureRecognizer:tap];
        [self addSubview:label];
        
    }
}

- (UIView *)moveView
{
    if (_moveView == nil) {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, _viewWidth / _titleArray.count, _viewHight)];
        view.clipsToBounds = YES;
        view.layer.cornerRadius = 5;
        view.backgroundColor = _highLightViewColor;
        _moveView = view;
    }
    return _moveView;
}

- (UIView *)labelView
{
    if (_labelView == nil) {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, _viewWidth, _viewHight)];
        for (NSInteger i = 0; i < _titleArray.count; i++) {
            
            [view addSubview:[self creatLabelWithTextColor:_highLightTitleColor Index:i]];
        }

        _labelView = view;
    }
    return _labelView;
}

- (UILabel *)creatLabelWithTextColor:(UIColor *)textColor Index:(NSInteger)index
{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(index * _viewWidth / _titleArray.count, 0, _viewWidth / _titleArray.count, _viewHight)];
    label.text = _titleArray[index];
    label.textAlignment = 1;
    label.font = _titleFont;
    label.textColor = textColor;
    return label;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
