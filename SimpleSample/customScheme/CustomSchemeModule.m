//
//  CustomSchemeModule.m
//  SimpleSample
//
//  Created by yiyoung on 2018. 5. 16..
//  Copyright © 2018년 Bugs. All rights reserved.
//

#import "CustomSchemeModule.h"

@class bugs;

@interface CustomSchemeModule()
{
	BOOL first;
}

@property (nonatomic, strong)	NSMutableArray * schemeNodes;
@property (nonatomic, strong)	NSMutableSet	<schemeNode *> * schemeNodeSet;
@property (nonatomic, strong)	NSMutableDictionary	 * schemeNodeDic;
@property (nonatomic, strong)	schemeNode	*	rootNode;
@end

@implementation CustomSchemeModule

- (instancetype)init
{
    if(self = [super init])
    {
		self->_schemeNodes = [NSMutableArray array];
		self->_schemeNodeSet = [NSMutableSet set];
		self->_schemeNodeDic = [NSMutableDictionary dictionary];
		self->_rootNode = [schemeNode new];
		first = YES;
    }
    return self;
}

- (NSMutableArray *)makeTree:(NSMutableArray *)registedPath
{
	NSMutableArray * temp = [NSMutableArray new];
	[temp addObject:@"root"];
	[temp addObjectsFromArray:registedPath];
	
	for(NSUInteger i = 0; i < temp.count; i++)
	{
		NSMutableDictionary * dict = [NSMutableDictionary dictionary];
		schemeNode * node = [schemeNode new];
		if(i != (temp.count-1))
			node.nodeName = temp[i+1];
		[dict setObject:(i != (temp.count-1)) ? node : @"" forKey:temp[i]];
		[_schemeNodes addObject:dict];
	}
	return _schemeNodes;
	
//	_rootNode.nodeName = @"root";
//	for(NSString * path in registedPath)
//	{
//		schemeNode * node = [schemeNode new];
//		node.nodeName = path;
//		[_rootNode addChildNode:node];
//	}
	
//	NSMutableDictionary * tree = [NSMutableDictionary dictionary];
//	for(NSString * path in registedPath)
//	{
//		NSMutableDictionary * node = [self addPath:registedPath toTree:tree];
//		node[@"root"] = path;
//	}
}

- (NSMutableDictionary *)addPath:(NSArray *)pathString toTree:(NSMutableDictionary *)tree
{
	NSMutableDictionary * node = tree;
	
	for(NSUInteger i = 0; i < pathString.count-1; i++)
	{
		NSString * key = pathString[i];
		if(node[key] == nil)
		{
			node[key] = [NSMutableDictionary dictionary];
		}
		node = node[key];
	}
	
	NSString * name = pathString.lastObject;
	if(name.length > 0)
	{
		node[name] = [NSMutableDictionary dictionary];
		node = node[name];
	}
	return node;
}


//처음 url을 받아서 parameter를 제외하고 mutableArray에 넣는 작업
- (void)makePathArray:(NSURL *)url
{
	NSMutableArray * urlArray = [NSMutableArray array];

	[urlArray addObjectsFromArray:@[url.scheme, url.host]]; // scheme이랑 host는 여러개가 있을 수 있으니깐 여기에 대한 처리는 나중에 해놓기
	[urlArray addObjectsFromArray:[self makePathComponents:url]];
	
//	NSMutableArray <schemeNode *> * temp = [NSMutableArray array];
//	for(NSUInteger i = 0; i < urlArray.count; i++)
//	{
//		schemeNode * tmpNode = [schemeNode new];
//		tmpNode.nodeName = urlArray[i];
//		[temp addObject:tmpNode];
//	}
	[self makeTree:urlArray];
//	[self makeNodes:temp];
}

//param을 제외한 path
- (NSMutableArray *)makePathComponents:(NSURL *)schemeURL
{
	NSMutableArray * reDefinedPath = [NSMutableArray array];
	
	if([schemeURL.scheme compare:@"bugbugbug"] == NSOrderedSame)
	{
		[schemeURL.pathComponents enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
			if(([obj isEqual:@"/"] == NO) && ([obj isKindOfClass:NSString.class] == YES))
				[reDefinedPath addObject:obj];
		}];
	}
	return reDefinedPath;
}

