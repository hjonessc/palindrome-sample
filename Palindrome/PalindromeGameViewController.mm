//
//  PalindromeGameViewController.mm
//  Palindrome
//
//  Copyright © 2018 Henry. All rights reserved.
//

#import "PalindromeGameViewController.h"
#import "StringIDs.h"

@interface PalindromeGameViewController ()
@property (weak, nonatomic) IBOutlet UIView *mainContainer;

@property (weak, nonatomic) IBOutlet UIView   *titleContainer;
@property (weak, nonatomic) IBOutlet UILabel  *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel  *subtitleLabel;

@property (weak, nonatomic) IBOutlet UITextField *enterPalindromeField;
@property (weak, nonatomic) IBOutlet UIButton    *submitButton;

@property (weak, nonatomic) IBOutlet UIView   *scoresContainer;
@property (weak, nonatomic) IBOutlet UILabel  *successStreakLabel;
@property (weak, nonatomic) IBOutlet UILabel  *failureStreakLabel;
@property (weak, nonatomic) IBOutlet UILabel  *totalScoreLabel;

@property (weak, nonatomic) IBOutlet UILabel  *failureIcon;

@property (strong, nonatomic) UIImageView *rocketShip;

- (IBAction)submitPalindromeAction:(id)sender;
@end //@interface PalindromeGameViewController


@implementation PalindromeGameViewController

- (void) updateScores {
    // TODO: Use attributed string to right-align the scores and left-align the labels
    self.successStreakLabel.text = [NSString stringWithFormat:STR_WINNING_STREAK,  (int)self.scores.numConsecutiveCorrect];
    self.failureStreakLabel.text = [NSString stringWithFormat:STR_INCORRECT_COUNT, (int)self.scores.numIncorrect];
    self.totalScoreLabel.text    = [NSString stringWithFormat:STR_CORRECT_COUNT,   (int)self.scores.numCorrect];
}

- (void) setupRocket
{
    UIImage* rocketImage = [UIImage imageNamed:@"rocket_ship"];
    self.rocketShip = [[UIImageView alloc] initWithImage:rocketImage];
    CGRect frame = self.rocketShip.frame;
    frame.size = CGSizeMake(50, 25);
    self.rocketShip.frame = frame;
    [self.mainContainer addSubview:self.rocketShip];
    self.rocketShip.hidden = YES;
}

- (void) setupScoresContainer
{
    // rounded white border for scores box
    self.scoresContainer.layer.cornerRadius = 8;
    self.scoresContainer.layer.masksToBounds = true;
    self.scoresContainer.layer.borderWidth = 2;
    self.scoresContainer.layer.borderColor = [UIColor whiteColor].CGColor;
    
}

- (void) setupBackground
{
    UIImageView *backgroundImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"brown_paper_bag.jpg"]];
    [self.view addSubview:backgroundImage];
    [self.view sendSubviewToBack:backgroundImage];
}

- (void)viewDidLoad {
    NSLog(@"PalindromeGameVC::ViewDidLoad");
    [super viewDidLoad];

    self.titleLabel.text = STR_HOME_TITLE;
    self.subtitleLabel.text = STR_HOME_SUBTITLE;
    self.enterPalindromeField.placeholder = STR_TEXT_FIELD_DEFAULT;
    [self.submitButton setTitle:STR_SUBMIT_BUTTON_TITLE forState:UIControlStateNormal];
    
    self.failureIcon.alpha = 0.0;

    [self setupBackground];
    [self setupScoresContainer];
    [self setupRocket];
    [self updateScores];
}

- (void) animateShowFailure
{
    NSLog(@"PalindromeGameVC::animateShowFailure");
    self.failureIcon.alpha = 0.0;
    [UIView animateWithDuration:0.25 animations:^{
        self.failureIcon.alpha = 1.0;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.25 delay:2 options:0 animations:^{
            self.failureIcon.alpha = 0.0;
        } completion:^(BOOL finished) {
            NSLog(@"PalindromeGameVC animateShowFailure done");
        }];
    }];
}

- (void) animateRocketSuccess
{
    NSLog(@"PalindromeGameVC::animateRocketSuccess");
    CGRect frame = self.rocketShip.bounds;
    frame.origin.x = self.view.frame.size.width;
    frame.origin.y = self.titleContainer.frame.origin.y + self.titleContainer.frame.size.height + 8;
    self.rocketShip.frame = frame;
    self.rocketShip.hidden = NO;
    [UIView animateWithDuration:2 animations:^{
        CGRect frame = self.rocketShip.frame;
        frame.origin.x = 0 - self.rocketShip.frame.size.width;
        self.rocketShip.frame = frame;
    } completion:^(BOOL finished) {
        self.rocketShip.hidden = YES;
        NSLog(@"PalindromeGameVC::animateRocketSuccess complete");
    }];
}

- (IBAction)submitPalindromeAction:(UIButton*)sender {
    NSLog(@"PalindromeGameVC::submitPalindromeAction");
    NSAssert([sender isKindOfClass:[UIButton class]], @"invalid sender to submitPalindromeAction");

    NSString* enteredText = self.enterPalindromeField.text;
    BOOL isPalindrome = [self.game submitPalindrome:enteredText];

    if (isPalindrome) {
        [self animateRocketSuccess];
    } else {
        [self animateShowFailure];
    }

    [self updateScores];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}

@end //@implementation PalindromeGameViewController
