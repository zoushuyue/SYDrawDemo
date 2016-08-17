//
//  MyView.m
//  SYDrawDemo
//
//  Created by mac1 on 16/8/16.
//  Copyright © 2016年 fuxi. All rights reserved.
//

#import "MyView.h"
#import "myLayerDelegate.h"



@implementation MyView

- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        
        
        
    }
    return self;
}
- (void) drawRect: (CGRect) rect {
    
    //----------------way1---------------
    //以这个坐标CGRectMake(0, 0, 100, 100)画一个圆
    UIBezierPath *p = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 100, 100)];
    
    [[UIColor blueColor] setFill];
    
    [p fill];
    
    //----------------way2----------------
    //获取一个上下文
    CGContextRef con = UIGraphicsGetCurrentContext();
    //画一个圆
    CGContextAddEllipseInRect(con, CGRectMake(0, 105, 100, 100));
    //设置颜色
    CGContextSetFillColorWithColor(con, [UIColor orangeColor].CGColor);
    //渲染
    CGContextFillPath(con);
    
   
}

@end

@implementation myLayerDelegate

- (void) drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
    
    UIGraphicsPushContext(ctx);
    
    UIBezierPath *p = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 200, 100, 100)];;
    [[UIColor greenColor] setFill];

    [p fill];
    
    UIGraphicsPopContext();
}
@end























