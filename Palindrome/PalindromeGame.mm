//
//  PalindromeGame.m
//  Palindrome
//
//  Copyright © 2018 Henry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PalindromeGame.h"
#import "PalindromeRecursive.h"

@interface PalindromeGame ()


@end

@implementation PalindromeGame

- (instancetype) initWithScores:(id<ScoresTabulator>)scores
{
    self = [super init];
    if (self) {
        _scores = scores;
    }
    return self;
}

- (BOOL) submitPalindrome:(NSString *)palindrome
{
    BOOL isPal = [self isPalindrome:palindrome];
    if (isPal)
    {
        [self.scores addCorrectScore];
    }
    else
    {
        [self.scores addIncorrectScore];
    }
    return isPal;
}

- (BOOL) isPalindrome:(NSString *)palindrome
{
    return [PalindromeRecursive isPalindrome:palindrome];
}

@end
