//
//  PalindromeGameTests.m
//  PalindromeTests
//
//  Copyright © 2018 Henry. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PalindromeGame.h"
#import "ScoreKeeper.h"

// MockScoresTabulator  pretends to be the ScoresTabulator portion of
// the ScoreKeeper, but it just tracks the number of times each function
// was called.
@interface MockScoresTabulator : NSObject<ScoresTabulator>
@property int correctScore;
@property int incorrectScore;
@property int clearScoresPressedCount;
@end

@implementation MockScoresTabulator

- (void)addCorrectScore {
    self.correctScore++;
}

- (void)addIncorrectScore {
    self.incorrectScore++;
}

- (void)clearScores {
    self.clearScoresPressedCount++;
}

@end


#pragma mark -
@interface PalindromeGameTests : XCTestCase
@property MockScoresTabulator* mockScoresTabulator;
@property PalindromeGame* game;
@end

@implementation PalindromeGameTests

- (void)setUp {
    self.mockScoresTabulator = [[MockScoresTabulator alloc] init];
    self.game = [[PalindromeGame alloc] initWithScores:self.mockScoresTabulator];
}

- (void)tearDown {
}

- (BOOL) verifyInitialMockScoresTabulatorConditions {
    return (self.mockScoresTabulator.correctScore == 0
            && self.mockScoresTabulator.incorrectScore == 0
            && self.mockScoresTabulator.clearScoresPressedCount == 0);
}

// verify that submitPalindrome calls lead to the correct calls to
// ScoresTabulator.
- (void) testScoresTabulation {
    XCTAssert([self verifyInitialMockScoresTabulatorConditions]);
    NSString* correctPalindrome = @"aba";
    NSString* incorrectPalindrome = @"Hello";

    [self.game submitPalindrome:correctPalindrome];
    XCTAssertEqual(self.mockScoresTabulator.correctScore, 1);

    [self.game submitPalindrome:incorrectPalindrome];
    XCTAssertEqual(self.mockScoresTabulator.incorrectScore, 1);

    // game has no api that calls clearScores.
}

@end
