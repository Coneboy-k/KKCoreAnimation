//
//  KKViewController.m
//  KKCoreAnimation
//
//  Created by SunKe on 13-11-6.
//  Copyright (c) 2013年 Coneboy_K. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import "KKViewController.h"

@interface KKViewController ()

@end

@implementation KKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
}


- (void)viewDidAppear:(BOOL)animated
{
    [self moveLayerPosition];
    [self moveLayerScaole];
    [self moveLayerRotate];
    
    [self moveLayer];
}

- (void)moveLayerPosition
{
    
    CALayer *kkLayer = [[CALayer alloc]init];
    kkLayer.backgroundColor = [[UIColor blueColor]CGColor];
    kkLayer.frame = CGRectMake(50, 65, 40, 40);
    kkLayer.cornerRadius = 5;
    [self.view.layer addSublayer:kkLayer];
    
    // 移动kkLayer的position
	CABasicAnimation *animation  = [CABasicAnimation animationWithKeyPath:@"position"];
	animation.fromValue = [NSValue valueWithCGPoint:kkLayer.position];
	CGPoint toPoint = kkLayer.position;
	toPoint.x += 180;
	animation.toValue = [NSValue valueWithCGPoint:toPoint];
    animation.autoreverses = YES;
    animation.duration = 3;
    animation.repeatCount = NSNotFound;
	
    [kkLayer addAnimation:animation forKey:@"animationPosition"];

}

- (void)moveLayerScaole
{
    
    CALayer *kkLayer = [[CALayer alloc]init];
    kkLayer.backgroundColor = [[UIColor greenColor]CGColor];
    kkLayer.frame = CGRectMake(50, 131, 40, 40);
    kkLayer.cornerRadius = 5;
    [self.view.layer addSublayer:kkLayer];
    
    // 对kkLayer进行放大缩小
	CABasicAnimation *scaoleAnimation  = [CABasicAnimation animationWithKeyPath:@"transform.scale.x"];
	scaoleAnimation.duration = 3;
    scaoleAnimation.autoreverses = YES;
	scaoleAnimation.fromValue = [NSNumber numberWithFloat:1.0];
	scaoleAnimation.toValue = [NSNumber numberWithFloat:2.5];
    scaoleAnimation.fillMode = kCAFillModeForwards;
    scaoleAnimation.repeatCount = NSNotFound;
    
    [kkLayer addAnimation:scaoleAnimation forKey:@"animationScaole"];

	
}

- (void)moveLayerRotate
{
    
    CALayer *kkLayer = [[CALayer alloc]init];
    kkLayer.backgroundColor = [[UIColor grayColor]CGColor];
    kkLayer.frame = CGRectMake(50, 217, 40, 40);
    kkLayer.cornerRadius = 5;
    [self.view.layer addSublayer:kkLayer];
    
    // 以x轴进行旋转
	CABasicAnimation *rotateAnimation  = [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
	rotateAnimation.fromValue = [NSNumber numberWithFloat:0.0];
	rotateAnimation.toValue = [NSNumber numberWithFloat:6.0 * M_PI];
    rotateAnimation.duration = 3;
    rotateAnimation.repeatCount = NSNotFound;
    
    [kkLayer addAnimation:rotateAnimation forKey:@"animationRotate"];

}


- (void)moveLayer
{
    
    CALayer *kkLayer = [[CALayer alloc]init];
    kkLayer.backgroundColor = [[UIColor redColor]CGColor];
    kkLayer.frame = CGRectMake(50, 295, 40, 40);
    kkLayer.cornerRadius = 5;
    [self.view.layer addSublayer:kkLayer];
    
    // 移动kkLayer的position
	CABasicAnimation *animation  = [CABasicAnimation animationWithKeyPath:@"position"];
	animation.fromValue = [NSValue valueWithCGPoint:kkLayer.position];
	CGPoint toPoint = kkLayer.position;
	toPoint.x += 180;
	animation.toValue = [NSValue valueWithCGPoint:toPoint];
	
    // 以x轴进行旋转
	CABasicAnimation *rotateAnimation  = [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
	rotateAnimation.fromValue = [NSNumber numberWithFloat:0.0];
	rotateAnimation.toValue = [NSNumber numberWithFloat:6.0 * M_PI];
    
    // 对kkLayer进行放大缩小
	CABasicAnimation *scaoleAnimation  = [CABasicAnimation animationWithKeyPath:@"transform.scale.x"];
	scaoleAnimation.duration = 3;
    scaoleAnimation.autoreverses = YES;
	scaoleAnimation.fromValue = [NSNumber numberWithFloat:1.0];
	scaoleAnimation.toValue = [NSNumber numberWithFloat:2.5];
    scaoleAnimation.fillMode = kCAFillModeForwards;
	
	// 把上面的动画组合起来
	CAAnimationGroup *group = [CAAnimationGroup animation];
	group.autoreverses = YES;  // 完成后反向完成
	group.duration = 3.0;
	group.animations = [NSArray arrayWithObjects:animation,rotateAnimation, scaoleAnimation, nil];
	group.repeatCount = NSNotFound;
    
    group.fillMode = kCAFillModeForwards;
	
	[kkLayer addAnimation:group forKey:@"kkLayerMove"];
  
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
