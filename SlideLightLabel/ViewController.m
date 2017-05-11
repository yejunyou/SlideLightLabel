//
//  ViewController.m
//  SlideLightLabel
//
//  Created by yejunyou on 2017/5/11.
//  Copyright © 2017年 yejunyou. All rights reserved.
//

#import "ViewController.h"
#import "CoverView.h"

@interface ViewController ()
@property (nonatomic, strong) UILabel *textLabel;
@property (nonatomic, strong) CoverView *coverView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.textLabel];
    [self.view addSubview:self.coverView];
}

- (void)viewDidPan:(UIPanGestureRecognizer *)pan
{
    CGPoint offert = [pan translationInView:self.view];
    CGFloat x = _coverView.center.x + offert.x;
    CGFloat y = _coverView.center.y + offert.y;
    
    _coverView.center = CGPointMake(x, y);
    [pan setTranslation:CGPointZero inView:_coverView];
}

- (CoverView *)coverView
{
    if (!_coverView) {
        CGRect frame = CGRectMake(0, self.textLabel.y, self.textLabel.width * 2, self.textLabel.height);
        _coverView = [[CoverView alloc] initWithFrame:frame];
        
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(viewDidPan:)];
        [_coverView addGestureRecognizer:pan];
    }
    return _coverView;
}

- (UILabel *)textLabel
{
    if (_textLabel == nil) {
        _textLabel  = [[UILabel alloc] init];
        _textLabel.frame = CGRectMake(0, ScreenHeight/2, ScreenWidth, 104);
        _textLabel.text = @">>> 滑动来解锁 >>>";
        _textLabel.font = [UIFont systemFontOfSize:40];
        _textLabel.textAlignment = NSTextAlignmentCenter;
        _textLabel.textColor = [UIColor whiteColor];
        _textLabel.backgroundColor = [UIColor grayColor];
    }
    return _textLabel;
}

@end
