//
//  PalindromeRecursive.m
//  Exercises
//
//  Copyright © 2018 Henry Jones. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PalindromeRecursive.h"

@interface Node : NSObject
{
}
@property (retain) Node* next;
@property (assign) unichar data;

+ (Node*) nodeFromString:(NSString*)string;
+ (Node*) nodeWithData:(unichar)data;
- (NSString*) debugPrintString;
@end

#pragma mark -

@implementation PalindromeRecursive
// Compares the two strings one character/node at a time, in opposite order.

// As we build the recursion stack, recursiveCandidate nodes are left in order from
// bottom to top, but the iterativeCandidate address is unchanged. When we descend the stack
// we iterate over *iterativeCandidate in forward order and recursiveCandidate in reverse
// order, comparing as we go.
+ (BOOL) isPalindromeRecursiveCandidate:(Node *) recursiveCandidate
                     iterativeCandidate:(Node**) iterativeCandidate
{
    if (recursiveCandidate != nil)
    {
        BOOL isPal = [PalindromeRecursive isPalindromeRecursiveCandidate:recursiveCandidate.next
                                                      iterativeCandidate:iterativeCandidate];
        if (isPal) {
            BOOL isCharacterMatch = recursiveCandidate.data == (*iterativeCandidate).data;
            *iterativeCandidate = (*iterativeCandidate).next;
            return isCharacterMatch;
        } else {
            return NO;
        }
    } else {
        return YES;
    }
}

+ (BOOL) isPalindrome:(NSString*)palindromeCandidate
{
    NSLog(@"PalindromeRecursive::isPalindrome:%@", palindromeCandidate);
    if (palindromeCandidate.length==0)
    {
        NSLog(@"PalindromeRecursive isPalindrome, empty string");
        return NO;
    }

    Node* nodePalindromeCandidate = [Node nodeFromString:palindromeCandidate];
    NSLog(@"PalindromeRecursive::isPalindrome nodeFromString:%@", [nodePalindromeCandidate debugPrintString]);

    Node* iterativeCandidate = nodePalindromeCandidate;

    BOOL retVal = [PalindromeRecursive isPalindromeRecursiveCandidate:nodePalindromeCandidate
                                                   iterativeCandidate:&iterativeCandidate];
    NSLog(@"PalindromeRecursive::isPalindrome:%@ returns:%@", palindromeCandidate, retVal?@"YES":@"NO");
    return retVal;
}

@end


#pragma mark -
@implementation Node

+ (Node*) nodeFromString:(NSString*)str
{
    NSUInteger len = [str length];
    Node* headNode = nil;
    Node* newNode = nil;
    
    if (len==0) {
        return nil;
    }
    
    for(NSUInteger i = len; i>0; i--) {
        newNode = [Node nodeWithData:[str characterAtIndex:i-1]];
        newNode.next = headNode;
        headNode = newNode;
    }
    return headNode;
}

+ (Node*) nodeWithData:(unichar)data
{
    Node* n = [[Node alloc] init];
    n.data = data;
    n.next = nil;
    return n;
}

- (NSString*) debugPrintString
{
    Node* iterNode = self;
    NSMutableString* str = [[NSMutableString alloc] init];
    while (iterNode != nil)
    {
        [str appendFormat:@"%C", iterNode.data];
        iterNode = iterNode.next;
    }
    return str;
}

@end
