//
//  DrawView.m
//  画板
//
//  Created by 侯玉昆 on 16/3/4.
//  Copyright © 2016年 侯玉昆. All rights reserved.
//

#import "DrawView.h"
#import "MyBezierPath.h"
@interface DrawView ()

@property(nonatomic,strong)NSMutableArray *pathArray;

@end
@implementation DrawView

- (void)clearScreen{ //!> 清屏
    
    [self.pathArray removeAllObjects];
    
    //重绘
    [self setNeedsDisplay];
    
}

- (void)back{ //!> 回退
    
    [self.pathArray removeLastObject];
    
    [self setNeedsDisplay];
    
}

- (void)easer{ //!> 橡皮
    
    _lineColor = self.backgroundColor;
    
    
    
}

- (UIImage *)screenShot{ //!> 截屏(用图形上下文截屏)
    //开启图形上下文
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, 0);
    
    //获取当前的图形上下文
    CGContextRef ref = UIGraphicsGetCurrentContext();
    
    //将当前的View渲染到图形上下文中
    [self.layer renderInContext:ref];
    
    //从上下文中获取图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    //关闭图形上下文
    
    UIGraphicsEndImageContext();

    return image;
}

//开始触摸的时候获取触摸点
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    //获取触摸点
    CGPoint loc = [touches.anyObject locationInView:self];
    
    //创建路径
    
    MyBezierPath *path= [MyBezierPath bezierPath];
    
    path.lineColor = _lineColor;
    
    path.lineWidth = self.lineWidth;
    
    [path moveToPoint:loc];
    
    [self.pathArray addObject:path];
    

}
//移动的时候绘制图形
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    CGPoint loc = [touches.anyObject locationInView:self];
    
    [self.pathArray.lastObject addLineToPoint:loc];

    
    //绘制
    [self setNeedsDisplay];
    

}

//绘制的方法

- (void)drawRect:(CGRect)rect{

    for (MyBezierPath *path in self.pathArray) {
        
        //设置渲染
        [path.lineColor setStroke];
        
        path.lineJoinStyle = kCGLineJoinRound;
        
        path.lineCapStyle = kCGLineCapRound;
       
        //渲染
        [path stroke];
        
    }



}

- (NSMutableArray *)pathArray{
    
    if (!_pathArray) {
        
        _pathArray = [NSMutableArray array];
    }
    return _pathArray;
}

@end
