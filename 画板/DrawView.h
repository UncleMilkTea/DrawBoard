//
//  DrawView.h
//  画板
//
//  Created by 侯玉昆 on 16/3/4.
//  Copyright © 2016年 侯玉昆. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrawView : UIView
//!> 线宽
@property(assign,nonatomic) CGFloat lineWidth;
//!> 线色
@property(strong,nonatomic) UIColor *lineColor;
//!> 清屏
- (void)clearScreen;
//!> 回退
- (void)back;
//!> 橡皮
- (void)easer;
//!> 截屏
- (UIImage *)screenShot;

@end
