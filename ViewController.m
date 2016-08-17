//
//  ViewController.m
//  SYDrawDemo
//
//  Created by mac1 on 16/8/16.
//  Copyright © 2016年 fuxi. All rights reserved.
//

#import "ViewController.h"
#import "MyView.h"

@interface ViewController () {
    
    myLayerDelegate *_layerDelegate;
}



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    [self drawMyViewByUIKit];
//    [self drawMyViewByCore];
    
    MyView *view = [[MyView alloc] initWithFrame:self.view.bounds];
    
    CALayer *layer = [CALayer layer];
    
    _layerDelegate = [[myLayerDelegate alloc] init];
    
    layer.delegate = _layerDelegate;
    
    [view.layer addSublayer:layer];
    
    //必须调用的方法
    [view setNeedsDisplay];
}

//----------第一种绘图形式：在UIView的子类方法drawRect：中绘制一个蓝色圆，使用UIKit在Cocoa为我们提供的当前上下文中完成绘图任务。-----------
//----------第二种绘图形式：使用Core Graphics实现绘制蓝色圆。----------
- (void) drawMyViewByUIKit {
    
    //MyView
    MyView *myView = [[MyView alloc] initWithFrame:self.view.frame];
    myView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:myView];
    
    CALayer *layer = [CALayer layer];
    CGContextRef context = UIGraphicsGetCurrentContext();
    [myView drawLayer: layer  inContext:context];
}


- (void) drawMyViewByDelegae {
    
}




















@end
