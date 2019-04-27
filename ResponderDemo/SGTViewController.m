//
//  SGTViewController.m
//  ResponderDemo
//
//  Created by 邵广涛 on 2019/4/26.
//  Copyright © 2019 SGT. All rights reserved.
//

#import "SGTViewController.h"
#import "RedView.h"
#import "OrangeView.h"
#import "SGTBaseView.h"

@interface SGTViewController ()

@end

@implementation SGTViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    SGTBaseView *baseView  = [[SGTBaseView alloc]initWithFrame:self.view.bounds];
    baseView.backgroundColor = [UIColor yellowColor];
    self.view = baseView;
    
    RedView *redView = [[RedView alloc]init];
    redView.frame = CGRectMake(100, 100, 200, 100);
    [self.view addSubview:redView];
    
    
    OrangeView *orangeView = [[OrangeView alloc]init];
    orangeView.frame = CGRectMake(270, 150, 100, 100);
    [self.view addSubview:orangeView];
    
 
}


//开始触摸
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event{
    SGTLog(@" -----  touchesBegan  touches %@  event %@",touches,event);
    [self.nextResponder touchesBegan:touches withEvent:event];
}
//滑动
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event{
    SGTLog(@" ----  touchesMoved   touches %@  event %@",touches,event);
}
//触摸结束
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event{
    SGTLog(@"  ----  touchesEnded    touches %@  event %@",touches,event);
}
//触摸取消
- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event{
    SGTLog(@" ----  touchesCancelled    touches %@  event %@",touches,event);
}
- (void)touchesEstimatedPropertiesUpdated:(NSSet<UITouch *> *)touches{
    SGTLog(@" ----  touchesEstimatedPropertiesUpdated   touches %@ ",touches);
}









/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
