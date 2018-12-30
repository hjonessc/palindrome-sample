//
//  ScoreKeeper.h
//  Palindrome
//
//  Copyright © 2018 Henry. All rights reserved.
//

// ScoreKeeper has two protocols to divide the API up for classes that modify the score
// (PalindromeGame) and classes that view the score (PalindromeGameViewController).
// This prevents a view controller from meddling with the scores when it should only be reading them.
// It also allows you to do a unit test of PalindromeGame with a ScoresTabulator
// mock object.

@protocol ScoresTabulator <NSObject>

- (void) addCorrectScore;   // Call when player submits correct answer
- (void) addIncorrectScore; // Call when player submits incorrect answer
- (void) clearScores;

@end


@protocol ScoresTotals <NSObject>

@property (readonly, nonatomic) NSUInteger numCorrect;
@property (readonly, nonatomic) NSUInteger numIncorrect;
@property (readonly, nonatomic) NSUInteger numConsecutiveCorrect;
@property (readonly, nonatomic) NSUInteger numConsecutiveIncorrect;

@property (readonly, nonatomic) NSUInteger longestCorrectStreak;
@property (readonly, nonatomic) NSUInteger longestIncorrectStreak;

@end


@interface ScoreKeeper : NSObject <ScoresTabulator, ScoresTotals>

@property (nonatomic, strong, readonly) NSUserDefaults* defaults;

// NSUserDefaults is injected, in part so changing to a user-based defaults is centralized.
- (instancetype) initWithUserDefaults:(NSUserDefaults*)defaults;

@end
