//
//  SettingsViewController.m
//  Palindrome
//
//  Copyright © 2018 Henry. All rights reserved.
//

#import "SettingsViewController.h"
#import "StringIDs.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subtitleLabel;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    NSLog(@"SettingsVC::viewDidLoad");
    [super viewDidLoad];
    self.titleLabel.text = STR_SETTINGS_TITLE;
    self.subtitleLabel.text = STR_SETTINGS_DESC;
}


@end
