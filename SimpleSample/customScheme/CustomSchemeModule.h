//
//  CustomSchemeModule.h
//  SimpleSample
//
//  Created by yiyoung on 2018. 5. 16..
//  Copyright © 2018년 Bugs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CommonSegueControl.h"

@class CustomSchemeActions;
@class schemeNode;

@protocol CustomSchemeContext <CommonSegueControl>

//info block에 들어갈 내용. 즉, navi, play, 띄워야 할 viewcontroller에 대한 정보
@property (nonnull, readonly)	UIViewController	*	presentingViewController;
@property (nonatomic, readonly)	BOOL					naviOn;
@property (nonatomic, readonly) BOOL					play;

@end

typedef void(^CustomSchemeInfoBlock)(id <CustomSchemeContext> _Nullable context);

@interface schemeNode : NSObject
{
	NSMutableArray * _childrenArray;
	NSMutableSet * _childrenSet;
}

@property (nonatomic) NSString																*	nodeName;
@property (nonatomic) NSMutableDictionary	<NSString *, NSSet <schemeNode *> *>			*	childrenNode;
@property (nonatomic) NSMutableDictionary	<NSString *, schemeNode *>						*	child;
//@property (nonatomic, strong)	NSSet * linkedNodes;
@property (nonatomic) CustomSchemeInfoBlock _Nullable	infoBlock;

- (void)addChildNode:(schemeNode *)node;
- (NSArray *)childrenArray;

@end

@interface connectNode : NSObject

- (void)addEdgeFromNode:(schemeNode *)parent toNode:(schemeNode *)child;

@end

@interface CustomSchemeModule : NSObject

- (void)handleOpenUrl:(NSURL *)url;
- (void)makePathArray:(NSURL *)url;

@end


// CustomScheme의 action
@interface CustomSchemeActions : NSObject
//@property (nonatomic, readonly) CustomSchemeInfoBlock _Nullable infoBlock;

+ (instancetype _Nonnull)infoBlockForCustomScheme:(CustomSchemeInfoBlock __nullable)actionInfo;
@end