- (NSMutableDictionary *)makeNodes:(NSMutableArray <schemeNode *> *)reDefinedPath
{
	//temp를 dictionary로 하면 안 됨. 만약
//	[reDefinedPath enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//		schemeNode * tmpNode = [schemeNode new];
//		tmpNode.nodeName = [obj nodeName];
//
//		if(self.schemeNodeSet.count == 0)
//		{
//			self->_rootNode.nodeName = @"";
//			self->_rootNode.childrenNode = @{self->_rootNode.nodeName : tmpNode}.mutableCopy;
//			[self.schemeNodeSet addObject:self->_rootNode];
//		}
//		else
//		{
//			NSArray <schemeNode *> * test = self.schemeNodeSet.allObjects;
//
//			for(NSUInteger i=0; i < test.count ; i++)
//			{
//				if(![test[i].nodeName isEqualToString:tmpNode.nodeName])
//				{
//					if(idx>0)
//					{
//						[test valueForKey:[reDefinedPath[idx-1] nodeName]];
//						[reDefinedPath[idx-1].childrenNode setObject:[NSSet setWithObject:tmpNode] forKey:reDefinedPath[idx-1].nodeName];
//						[self.schemeNodeSet addObject:tmpNode];
//					}
//				}
//			}
//		}
//	}];
	
	[reDefinedPath enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
		schemeNode * tmpNode = [schemeNode new];
		tmpNode.nodeName = [obj nodeName];
		
		if(self.schemeNodeDic.count == 0)
		{
			self->_rootNode.nodeName = @"";
			self->_rootNode.childrenNode = @{self->_rootNode.nodeName : tmpNode}.mutableCopy;
			[self.schemeNodeDic setObject:[NSMutableSet setWithObjects:self->_rootNode, nil] forKey:@""];
		}
		else
		{
//			NSArray <schemeNode *> * test = self.schemeNodeSet.allObjects;
			
//			for(NSUInteger i=0; i < self.schemeNodeDic.count ; i++)
//			{
//				if(![self.schemeNodeDic isEqualToString:tmpNode.nodeName])
//				{
//					if(idx>0)
//					{
//						[test valueForKey:[reDefinedPath[idx-1] nodeName]];
//						[reDefinedPath[idx-1].childrenNode setObject:[NSSet setWithObject:tmpNode] forKey:reDefinedPath[idx-1].nodeName];
//						[self.schemeNodeSet addObject:tmpNode];
//					}
//				}
//			}
			
			if([self.schemeNodeDic valueForKey:tmpNode.nodeName] == nil)
			{
				[self.schemeNodeDic setObject:[NSMutableSet setWithObject:tmpNode] forKey:tmpNode.nodeName];
				[self.schemeNodeDic setObject:[NSMutableSet setWithObject:tmpNode] forKey:[reDefinedPath[idx-1] nodeName]];
			}
		}
	}];
	
	//

	
	return self.schemeNodeDic;
}

//parameter 값을 key, value로 dictionary에 저장
- (NSDictionary *)paramsOfURL:(NSString *)query
{
	NSMutableDictionary * params = [NSMutableDictionary dictionary];
	
	NSArray * param = [query componentsSeparatedByString:@"&"]; //separate
	for(NSString * args in param)
	{
		NSRange range = [args rangeOfString:@"="]; // 해당 string의 range
		if(range.location != NSNotFound)
		{
			NSUInteger locationOfValue = range.location + range.length;
			
			NSString * key = [[args substringWithRange:NSMakeRange(0, range.location)] stringByRemovingPercentEncoding];
			NSString * value = [[args substringWithRange:NSMakeRange(locationOfValue, range.length - locationOfValue)] stringByRemovingPercentEncoding];
			params[key] = value;
		}
	}
	return params;
}

- (NSString *)mappingSchemeURL:(NSMutableArray <schemeNode *> *)searchingNode
{
	NSMutableSet * visitedNodes = [NSMutableSet setWithObject:searchingNode]; // 방문한 node 저장 후 child로 갔을 때 일치하는 데이터 없으면 다시 돌아가기 위한 set
	NSMutableArray <schemeNode *> * queue = [NSMutableArray arrayWithObject:searchingNode]; // 일치하는 node 저장용

	while([queue count])
	{
		NSSet * newNodes = [[queue firstObject] valueForKey:[queue firstObject].nodeName];
		for(schemeNode * newNode in newNodes)
		{
			if(![visitedNodes containsObject:newNode])
			{
				[visitedNodes addObject:newNode];
				[queue addObject:newNode];
			}
		}
		[queue removeObjectAtIndex:0]; // search 끝나면 pop
	}
	
	
	
	NSString * mappingURL;
	
	return mappingURL;
}

- (void)handleOpenUrl:(NSURL *)url
{
	//외부에서 path 들어오면 각각을 node 단위로 나눈 뒤 mapping table로 보내 ? string으로 보내도 될 듯
	NSMutableArray * urlArray = [NSMutableArray array];
	
	[urlArray addObjectsFromArray:@[url.scheme, url.host]]; // scheme이랑 host는 여러개가 있을 수 있으니깐 여기에 대한 처리는 나중에 해놓기
	[urlArray addObjectsFromArray:[self makePathComponents:url]];
	
	NSMutableArray <schemeNode *> * temp = [NSMutableArray array];
	for(NSUInteger i = 0; i < urlArray.count; i++)
	{
		schemeNode * tmpNode = [schemeNode new];
		tmpNode.nodeName = urlArray[i];
		[temp addObject:tmpNode];
	}
	[self mappingSchemeURL:temp];
}

@end

#pragma mark - actions

@implementation CustomSchemeActions

+ (instancetype _Nonnull)infoBlockForCustomScheme:(CustomSchemeInfoBlock)actionInfo
{
	return [[self alloc] initWithInfoBlock:actionInfo];
}

- (instancetype)initWithInfoBlock : (CustomSchemeInfoBlock)info
{
	if (self = [super init])
	{
//		_infoBlock = info;
	}
	return self;
}

#pragma mark - node

@end

@implementation schemeNode

- (id)init
{
	self = [super init];
	if (self)
	{
		_childrenArray = [NSMutableArray new];
		
//		self.childrenNode = [NSMutableDictionary dictionary];
	}
	return self;
}

- (void)addChildNode:(schemeNode *)node
{
//	if (![_childrenArray containsObject:node])
//		[_childrenArray addObject:node];
	
}

- (NSArray *)childrenArray
{
	return _childrenArray;
}

@end

@implementation connectNode

- (void)addEdgeFromNode:(schemeNode *)parent toNode:(schemeNode *)child
{
	[parent addChildNode:child];
}

@end
