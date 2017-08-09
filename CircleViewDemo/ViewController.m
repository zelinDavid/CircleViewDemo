//
//  ViewController.m
//  CircleViewDemo
//
//  Created by David on 17/8/9.
//  Copyright © 2017年 David. All rights reserved.
//

#import "ViewController.h"
#import "DVCircleView.h"
#import "DVCircleLayer.h"

@interface ViewController ()
@property(nonatomic, strong) DVCircleView *circleView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    DVCircleView *circleView = [[DVCircleView alloc]initWithFrame:CGRectMake(0, 0, UI_WIDTH, UI_WIDTH)];
    circleView.center = CGPointMake(UI_CenterX, UI_HEIGHT*0.5);
    [self.view addSubview:circleView];
    _circleView = circleView;
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    static int i = 0;
    i ++;
    
    if (i%2) {
        [_circleView startAnimation];
    }else {
        [_circleView endAnimation];
        
    }
}




@end
