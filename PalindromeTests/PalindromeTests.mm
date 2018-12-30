//
//  PalindromeTests.m
//  PalindromeTests
//
//  Copyright © 2018 Henry. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PalindromeRecursive.h"

@interface PalindromeTests : XCTestCase

@end

@implementation PalindromeTests

- (void)setUp {
}

- (void)tearDown {
}

- (void)testIsPalindrome {
    NSLog(@"testExample");
    XCTAssert([PalindromeRecursive isPalindrome:@"aba"]);
    XCTAssert(![PalindromeRecursive isPalindrome:@"abc"]);
    XCTAssert(![PalindromeRecursive isPalindrome:@""]);
    XCTAssert([PalindromeRecursive isPalindrome:@"a"]);
    // Don't test for nil. It is illegal and will assert.
}

@end
