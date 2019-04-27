//
//  RedView.m
//  ResponderDemo
//
//  Created by 邵广涛 on 2019/4/26.
//  Copyright © 2019 SGT. All rights reserved.
//

#import "RedView.h"
#import "SGTBaseView.h"

@implementation RedView

-(void)findSuperView{
    // 通过遍历view上的响应链来查找SuperView
    UIResponder *responder = self.nextResponder;
    while (responder) {
        if ([responder isKindOfClass:[SGTBaseView class]]) {
            SGTBaseView *superView = (SGTBaseView *)responder;
            SGTLog(@" =========  superView %@ ",superView);
            break;
        }
        responder = responder.nextResponder;
    }
}
- (void)layoutSubviews{
    [super layoutSubviews];
    self.backgroundColor = [UIColor redColor];
}
// 判断一个点是否落在范围内
- (BOOL)pointInside:(CGPoint)point withEvent:(nullable UIEvent *)event{
    BOOL isInside = [super pointInside:point withEvent:event];
    SGTLog(@" -------- pointInside  point %@ isInside %d Event %@",NSStringFromCGPoint(point),isInside,event);
    return isInside;
}
// 此方法返回的View是本次点击事件需要的最佳View
- (nullable UIView *)hitTest:(CGPoint)point withEvent:(nullable UIEvent *)event{
    SGTLog(@" -------- hitTest  point %@  Event %@",NSStringFromCGPoint(point),event);
    // 1.判断当前控件能否接收事件
    if (self.userInteractionEnabled == NO || self.hidden == YES || self.alpha <= 0.01) return nil;
    // 2. 判断点在不在当前控件
    if ([self pointInside:point withEvent:event] == NO) return nil;
    // 3.从后往前遍历自己的子控件
    NSInteger count = self.subviews.count;
    for (NSInteger i = count - 1; i >= 0; i--) {
        UIView *childView = self.subviews[i];
        // 把当前控件上的坐标系转换成子控件上的坐标系
        CGPoint childP = [self convertPoint:point toView:childView];
        UIView *fitView = [childView hitTest:childP withEvent:event];
        if (fitView) { // 寻找到最合适的view
            SGTLog(@" -------- fitView %@",fitView);
            return fitView;
        }
    }
    // 循环结束,表示没有比自己更合适的view
    return self;
    //    return [super hitTest:point withEvent:event];
}
//开始触摸
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event{
    SGTLog(@" -----  touchesBegan  touches %@  event %@",touches,event);
    [super touchesBegan:touches withEvent:event];
    [self.nextResponder touchesBegan:touches withEvent:event];
}
//滑动
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event{
    SGTLog(@" ----  touchesMoved   touches %@  event %@",touches,event);
}
//触摸结束
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event{
    SGTLog(@"  ----  touchesEnded    touches %@  event %@",touches,event);
    [self findSuperView];
}
//触摸取消
- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event{
    SGTLog(@" ----  touchesCancelled    touches %@  event %@",touches,event);
}
- (void)touchesEstimatedPropertiesUpdated:(NSSet<UITouch *> *)touches{
    SGTLog(@" ----  touchesEstimatedPropertiesUpdated   touches %@ ",touches);
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
