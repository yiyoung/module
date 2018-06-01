//
//  bugs.m
//  SimpleSample
//
//  Created by yiyoung on 2018. 5. 21..
//  Copyright © 2018년 Bugs. All rights reserved.
//

#import "bugs.h"

@implementation bugs

+ (CustomSchemeModule *)customSchemeModule
{
	static CustomSchemeModule * instance;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		instance = [CustomSchemeModule new];
	});
	return instance;
}
//
//void parseInput(NSArray *inputArray, NSMutableArray *layers, NSMutableDictionary *mazeData);
//NSArray *solveMaze(NSDictionary *startingPosition, NSMutableArray *layers, NSDictionary *mazeData);
//
//int main(int argc, const char * argv[])
//{
//	@autoreleasepool {
//		// Fetch file contents
//		NSString *fileRoot = [[NSBundle mainBundle] pathForResource:@"sample" ofType:@"txt"];
//
//
//		NSString *contents = [NSString stringWithContentsOfFile:fileRoot encoding:NSUTF8StringEncoding error:nil];
//		NSArray *lines = [contents componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
//
//		NSMutableArray *layers = [NSMutableArray new]; // Representation of the maze
//		NSMutableDictionary *mazeData = [NSMutableDictionary new]; // Maze metadata
//
//		parseInput(lines, layers, mazeData); // Convert file data to array representation
//
//		NSArray *shortestPath = solveMaze(mazeData[@"start"], layers, mazeData); // Find the shortest path using BFS
//
//		// Build the direction string based on the shortest path of maze positions
//		NSMutableString *answerString = [NSMutableString new];
//
//		for (NSUInteger i = 0; i < shortestPath.count; i++) {
//			if (i < shortestPath.count - 1) {
//				NSDictionary *currentPosition = shortestPath[i];
//				NSDictionary *nextPosition = shortestPath[i + 1];
//
//				if (currentPosition[@"x"] < nextPosition[@"x"]) {
//					[answerString appendString:@"E"];
//				} else if (currentPosition[@"x"] > nextPosition[@"x"]) {
//					[answerString appendString:@"W"];
//				} else if (currentPosition[@"y"] > nextPosition[@"y"]) {
//					[answerString appendString:@"N"];
//				} else if (currentPosition[@"y"] < nextPosition[@"y"]) {
//					[answerString appendString:@"S"];
//				} else if (currentPosition[@"z"] > nextPosition[@"z"]) {
//					[answerString appendString:@"D"];
//				} else if (currentPosition[@"z"] < nextPosition[@"z"]) {
//					[answerString appendString:@"U"];
//				}
//			}
//		}
//
//		if (shortestPath.count == 0) {
//			NSLog(@"Unescapeable!");
//		} else {
//			NSLog(@"Escapeable: %@", answerString);
//		}
//	}
//	
//	return 0;
//}
//
//void parseInput(NSArray *inputArray, NSMutableArray *layers, NSMutableDictionary *mazeData) {
//	int depth = 0;
//	NSUInteger layerWidth = 0;
//	NSUInteger currentLine = 0;
//	NSMutableArray *currentLayer = [NSMutableArray new];
//
//	// First line of the file is number of layers
//	mazeData[@"height"] = [NSNumber numberWithInt:[inputArray[0] intValue]];
//
//	for (NSInteger i = 1; i < inputArray.count && layers.count < [mazeData[@"height"] intValue]; i++) {
//		NSString *line = inputArray[i];
//
//		if ([line isEqualToString:@""]) {
//			// Empty line or end of file means we are moving on
//			[layers addObject:currentLayer];
//			currentLayer = [NSMutableArray new];
//			depth++;
//			mazeData[@"layerHeight"] = [NSNumber numberWithInteger:currentLine];
//			currentLine = 0;
//		} else {
//			layerWidth = line.length;
//			mazeData[@"layerWidth"] = [NSNumber numberWithInteger:layerWidth];
//
//			[currentLayer addObject:[NSMutableArray arrayWithCapacity:layerWidth]];
//
//			for (NSInteger j = 0; j < line.length; j++) {
//				unichar currentChar = [line characterAtIndex:j];
//
//				// Build default position dictionary
//				NSMutableDictionary *positionData = [NSMutableDictionary dictionaryWithDictionary: @{
//																									 @"x": [NSNumber numberWithInteger:j],
//																									 @"y": [NSNumber numberWithInteger:currentLine],
//																									 @"z": [NSNumber numberWithInt:depth],
//																									 @"isEnd": [NSNumber numberWithBool:NO],
//																									 @"visited": [NSNumber numberWithBool:NO],
//																									 @"solid": [NSNumber numberWithBool:NO],
//																									 @"pastPosition": [NSDictionary new]
//																									 }];
//
//				switch (currentChar) {
//						// Starting point
//					case '#':
//						positionData[@"solid"] = [NSNumber numberWithBool:YES];
//						break;
//					case 'B':
//						positionData[@"visited"] = [NSNumber numberWithBool:YES];
//						[positionData removeObjectForKey:@"pastPosition"];
//						mazeData[@"start"] = positionData;
//						break;
//					case 'E':
//						positionData[@"isEnd"] = [NSNumber numberWithBool:YES];
//						mazeData[@"end"] = positionData;
//						break;
//					default:
//						break;
//				}
//
//				[currentLayer[currentLine] addObject:positionData];
//			}
//
//			currentLine++;
//		}
//	}
//
//	[layers addObject:currentLayer];
//}
//
//NSArray *solveMaze(NSDictionary *startingPosition, NSMutableArray *layers, NSDictionary *mazeData) {
//	bool found = false;
//	int layerWidth = [mazeData[@"layerWidth"] intValue];
//	int layerHeight = [mazeData[@"layerHeight"] intValue];
//	int height = [mazeData[@"height"] intValue];
//
//	// Our BFS queue
//	NSMutableArray *searchQueue = [NSMutableArray arrayWithArray:@[startingPosition]];
//	NSMutableDictionary *finalPosition = [NSMutableDictionary new]; // Exit stored here
//	NSMutableArray *path = [NSMutableArray new]; // The shortest path of positions to the exit
//
//	while (!found) {
//		if (searchQueue.count > 0) {
//			// Dequeue a position
//			NSMutableDictionary *testPos = [searchQueue objectAtIndex:0];
//			NSMutableArray *surroundingPositions = [NSMutableArray new];
//
//			[searchQueue removeObjectAtIndex:0];
//
//			int currentX = [testPos[@"x"] intValue];
//			int currentY = [testPos[@"y"] intValue];
//			int currentZ = [testPos[@"z"] intValue];
//
//			// Grab all the surrounding positions
//			if (currentZ > 0) {
//				[surroundingPositions addObject:layers[currentZ - 1][currentY][currentX]];
//			}
//
//			if (currentZ < height - 1) {
//				[surroundingPositions addObject:layers[currentZ + 1][currentY][currentX]];
//			}
//
//			if (currentY > 0) {
//				[surroundingPositions addObject:layers[currentZ][currentY - 1][currentX]];
//			}
//
//			if (currentY < layerHeight - 1) {
//				[surroundingPositions addObject:layers[currentZ][currentY + 1][currentX]];
//			}
//
//			if (currentX > 0) {
//				[surroundingPositions addObject:layers[currentZ][currentY][currentX - 1]];
//			}
//
//			if (currentX < layerWidth - 1) {
//				[surroundingPositions addObject:layers[currentZ][currentY][currentX + 1]];
//			}
//
//			// Check the surrounding positions for the exit and potential next moves
//			for (NSMutableDictionary *position in surroundingPositions) {
//				if ((BOOL)position[@"isEnd"]) {
//					found = true;
//					finalPosition = position;
//					position[@"visited"] = [NSNumber numberWithBool:YES];
//					position[@"pastPosition"] = testPos;
//					break;
//				} else if (!(BOOL)position[@"solid"] && !(BOOL)position[@"visited"]) {
//					[searchQueue addObject:position];
//					position[@"visited"] = [NSNumber numberWithBool:YES];
//					position[@"pastPosition"] = testPos;
//				}
//				
//			}
//			
//			if (found) {
//				// Build the array of the shortest path, working back from the exit
//				NSMutableDictionary *nextPosition;
//				while (finalPosition[@"pastPosition"]) {
//					[path insertObject:finalPosition atIndex:0];
//					nextPosition = finalPosition[@"pastPosition"];
//					[finalPosition removeObjectForKey:@"pastPosition"];
//					finalPosition = nextPosition;
//				}
//				
//				[path insertObject:finalPosition atIndex:0];
//			}
//		} else {
//			found = true;
//		}
//	}
//
//	return path;
//}
//

@end
