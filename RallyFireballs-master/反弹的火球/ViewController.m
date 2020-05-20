//
//  ViewController.m
//  反弹的火球
//
//  Created by 王奥东 on 16/12/3.
//  Copyright © 2016年 王奥东. All rights reserved.
/*111112223333*/

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController {
    
    CGPoint _pos;//每次移动的x,y
    UILabel *_fireBall;//火球
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
    
    _pos = CGPointMake(1, 1);//火球每次移动的x,y
   
    //添加火球
    _fireBall = [[UILabel alloc] init];
    _fireBall.frame = CGRectMake(0, 0, 150, 32);
    _fireBall.text = @"666";
    _fireBall.backgroundColor = UIColor.redColor;
    [self.view addSubview:_fireBall];
    
    [NSTimer scheduledTimerWithTimeInterval:  0.05 target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
    
}

//动画结束后移除黑球
-(void)removeSmoke:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context{
    UIImageView *imageView = (__bridge UIImageView*)(context);
    [imageView removeFromSuperview];
}

-(void)onTimer {
    
    float x = _fireBall.center.x;
    float y = _fireBall.center.y;
    
    _fireBall.center = CGPointMake(_fireBall.center.x + _pos.x, _fireBall.center.y + _pos.y);
    
    //设置左边为0，右边为320，上边为0，下边为460
    //超出范围就取反值
    //由加变减，由减变加
    if (_fireBall.center.x > self.view.bounds.size.width - 75 || _fireBall.center.x < 75) {
        _pos.x = -_pos.x;
    }
    if (_fireBall.center.y > self.view.bounds.size.height - 16 || _fireBall.center.y < 16) {
        _pos.y = -_pos.y;
    }
    
//    //创建黑球
//    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"2"]];
//    //位置为火球的中心 x、y-16
//    imageView.frame = CGRectMake(x-16, y-16, 32, 32);
//    [self.view addSubview:imageView];
    
    //开始动画
    //3s时间里缩小黑球的大小，移动其x、y，让其完全透明
//    [UIView beginAnimations:nil context:(__bridge void *)(imageView)];
//    [UIView setAnimationDuration:2.0];
    //UIViewAnimationCurveEaseOut 结束时缓慢的
    //[UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
//    imageView.frame = CGRectMake(x-6, y-6, 12, 12);
//    [imageView setAlpha:0.0];
   // [UIView setAnimationDelegate:self];
    //移动停止调用此方法
    //[UIView setAnimationDidStopSelector:@selector(removeSmoke:finished:context:)];
    //结束动画
    //[UIView commitAnimations];
    
    
    //让火球保持最前方
    //[self.view bringSubviewToFront:_fireBall];
    
}



@end
