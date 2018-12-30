//
//  ScoreKeeper.m
//  Palindrome
//
//  Copyright © 2018 Henry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ScoreKeeper.h"

static NSString* const kNumCorrect              = @"NumCorrect";
static NSString* const kNumIncorrect            = @"NumIncorrect";
static NSString* const kNumConsecutiveCorrect   = @"NumConsecutiveCorrect";
static NSString* const kNumConsecutiveIncorrect = @"ConsecutiveIncorrect";
static NSString* const kLongestCorrectStreak    = @"LongestCorrectStreak";
static NSString* const kLongestIncorrectStreak  = @"LongestIncorrectStreak";

@interface ScoreKeeper ()

@property (assign, nonatomic) NSUInteger numCorrect;
@property (assign, nonatomic) NSUInteger numIncorrect;
@property (assign, nonatomic) NSUInteger numConsecutiveCorrect;
@property (assign, nonatomic) NSUInteger numConsecutiveIncorrect;

@property (assign, nonatomic) NSUInteger longestCorrectStreak;
@property (assign, nonatomic) NSUInteger longestIncorrectStreak;

@end

@implementation ScoreKeeper

- (instancetype) initWithUserDefaults:(NSUserDefaults *)defaults
{
    self = [super init];
    if (self) {
        _defaults = defaults;
    }
    return self;
}

- (void) clearScores
{
    NSLog(@"clearScores");
    self.numCorrect = 0;
    self.numIncorrect = 0;
    self.numConsecutiveCorrect = 0;
    self.numConsecutiveIncorrect = 0;
    self.longestCorrectStreak = 0;
    self.longestIncorrectStreak = 0;
}

- (void) addCorrectScore
{
    NSLog(@"addCorrectScore");
    self.numCorrect++;
    self.numConsecutiveIncorrect = 0;
    self.numConsecutiveCorrect ++;
    [self updateStreaks];
}

- (void) addIncorrectScore
{
    NSLog(@"addIncorrectScore");
    self.numIncorrect++;
    self.numConsecutiveCorrect = 0;
    self.numConsecutiveIncorrect ++;
    [self updateStreaks];
}

- (void) updateStreaks
{
    if (self.numConsecutiveCorrect > self.longestCorrectStreak)
    {
        self.longestCorrectStreak = self.numConsecutiveCorrect;
    }
    if (self.numConsecutiveIncorrect > self.longestIncorrectStreak)
    {
        self.longestIncorrectStreak = self.numConsecutiveIncorrect;
    }
}

// HJ - I break my usual formatting rules here to make this repetitive set of
// getters/setters more visually auditable.
- (void) setNumCorrect:(NSUInteger)numCorrect
{ [self.defaults setInteger:numCorrect forKey:kNumCorrect]; }
- (NSUInteger) numCorrect
{ return [self.defaults integerForKey:kNumCorrect]; }


- (void) setNumIncorrect:(NSUInteger)numIncorrect
{ [self.defaults setInteger:numIncorrect forKey:kNumIncorrect]; }
- (NSUInteger) numIncorrect
{ return [self.defaults integerForKey:kNumIncorrect]; }


- (void) setNumConsecutiveCorrect:(NSUInteger)numConsecutiveCorrect
{ [self.defaults setInteger:numConsecutiveCorrect forKey:kNumConsecutiveCorrect]; }
- (NSUInteger) numConsecutiveCorrect
{ return [self.defaults integerForKey:kNumConsecutiveCorrect]; }


- (void) setNumConsecutiveIncorrect:(NSUInteger)numConsecutiveIncorrect
{ [self.defaults setInteger:numConsecutiveIncorrect forKey:kNumConsecutiveIncorrect]; }
- (NSUInteger) numConsecutiveIncorrect
{ return [self.defaults integerForKey:kNumConsecutiveIncorrect]; }


@end
