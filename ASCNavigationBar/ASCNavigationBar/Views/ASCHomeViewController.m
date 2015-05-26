//
//  ASCHomeViewController.m
//  ASCNavigationBar
//
//  Created by Abel Sánchez Custodio on 25/5/15.
//  Copyright (c) 2015 acsanchezcu. All rights reserved.
//

#import "ASCHomeViewController.h"


CGFloat const KEYBOARD_HEIGHT = 256.f;
CGFloat const TOP_LAYOUT_CONSTRAINT = 16.f;


@interface ASCHomeViewController ()
<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topLayoutConstraint;

@end


@implementation ASCHomeViewController

#pragma mark - Init

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initialize];
}

#pragma mark - Actions

- (IBAction)userDidChangeSwitchTranslucent:(id)sender
{
    UISwitch *switchTranslucent = (UISwitch *)sender;
    
    self.navigationController.navigationBar.translucent = switchTranslucent.isOn;
}

- (IBAction)userDidTapButtonNavigationBarBackgroundColor:(id)sender
{
    UIButton *button = (UIButton *)sender;
    
    self.navigationController.navigationBar.barTintColor = button.backgroundColor;
}

- (IBAction)userDidChangeSegmentedControl:(id)sender
{
    UISegmentedControl *segmentedControl = (UISegmentedControl *)sender;
    
    UIColor *tintColor = [UIColor blackColor];
    
    switch (segmentedControl.selectedSegmentIndex) {
        case 0:
            tintColor = [UIColor blackColor];
            break;
        case 1:
            tintColor = [UIColor whiteColor];
            break;
        case 2:
            tintColor = [UIColor redColor];
            break;
    }
    
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{NSForegroundColorAttributeName : tintColor}];
}

- (IBAction)userDidChangeSwitchBackgroundImage:(id)sender
{
    UISwitch *switchBackgroundImage = (UISwitch *)sender;
    
    UIImage *image = (switchBackgroundImage.isOn) ? [UIImage imageNamed:@"navigationBarImage"] : nil;
    
    [self.navigationController.navigationBar setBackgroundImage:image forBarPosition:UIBarPositionTopAttached barMetrics:UIBarMetricsDefault];
}

- (IBAction)userDidChangeSwitchTitleView:(id)sender
{
    UISwitch *switchTitleView = (UISwitch *)sender;

    if (switchTitleView.isOn)
    {
        UIImage *image = [UIImage imageNamed:@"navigationBarTitleView"];
        
        self.navigationItem.titleView = [[UIImageView alloc] initWithImage:image];
    }
    else
    {
        self.navigationItem.titleView = nil;
    }
}

- (IBAction)userDidChangeSwitchStatusBarStyle:(id)sender
{
    UISwitch *switchStatusBar = (UISwitch *)sender;

    UIStatusBarStyle style = (switchStatusBar.isOn) ? UIStatusBarStyleLightContent : UIStatusBarStyleDefault;
    
    [[UIApplication sharedApplication] setStatusBarStyle:style];
}

- (void)handleTap:(UITapGestureRecognizer *)tap
{
    [self hideKeyboard];
}

#pragma mark - Public Methods

#pragma mark - Private Methods

- (void)initialize
{
    UITapGestureRecognizer *tapMainView = [[UITapGestureRecognizer alloc]init];
    [tapMainView addTarget:self action:@selector(handleTap:)];
    
    [self.view addGestureRecognizer:tapMainView];
    
    [self setTitleOfNavigationBar];
}

- (void)setTitleOfNavigationBar
{
    self.title = @"Home";
}

- (void)hideKeyboard
{
    [self.view endEditing:YES];
    
    self.topLayoutConstraint.constant = TOP_LAYOUT_CONSTRAINT;
    
    [self animateLayoutSubviews];
}

- (void)animateLayoutSubviews
{
    [UIView animateWithDuration:0.3f animations:^{
        [self.view layoutSubviews];
    }];
}

#pragma mark - DELEGATES

#pragma mark - UITextFieldDelegate

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [self hideKeyboard];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    CGFloat screenHeight = self.view.frame.size.height;
    
    CGFloat yPositionOfTextField = textField.frame.origin.y;
    
    CGFloat distanceFromBottom = screenHeight - (yPositionOfTextField + textField.frame.size.height);
    
    if (distanceFromBottom < KEYBOARD_HEIGHT)
    {
        CGFloat difference = KEYBOARD_HEIGHT - distanceFromBottom ;
        
        self.topLayoutConstraint.constant = TOP_LAYOUT_CONSTRAINT - (difference) - 10.f;
        
        [self animateLayoutSubviews];
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSString *textChanged = [textField.text stringByReplacingCharactersInRange:range withString:string];
    
    self.title = textChanged;
    
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self hideKeyboard];
    
    return YES;
}

@end
