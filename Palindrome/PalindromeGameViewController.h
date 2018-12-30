//
//  PalindromeGameViewController.h
//  Palindrome
//
//  Copyright © 2018 Henry. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PalindromeGame.h"
#import "ScoreKeeper.h"

@interface PalindromeGameViewController : UIViewController

@property (nonatomic, strong) PalindromeGame* game;
@property (nonatomic, strong) id<ScoresTotals> scores;

@end

