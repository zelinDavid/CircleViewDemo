//
//  DVCircleView.m
//  Origan
//
//  Created by David on 17/8/8.
//  Copyright © 2017年 David. All rights reserved.
//

#import "DVCircleView.h"
#import "DVCircleLayer.h"

#define CircleTime 2
#define maxAlpha  0.7
@interface DVCircleView()
 
@property(nonatomic, strong) UIImageView *scanImageView;
@property(nonatomic, strong) DVCircleLayer *circleLayer;

@end

@implementation DVCircleView
-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor =  RGBFromHex(0x00c6f6);
  
        
        DVCircleLayer *layer = [DVCircleLayer layer];
        layer.position = CGPointMake(self.center.x,self.center.y);
        [self.layer addSublayer:layer];
        [layer  setNeedsDisplay];
        _circleLayer = layer;
        
        _scanImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, layer.frame.size.width+4, layer.frame.size.width+4)];
        _scanImageView.image = [UIImage imageNamed:@"扫描动画切图文件"];
        _scanImageView.contentMode  = UIViewContentModeScaleToFill;
        _scanImageView.center =CGPointMake(self.center.x, self.center.y);
        [self addSubview:_scanImageView];
        
      
 
    }
    return  self;
}



-(void)startAnimation {
    CABasicAnimation *animation =  [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    //默认是顺时针效果，若将fromValue和toValue的值互换，则为逆时针效果
    animation.toValue = [NSNumber numberWithFloat:M_PI*2 + M_PI*1/4.000];
    animation.fromValue =  [NSNumber numberWithFloat:  M_PI*1/4.000];
    animation.duration  = 1.5;
    animation.autoreverses = NO;
    animation.fillMode =kCAFillModeForwards;
    animation.repeatCount = 500;
    [self.scanImageView.layer addAnimation:animation forKey:@"rotate"];
    
    [_circleLayer startAnimation];
}

-(void)endAnimation {
    [self.scanImageView.layer removeAnimationForKey:@"rotate"];

    [_circleLayer endAnimation];
}


@end
