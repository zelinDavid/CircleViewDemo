//
//  DVCircleLayer.h
//  Origan
//
//  Created by David on 17/8/9.
//  Copyright © 2017年 David. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

#define UI_WIDTH             [UIScreen mainScreen].bounds.size.width

#define UI_CenterX             [UIScreen mainScreen].bounds.size.width*0.5

#define UI_HEIGHT            ([UIScreen mainScreen].bounds.size.height - 64)

#define RGBAFromHex(rgbValue,A) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >>  8))/255.0 \
blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0 \
alpha:A]

#define RGBFromHex(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >>  8))/255.0 \
blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0 \
alpha:1.0]

FOUNDATION_EXTERN CGFloat FitFloat(CGFloat f);

@interface DVCircleLayer : CAShapeLayer


-(void)startAnimation;

-(void)endAnimation;

@end
