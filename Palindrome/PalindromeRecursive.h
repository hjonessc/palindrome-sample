//
//  PalindromeRecursive.h
//  Exercises
//
//  Copyright © 2018 Henry Jones. All rights reserved.
//

#import <Foundation/Foundation.h>

// Based on an implementation I did for a practice problem from one of
// those interview practice books. The problem just said to validate
// a palindrome from a linked list.
@interface PalindromeRecursive : NSObject
+ (BOOL) isPalindrome:(NSString*)palindromeCandidate;
@end
