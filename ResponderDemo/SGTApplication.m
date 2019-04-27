//
//  SGTApplication.m
//  ResponderDemo
//
//  Created by 邵广涛 on 2019/4/26.
//  Copyright © 2019 SGT. All rights reserved.
//

#import "SGTApplication.h"

@implementation SGTApplication

//开始触摸
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event{
    SGTLog(@"-----  touchesBegan  touches %@  event %@",touches,event);
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

@end
