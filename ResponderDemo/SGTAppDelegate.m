//
//  SGTAppDelegate.m
//  ResponderDemo
//
//  Created by 邵广涛 on 2019/4/26.
//  Copyright © 2019 SGT. All rights reserved.
//

#import "SGTAppDelegate.h"

#import "SGTWindow.h"
#import "SGTViewController.h"

@implementation SGTAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[SGTWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [SGTViewController new];
    [self.window makeKeyAndVisible];

    return YES;
}

// 即将失去活动状态的时候调用(失去焦点, 不可交互)
- (void)applicationWillResignActive:(UIApplication *)application
{
    SGTLog(@"ResignActive");
}

// 重新获取焦点(能够和用户交互)
- (void)applicationDidBecomeActive:(UIApplication *)application
{
    SGTLog(@"BecomeActive");
}

// 应用程序进入后台的时候调用
// 一般在该方法中保存应用程序的数据, 以及状态
- (void)applicationDidEnterBackground:(UIApplication *)application
{
    SGTLog(@"Background");
}

// 应用程序即将进入前台的时候调用
// 一般在该方法中恢复应用程序的数据,以及状态
- (void)applicationWillEnterForeground:(UIApplication *)application
{
    SGTLog(@"Foreground");
}

// 应用程序即将被销毁的时候会调用该方法
// 注意:如果应用程序处于挂起状态的时候无法调用该方法
- (void)applicationWillTerminate:(UIApplication *)application
{
    SGTLog(@"WillTerminate");

}

// 应用程序接收到内存警告的时候就会调用
// 一般在该方法中释放掉不需要的内存
- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application
{
    SGTLog(@"MemoryWarning");
}
@end

