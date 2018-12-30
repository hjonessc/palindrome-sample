//
//  PalindromeGame.h
//  Palindrome
//
//  Copyright © 2018 Henry. All rights reserved.
//

#import "ScoreKeeper.h"
@interface PalindromeGame : NSObject
@property (nonatomic, strong, readonly) id<ScoresTabulator> scores;

// constructor dependency injection. Injecting the ScoresTabulator
// protocol instead of the whole ScoreKeeper object.
- (instancetype) initWithScores:(id<ScoresTabulator>)scores;

// returns true if palindrome was good.
- (BOOL) submitPalindrome:(NSString*)palindrome;

@end
