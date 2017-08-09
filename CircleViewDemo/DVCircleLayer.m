//
//  DVCircleLayer.m
//  Origan
//
//  Created by David on 17/8/9.
//  Copyright © 2017年 David. All rights reserved.
//

#import "DVCircleLayer.h"
#define CircleTime 2
#define maxAlpha  0.7

inline CGFloat FitFloat(CGFloat f){
    if (UI_WIDTH == 320) {
        f = f /375 * 320;
    }
    if (UI_WIDTH == 414 ) {
        f = f /375 * 414;
    }///
    return f;
}

@interface DVCircleLayer ()
@property (nonatomic, assign) NSInteger time;
@property (nonatomic, assign)CGFloat alpha;
@property(nonatomic, strong) CADisplayLink *link;

@end

@implementation DVCircleLayer

+(instancetype)layer {
    DVCircleLayer *layer = [super layer];
    layer.frame = CGRectMake(0, 0,  (FitFloat(23)+ FitFloat(29)*5)*2+2,  (FitFloat(23)+ FitFloat(29)*5)*2+2);
    
    layer.link = [CADisplayLink displayLinkWithTarget:layer selector:@selector(hhhhhh)];
    [ layer.link addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
     layer.link.paused = YES;
    
    return layer;
    
}

-(void)drawInContext:(CGContextRef)ctx {
     CGContextSetLineWidth(ctx, 1.5);
    CGContextSetRGBStrokeColor(ctx, 1, 1, 1, 0.25);
    for (NSInteger i = 0; i  <6;  i ++) {
        CGContextAddArc(ctx, self.frame.size.width*0.5 , self.frame.size.width *0.5, FitFloat(23)+ FitFloat(29)*i, 0, 2*M_PI, 0); //添加一个圆
        CGContextDrawPath(ctx, kCGPathStroke);
    }
    
    NSInteger num = (NSInteger)_time /600.000/(CircleTime/60.00); //600ms 0.01 *600 = 1ms
    CGContextSetStrokeColorWithColor(ctx, RGBAFromHex(0xffffff, _alpha).CGColor);
    CGContextAddArc(ctx, self.frame.size.width *0.5 , self.frame.size.width *0.5, FitFloat(23)+ FitFloat(29)*num, 0, 2*M_PI, 0); //添加一个圆
    CGContextDrawPath(ctx, kCGPathStroke);
    
    
    if (_time >= 60*CircleTime) {
        _time = 0;
    }
    
    NSLog(@"%f %ld",_alpha,num);
    
}


-(void)hhhhhh { // 3S 一圈  3*5 x = 0.5
    _time  ++; // 60代表一秒   maxalpha sin(_time/60.0 12.00*CircleTime ) = circletime/6/2
    
    _alpha = maxAlpha *fabs(sin( 12*_time*1.000/(CircleTime*60)*M_PI_2));
    
    [self setNeedsDisplay];
 }


-(void)startAnimation {
    self.link.paused = NO;
}


-(void)endAnimation {
    self.link.paused = YES;
}



@end
