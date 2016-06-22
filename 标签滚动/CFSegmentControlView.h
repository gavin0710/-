//
//  CFSegmentControlView.h
//  标签滚动
//
//  Created by ZXGavin on 15/12/30.
//  Copyright © 2015年 ZXGavin. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  点击 label 的代理方法
 */
@protocol CFSegmentControlView <NSObject>

- (void)tapLabelWithIndex:(NSInteger)index;

@end

@interface CFSegmentControlView : UIView

@property(nonatomic, assign)id<CFSegmentControlView>delegate;

/**
 *  数组 装每个标题
 */
@property(nonatomic, strong)NSArray *titleArray;

/**
 *  标题的字号
 */
@property(nonatomic, strong)UIFont *titleFont;

/**
 *  普通标题颜色
 */
@property(nonatomic, strong)UIColor *nomalTitleColor;

/**
 *  标题高亮颜色
 */
@property(nonatomic, strong)UIColor *highLightTitleColor;

/**
 *  高亮的 view 颜色
 */
@property(nonatomic, strong)UIColor *highLightViewColor;

/**
 *  动画时间
 */
@property(nonatomic, assign)CGFloat duration;

@end
