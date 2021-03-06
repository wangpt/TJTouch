//
//  AppDelegate.m
//  TJTouch
//
//  Created by 王朋涛 on 16/9/21.
//  Copyright © 2016年 tao. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThreeViewController.h"
#import "DetailViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];

    MainViewController *mainView = [storyboard instantiateViewControllerWithIdentifier:@"mainController"];
    UINavigationController *mainNav = [[UINavigationController alloc] initWithRootViewController:mainView];
    self.window.rootViewController =mainNav;
    [self.window makeKeyAndVisible];
    /*3D Touch*/
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 9.0) {//判定系统版本
        [self create3DTouchShotItems];//追加
        UIApplicationShortcutItem *shortcutItem = [launchOptions objectForKeyedSubscript:UIApplicationLaunchOptionsShortcutItemKey];
        
        if(shortcutItem)
        {
            [self quickActionWithShortcutItem:shortcutItem];
            return NO;//防止重复调用3DTouch代理
        }
    }
    
    
    return YES;
}
#pragma mark - 3D Touch
- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    MainViewController *mainView = [storyboard instantiateViewControllerWithIdentifier:@"mainController"];
    UINavigationController *mainNav = [[UINavigationController alloc] initWithRootViewController:mainView];
    self.window.rootViewController =mainNav;
    [mainView setSelectedIndex:1];

    [self quickActionWithShortcutItem:shortcutItem];
    if (completionHandler) {
        completionHandler(YES);
    }
}

- (void)quickActionWithShortcutItem:(UIApplicationShortcutItem *)shortcutItem
{
    [self openControllerWithItemType:shortcutItem.type];

    
}


#pragma mark - 跳转页面
- (void)openControllerWithItemType:(NSString *)type{
    UIWindow *sharedWindow= [[[UIApplication sharedApplication] delegate] window];
    if ([type isEqualToString:@"com.tjzl.updata"]) {
        UINavigationController *nav=(UINavigationController *)sharedWindow.rootViewController;
        MainViewController *mainView = nav.viewControllers[0];
        [mainView setSelectedIndex:0];
        DetailViewController *childVC =[DetailViewController new];
        [nav pushViewController:childVC animated:YES];
    }else if ([type isEqualToString:@"com.tjzl.video"]){
        UINavigationController *nav=(UINavigationController *)sharedWindow.rootViewController;
        MainViewController *mainView = nav.viewControllers[0];
        [mainView setSelectedIndex:1];

    }else if ([type isEqualToString:@"com.tjzl.duty"]){
        UINavigationController *nav=(UINavigationController *)sharedWindow.rootViewController;
        MainViewController *mainView = nav.viewControllers[0];
        [mainView setSelectedIndex:2];
        DetailViewController *childVC =[DetailViewController new];
        [nav pushViewController:childVC animated:YES];
    }else if ([type isEqualToString:@"com.tjzl.task"]){
        UINavigationController *nav=(UINavigationController *)sharedWindow.rootViewController;
        MainViewController *mainView = nav.viewControllers[0];
        [mainView setSelectedIndex:2];
        DetailViewController *childVC =[DetailViewController new];
        [nav pushViewController:childVC animated:YES];
    }
    
    
    
}


- (void)create3DTouchShotItems {
    //创建快捷item的icon UIApplicationShortcutItemIconFile
    UIApplicationShortcutIcon *icon1 = [UIApplicationShortcutIcon iconWithTemplateImageName:@"main_3dtouch_updata"];
    UIApplicationShortcutIcon *icon2 = [UIApplicationShortcutIcon iconWithTemplateImageName:@"main_3dtouch_video"];
    UIApplicationShortcutIcon *icon3 = [UIApplicationShortcutIcon iconWithTemplateImageName:@"main_3dtouch_duty"];
    UIApplicationShortcutIcon *icon4 = [UIApplicationShortcutIcon iconWithTemplateImageName:@"main_3dtouch_task"];
    //创建ShortcutItem
    UIMutableApplicationShortcutItem *item1 = [[UIMutableApplicationShortcutItem alloc]initWithType:@"com.tjzl.updata" localizedTitle:@"信息上报" localizedSubtitle:nil icon:icon1 userInfo:nil];
    UIMutableApplicationShortcutItem *item2 = [[UIMutableApplicationShortcutItem alloc]initWithType:@"com.tjzl.video" localizedTitle:@"视频会议" localizedSubtitle:nil icon:icon2 userInfo:nil];
    UIMutableApplicationShortcutItem *item3 = [[UIMutableApplicationShortcutItem alloc]initWithType:@"com.tjzl.duty" localizedTitle:@"值班人员" localizedSubtitle:nil icon:icon3 userInfo:nil];
    UIMutableApplicationShortcutItem *item4 = [[UIMutableApplicationShortcutItem alloc]initWithType:@"com.tjzl.task" localizedTitle:@"我的任务" localizedSubtitle:nil icon:icon4 userInfo:nil];
    NSArray *items = @[item1,item2,item3,item4];
    [UIApplication sharedApplication].shortcutItems = items;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
