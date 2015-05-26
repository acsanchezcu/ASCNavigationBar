//
//  ASCSecondViewController.m
//  ASCNavigationBar
//
//  Created by Abel Sánchez Custodio on 26/5/15.
//  Copyright (c) 2015 acsanchezcu. All rights reserved.
//

#import "ASCSecondViewController.h"

#import "UIImage+ASCExtension.h"


@implementation ASCSecondViewController

#pragma mark - Init

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initialize];
}

#pragma mark - Actions

- (void)userDidTapBackButton:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)userDidTapCoolButton:(id)sender
{
    
    
    UIAlertView * alert =[[UIAlertView alloc ] initWithTitle:@"Cool"
                                                     message:@"You clicked on cool button!"
                                                    delegate:nil
                                           cancelButtonTitle:@"ok"
                                           otherButtonTitles: nil];
    
    [alert show];
}

- (void)userDidTapStarButton:(id)sender
{
    
    
    UIAlertView * alert =[[UIAlertView alloc ] initWithTitle:@"Star"
                                                     message:@"You clicked on star button!"
                                                    delegate:nil
                                           cancelButtonTitle:@"ok"
                                           otherButtonTitles: nil];
    
    [alert show];
}

#pragma mark - Public Methods

#pragma mark - Private Methods

- (void)initialize
{
    [self setBackBarButtonItem];
    
    [self setRightBarButtonItems];
    
    self.title = @"Second";
}

- (void)setBackBarButtonItem
{
    UIImage *backImage = [UIImage imageFromMaskImage:[UIImage imageNamed:@"back"] withColor:self.navigationController.navigationBar.tintColor];
    
    UIBarButtonItem *backButtonItem = [[UIBarButtonItem alloc] initWithImage:backImage style:UIBarButtonItemStylePlain target:self action:@selector(userDidTapBackButton:)];
    
    self.navigationItem.leftBarButtonItem = backButtonItem;
}

- (void)setRightBarButtonItems
{
    UIImage *coolImage = [UIImage imageFromMaskImage:[UIImage imageNamed:@"cool"] withColor:self.navigationController.navigationBar.tintColor];
    
    UIBarButtonItem *coolButtonItem = [[UIBarButtonItem alloc] initWithImage:coolImage style:UIBarButtonItemStylePlain target:self action:@selector(userDidTapCoolButton:)];
    
    UIImage *starImage = [UIImage imageFromMaskImage:[UIImage imageNamed:@"star"] withColor:self.navigationController.navigationBar.tintColor];
    
    UIBarButtonItem *starButtonItem = [[UIBarButtonItem alloc] initWithImage:starImage style:UIBarButtonItemStylePlain target:self action:@selector(userDidTapStarButton:)];
    
    NSArray *buttonItems = @[coolButtonItem, starButtonItem];
    
    self.navigationItem.rightBarButtonItems = buttonItems;
}

@end
