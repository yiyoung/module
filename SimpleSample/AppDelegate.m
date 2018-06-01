//
//  AppDelegate.m
//  SimpleSample
//
//  Created by Clayton Kim on 09/04/2018.
//  Copyright © 2018 Bugs. All rights reserved.
//

#import "AppDelegate.h"
#import "CustomSchemeModule.h"
#import "StackViewController.h"
#import "bugs.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

+ (void)initialize
{
	//nsobject의 class method로 해당 클래스가 첫 메세지를 받기 전에 해당 클래스를 initialize함
	//클래스 메소드라서 프로퍼티 사용 못하므로, didFinishLaunchingWithOptions에서 module을 만들어 준 후,
	//customScheme으로 들어올 경우 아래 method에 먼저 들어옴
	[bugs customSchemeModule];
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options
{
	// 여기서 먼저, c.s을 갖고 있는 v.c들이 path를 등록하도록 해야됨. 만약 등록된 게 있으면 바로 handleOpenURL로 넘겨야됨

	if([url.scheme compare:@"bugbugbug"] == NSOrderedSame)
		[self handleOpenUrl:url];
	return YES;
}

- (void)handleOpenUrl:(NSURL *)url
{
	//기존에는 여기서 mainviewcontroller가 rootviewcontroller인지 확인 후 여기에 있는 handleOpenURL 부름
	[bugs.customSchemeModule handleOpenUrl:url];
}

//앱이 제일 처음 시작될 때
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
	
    return YES;
}

//active->inactive로 넘어갈 때
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}

//앱이 background 상태일 때
- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

//앱이 background에서 foreground로 이동 시 (아직 foreground에서 실행중이진 않음)
- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}

//앱이 active 상태가 되어 실행 중일 때
- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

//앱이 종료됨
- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
