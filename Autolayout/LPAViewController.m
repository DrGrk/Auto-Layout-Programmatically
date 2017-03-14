//
//  LPAViewController.m
//  Autolayout
//
//  Created by Steven Masuch on 2014-07-20.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "LPAViewController.h"

@interface LPAViewController ()

@property (nonatomic, weak) UIButton *squareButton;
@property (nonatomic, weak) UIButton *portraitButton;
@property (nonatomic, weak) UIButton *landscapeButton;


@property (nonatomic, weak) NSLayoutConstraint *framingViewHeightConstraint;
@property (nonatomic, weak) NSLayoutConstraint *framingViewWidthConstraint;

@property (nonatomic, weak) UIView *framingView;
@property (nonatomic, strong) UIView *purpleBox;
@property (nonatomic, strong) UIView *orangeBoxleft;
@property (nonatomic, strong) UIView *orangeBoxright;
@property (nonatomic, strong) UIView *redBox;
@property (nonatomic, strong) UIView *blueBoxTop;
@property (nonatomic, strong) UIView *blueBoxMiddle;
@property (nonatomic, strong) UIView *blueBoxBottom;

@end

@implementation LPAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *squareButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [squareButton setTitle:@"Square" forState:UIControlStateNormal];
    [squareButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:squareButton];
    squareButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.squareButton = squareButton;
    
    UIButton *portraitButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [portraitButton setTitle:@"Portrait" forState:UIControlStateNormal];
    [portraitButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:portraitButton];
    portraitButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.portraitButton = portraitButton;
    
    UIButton *landscapeButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [landscapeButton setTitle:@"Landscape" forState:UIControlStateNormal];
    [landscapeButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:landscapeButton];
    landscapeButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.landscapeButton = landscapeButton;
    
    UIView *framingView = [[UIView alloc] initWithFrame:CGRectZero];
    framingView.translatesAutoresizingMaskIntoConstraints = NO;
    framingView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:framingView];
    self.framingView = framingView;
    
    NSString *buttonsHorizontalConstraintsFormat = @"|[squareButton(==portraitButton)][portraitButton(==landscapeButton)][landscapeButton]|";
    NSArray *buttonsHorizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:buttonsHorizontalConstraintsFormat
                                                                   options:NSLayoutFormatAlignAllCenterY
                                                                    metrics:nil
                                                                    views:NSDictionaryOfVariableBindings(squareButton, portraitButton, landscapeButton)];
    [NSLayoutConstraint activateConstraints:buttonsHorizontalConstraints];
    
    NSLayoutConstraint *squareButtonBottomConstraint = [NSLayoutConstraint constraintWithItem:squareButton
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:-50.0];
    squareButtonBottomConstraint.active = YES;
    
    NSLayoutConstraint *framingViewCenterXConstraint = [NSLayoutConstraint constraintWithItem:framingView
                                                                                    attribute:NSLayoutAttributeCenterX
                                                                                    relatedBy:NSLayoutRelationEqual
                                                                                       toItem:self.view
                                                                                    attribute:NSLayoutAttributeCenterX
                                                                                   multiplier:1.0
                                                                                     constant:0.0];
    framingViewCenterXConstraint.active = YES;
    
    NSLayoutConstraint *framingViewCenterY = [NSLayoutConstraint constraintWithItem:framingView
                                                                          attribute:NSLayoutAttributeCenterY
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:self.view
                                                                          attribute:NSLayoutAttributeCenterY
                                                                         multiplier:1.0
                                                                           constant:-50.0];
    framingViewCenterY.active = YES;
    
    self.framingViewHeightConstraint = [NSLayoutConstraint constraintWithItem:framingView
                                                                                   attribute:NSLayoutAttributeHeight
                                                                                   relatedBy:NSLayoutRelationEqual
                                                                                      toItem:nil
                                                                                   attribute:NSLayoutAttributeNotAnAttribute
                                                                                  multiplier:1.0
                                                                                    constant:500.0];
    self.framingViewHeightConstraint.active = YES;
    
    self.framingViewWidthConstraint = [NSLayoutConstraint constraintWithItem:framingView
                                                                                  attribute:NSLayoutAttributeWidth
                                                                                  relatedBy:NSLayoutRelationEqual
                                                                                     toItem:nil
                                                                                  attribute:NSLayoutAttributeNotAnAttribute
                                                                                 multiplier:1.0
                                                                                   constant:500.0];
    self.framingViewWidthConstraint.active = YES;

    
//PURPLE BOX
    
    self.purpleBox = [[UIView alloc] initWithFrame:CGRectZero];
    self.purpleBox.translatesAutoresizingMaskIntoConstraints = NO;
    self.purpleBox.backgroundColor = UIColor.purpleColor;
    [self.framingView addSubview:self.purpleBox];

    NSLayoutConstraint *purpleBoxRightMargin = [NSLayoutConstraint constraintWithItem:self.purpleBox
                                                                            attribute:NSLayoutAttributeRightMargin
                                                                            relatedBy:NSLayoutRelationEqual
                                                                               toItem:self.framingView
                                                                            attribute:NSLayoutAttributeRightMargin
                                                                           multiplier:1
                                                                             constant:-20];
    
    NSLayoutConstraint *purpleBoxBottom = [NSLayoutConstraint constraintWithItem:self.purpleBox
                                                                       attribute:NSLayoutAttributeBottom
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:self.framingView
                                                                       attribute:NSLayoutAttributeBottom
                                                                      multiplier:1.0
                                                                        constant:-20];
    
    NSLayoutConstraint *purpleBoxWidth = [NSLayoutConstraint constraintWithItem:self.purpleBox
                                                                      attribute:NSLayoutAttributeWidth
                                                                      relatedBy:NSLayoutRelationEqual
                                                                         toItem:self.framingView
                                                                      attribute:NSLayoutAttributeWidth
                                                                     multiplier:0.6
                                                                       constant:1];
    
    NSLayoutConstraint *purpleBoxHeight = [NSLayoutConstraint constraintWithItem:self.purpleBox
                                                                       attribute:NSLayoutAttributeHeight
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:nil
                                                                       attribute:NSLayoutAttributeNotAnAttribute
                                                                      multiplier:1
                                                                        constant:50];
    purpleBoxRightMargin.active = YES;
    purpleBoxBottom.active = YES;
    purpleBoxWidth.active = YES;
    purpleBoxHeight.active = YES;
    
    
    //RED BOX is 20 Points Away from the TOP and RIGHT EDGES of the Box
    
    
    self.redBox = [[UIView alloc] initWithFrame:CGRectZero];
    self.redBox.translatesAutoresizingMaskIntoConstraints = NO;
    self.redBox.backgroundColor = UIColor.redColor;
    [self.framingView addSubview:self.redBox];
    
    NSLayoutConstraint *redBoxTopMargin = [NSLayoutConstraint constraintWithItem:self.redBox
                                                                       attribute:NSLayoutAttributeTopMargin
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:self.framingView
                                                                       attribute:NSLayoutAttributeTopMargin
                                                                      multiplier:1
                                                                        constant:20];
    
    NSLayoutConstraint *redBoxRightMargin = [NSLayoutConstraint constraintWithItem:self.redBox
                                                                         attribute:NSLayoutAttributeRightMargin
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:self.framingView
                                                                         attribute:NSLayoutAttributeRightMargin
                                                                        multiplier:1
                                                                          constant:-20];
    NSLayoutConstraint *redBoxWidth = [NSLayoutConstraint constraintWithItem:self.redBox
                                                                   attribute:NSLayoutAttributeWidth
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:nil
                                                                   attribute:NSLayoutAttributeNotAnAttribute
                                                                  multiplier:1
                                                                    constant:156];
    NSLayoutConstraint *redBoxHeight = [NSLayoutConstraint constraintWithItem:self.redBox
                                                                    attribute:NSLayoutAttributeHeight
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:nil
                                                                    attribute:NSLayoutAttributeNotAnAttribute
                                                                   multiplier:1
                                                                     constant:50];
    
    redBoxTopMargin.active = YES;
    redBoxRightMargin.active = YES;
    redBoxWidth.active = YES;
    redBoxHeight.active = YES;
    

    
    //ORANGE RIGHT BOX 30 POINTS TALL...RIGHT IS 50 POINTS WIDE...FIXED CONSTRAIN FROM RIGHT MARGIN AND TOP MARGIN

    self.orangeBoxright = [[UIView alloc] initWithFrame:CGRectZero];
    self.orangeBoxright.translatesAutoresizingMaskIntoConstraints = NO;
    self.orangeBoxright.backgroundColor = UIColor.orangeColor;
    [self.redBox addSubview:self.orangeBoxright];

    NSLayoutConstraint *orangeBoxRightHeight = [NSLayoutConstraint constraintWithItem:self.orangeBoxright
                                                                            attribute:NSLayoutAttributeHeight
                                                                            relatedBy:NSLayoutRelationEqual
                                                                               toItem:nil
                                                                            attribute:NSLayoutAttributeNotAnAttribute multiplier:1
                                                                             constant:30];
    
    NSLayoutConstraint *orangeBoxRightWidth = [NSLayoutConstraint constraintWithItem:self.orangeBoxright
                                                                           attribute:NSLayoutAttributeWidth
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:nil
                                                                           attribute:NSLayoutAttributeNotAnAttribute
                                                                          multiplier:1
                                                                            constant:50];
//    NSLayoutConstraint *orangeBoxRightTopMargin = [NSLayoutConstraint constraintWithItem:self.orangeBoxright
//                                                                               attribute:NSLayoutAttributeTopMargin
//                                                                               relatedBy:NSLayoutRelationEqual
//                                                                                  toItem:self.redBox
//                                                                               attribute:NSLayoutAttributeTop
//                                                                              multiplier:1
//                                                                                constant:10];
    NSLayoutConstraint *orangeBoxRightRightMargin = [NSLayoutConstraint constraintWithItem:self.orangeBoxright
                                                                                 attribute:NSLayoutAttributeRightMargin
                                                                                 relatedBy:NSLayoutRelationEqual
                                                                                    toItem:self.redBox
                                                                                 attribute:NSLayoutAttributeRight
                                                                                multiplier:1
                                                                                  constant:-20];
    NSLayoutConstraint *orangeBoxRightCenterY = [NSLayoutConstraint constraintWithItem:self.orangeBoxright
                                                                             attribute:NSLayoutAttributeCenterY
                                                                             relatedBy:NSLayoutRelationEqual
                                                                                toItem:self.redBox
                                                                             attribute:NSLayoutAttributeCenterY
                                                                            multiplier:1 constant:1];
    
    
    orangeBoxRightHeight.active = YES;
    orangeBoxRightWidth.active = YES;
//    orangeBoxRightTopMargin.active = YES;
    orangeBoxRightRightMargin.active = YES;
    orangeBoxRightCenterY.active = YES;
    
    
//ORGANGE LEFT BOX IS 30 POINTS TALL...LEFT IS 70 POINTS WIDE...FIXED CONSTRAIN FROM RIGHT MARGIN AND TOP MARGIN
    
    self.orangeBoxleft = [[UIView alloc] initWithFrame:CGRectZero];
    self.orangeBoxleft.translatesAutoresizingMaskIntoConstraints = NO;
    self.orangeBoxleft.backgroundColor = UIColor.orangeColor;
    [self.redBox addSubview:self.orangeBoxleft];
    
    NSLayoutConstraint *orangeBoxLeftHeight = [NSLayoutConstraint constraintWithItem:self.orangeBoxleft
                                                                            attribute:NSLayoutAttributeHeight
                                                                            relatedBy:NSLayoutRelationEqual
                                                                               toItem:nil
                                                                            attribute:NSLayoutAttributeNotAnAttribute multiplier:1
                                                                             constant:30];
    
    NSLayoutConstraint *orangeBoxLeftWidth = [NSLayoutConstraint constraintWithItem:self.orangeBoxleft
                                                                           attribute:NSLayoutAttributeWidth
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:nil
                                                                           attribute:NSLayoutAttributeNotAnAttribute
                                                                          multiplier:1
                                                                            constant:70];
//    NSLayoutConstraint *orangeBoxLeftTopMargin = [NSLayoutConstraint constraintWithItem:self.orangeBoxleft
//                                                                               attribute:NSLayoutAttributeTopMargin
//                                                                               relatedBy:NSLayoutRelationEqual
//                                                                                  toItem:self.redBox
//                                                                               attribute:NSLayoutAttributeTop
//                                                                              multiplier:1
//                                                                                constant:10];
    NSLayoutConstraint *orangeBoxLeftRightMargin = [NSLayoutConstraint constraintWithItem:self.orangeBoxleft
                                                                                 attribute:NSLayoutAttributeRightMargin
                                                                                 relatedBy:NSLayoutRelationEqual
                                                                                    toItem:self.orangeBoxright
                                                                                 attribute:NSLayoutAttributeLeft
                                                                                multiplier:1
                                                                                  constant:-20];
    NSLayoutConstraint *orangeBoxLeftCenterY = [NSLayoutConstraint constraintWithItem:self.orangeBoxleft
                                                                             attribute:NSLayoutAttributeCenterY
                                                                             relatedBy:NSLayoutRelationEqual
                                                                                toItem:self.redBox
                                                                             attribute:NSLayoutAttributeCenterY
                                                                            multiplier:1 constant:1];
    
    
    orangeBoxLeftHeight.active = YES;
    orangeBoxLeftWidth.active = YES;
//    orangeBoxLeftTopMargin.active = YES;
    orangeBoxLeftRightMargin.active = YES;
    orangeBoxLeftCenterY.active = YES;
    ;

//TOP BLUE BOX IS 50 x 50
    self.blueBoxTop = [[UIView alloc] initWithFrame:CGRectZero];
    self.blueBoxTop.translatesAutoresizingMaskIntoConstraints = NO;
    self.blueBoxTop.backgroundColor = UIColor.blueColor;
    [self.framingView addSubview:self.blueBoxTop];
    
    NSLayoutConstraint *blueBoxTopHeight = [NSLayoutConstraint constraintWithItem:self.blueBoxTop
                                                                           attribute:NSLayoutAttributeHeight
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:nil
                                                                           attribute:NSLayoutAttributeNotAnAttribute multiplier:1
                                                                            constant:50];
    
    NSLayoutConstraint *blueBoxTopWidth = [NSLayoutConstraint constraintWithItem:self.blueBoxTop
                                                                          attribute:NSLayoutAttributeWidth
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:nil
                                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                                         multiplier:1
                                                                           constant:50];
    //    NSLayoutConstraint *orangeBoxLeftTopMargin = [NSLayoutConstraint constraintWithItem:self.orangeBoxleft
    //                                                                               attribute:NSLayoutAttributeTopMargin
    //                                                                               relatedBy:NSLayoutRelationEqual
    //                                                                                  toItem:self.redBox
    //                                                                               attribute:NSLayoutAttributeTop
    //                                                                              multiplier:1
    //                                                                                constant:10];
    NSLayoutConstraint *blueBoxTopCenterX = [NSLayoutConstraint constraintWithItem:self.blueBoxTop
                                                                                attribute:NSLayoutAttributeCenterX
                                                                                relatedBy:NSLayoutRelationEqual
                                                                                   toItem:self.framingView
                                                                                attribute:NSLayoutAttributeCenterX
                                                                               multiplier:1
                                                                                 constant:0];
    NSLayoutConstraint *blueBoxTopCenterY = [NSLayoutConstraint constraintWithItem:self.blueBoxTop
                                                                            attribute:NSLayoutAttributeCenterY
                                                                            relatedBy:NSLayoutRelationEqual
                                                                               toItem:self.framingView
                                                                            attribute:NSLayoutAttributeCenterY
                                                                           multiplier:0.5 constant:2];
    
    
    blueBoxTopHeight.active = YES;
    blueBoxTopWidth.active = YES;
    //    orangeBoxLeftTopMargin.active = YES;
    blueBoxTopCenterX.active = YES;
    blueBoxTopCenterY.active = YES;
    
    
//MIDDLE BLUE BOX IS 50 x 50
    
    self.blueBoxMiddle = [[UIView alloc] initWithFrame:CGRectZero];
    self.blueBoxMiddle.translatesAutoresizingMaskIntoConstraints = NO;
    self.blueBoxMiddle.backgroundColor = UIColor.blueColor;
    [self.framingView addSubview:self.blueBoxMiddle];
    
    NSLayoutConstraint *blueBoxMiddleHeight = [NSLayoutConstraint constraintWithItem:self.blueBoxMiddle
                                                                        attribute:NSLayoutAttributeHeight
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:nil
                                                                        attribute:NSLayoutAttributeNotAnAttribute multiplier:1
                                                                         constant:50];
    
    NSLayoutConstraint *blueBoxMiddleWidth = [NSLayoutConstraint constraintWithItem:self.blueBoxMiddle
                                                                       attribute:NSLayoutAttributeWidth
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:nil
                                                                       attribute:NSLayoutAttributeNotAnAttribute
                                                                      multiplier:1
                                                                        constant:50];
    //    NSLayoutConstraint *orangeBoxLeftTopMargin = [NSLayoutConstraint constraintWithItem:self.orangeBoxleft
    //                                                                               attribute:NSLayoutAttributeTopMargin
    //                                                                               relatedBy:NSLayoutRelationEqual
    //                                                                                  toItem:self.redBox
    //                                                                               attribute:NSLayoutAttributeTop
    //                                                                              multiplier:1
    //                                                                                constant:10];
    NSLayoutConstraint *blueBoxMiddleCenterX = [NSLayoutConstraint constraintWithItem:self.blueBoxMiddle
                                                                         attribute:NSLayoutAttributeCenterX
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:self.framingView
                                                                         attribute:NSLayoutAttributeCenterX
                                                                        multiplier:1
                                                                          constant:0];
    NSLayoutConstraint *blueBoxMiddleCenterY = [NSLayoutConstraint constraintWithItem:self.blueBoxMiddle
                                                                         attribute:NSLayoutAttributeCenterY
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:self.framingView
                                                                         attribute:NSLayoutAttributeCenterY
                                                                        multiplier:1 constant:0];
    
    
    blueBoxMiddleHeight.active = YES;
    blueBoxMiddleWidth.active = YES;
    //    orangeBoxLeftTopMargin.active = YES;
    blueBoxMiddleCenterX.active = YES;
    blueBoxMiddleCenterY.active = YES;
    
    
//BOTTOM BLUE BOX IS 50 x 50
    
    self.blueBoxBottom = [[UIView alloc] initWithFrame:CGRectZero];
    self.blueBoxBottom.translatesAutoresizingMaskIntoConstraints = NO;
    self.blueBoxBottom.backgroundColor = UIColor.blueColor;
    [self.framingView addSubview:self.blueBoxBottom];
    
    NSLayoutConstraint *blueBoxBottomHeight = [NSLayoutConstraint constraintWithItem:self.blueBoxBottom
                                                                        attribute:NSLayoutAttributeHeight
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:nil
                                                                        attribute:NSLayoutAttributeNotAnAttribute multiplier:1
                                                                         constant:50];
    
    NSLayoutConstraint *blueBoxBottomWidth = [NSLayoutConstraint constraintWithItem:self.blueBoxBottom
                                                                       attribute:NSLayoutAttributeWidth
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:nil
                                                                       attribute:NSLayoutAttributeNotAnAttribute
                                                                      multiplier:1
                                                                        constant:50];
    //    NSLayoutConstraint *orangeBoxLeftTopMargin = [NSLayoutConstraint constraintWithItem:self.orangeBoxleft
    //                                                                               attribute:NSLayoutAttributeTopMargin
    //                                                                               relatedBy:NSLayoutRelationEqual
    //                                                                                  toItem:self.redBox
    //                                                                               attribute:NSLayoutAttributeTop
    //                                                                              multiplier:1
    //                                                                                constant:10];
    NSLayoutConstraint *blueBoxBottomCenterX = [NSLayoutConstraint constraintWithItem:self.blueBoxBottom
                                                                         attribute:NSLayoutAttributeCenterX
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:self.framingView
                                                                         attribute:NSLayoutAttributeCenterX
                                                                        multiplier:1
                                                                          constant:0];
    NSLayoutConstraint *blueBoxBottomCenterY = [NSLayoutConstraint constraintWithItem:self.blueBoxBottom
                                                                         attribute:NSLayoutAttributeCenterY
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:self.framingView
                                                                         attribute:NSLayoutAttributeCenterY
                                                                        multiplier:1.5 constant:1.5];
    
    
    blueBoxBottomHeight.active = YES;
    blueBoxBottomWidth.active = YES;
    //    orangeBoxLeftTopMargin.active = YES;
    blueBoxBottomCenterX.active = YES;
    blueBoxBottomCenterY.active = YES;
    
    
}

/**
 Resize the frame of the framing view depending on which button was pressed.
 */
- (void)resizeFramingView:(id)sender
{
    CGFloat newWidth = 0.0;
    CGFloat newHeight = 0.0;
    
    if (sender == self.squareButton) {
        newWidth = 500.0;
        newHeight = 500.0;
    } else if (sender == self.portraitButton) {
        newWidth = 350.0;
        newHeight = 550.0;
    } else if (sender == self.landscapeButton) {
        newWidth = 900.0;
        newHeight = 300.0;
    }
    
    [UIView animateWithDuration:2.0 animations:^(){
        self.framingViewHeightConstraint.constant = newHeight;
        self.framingViewWidthConstraint.constant = newWidth;
        [self.view layoutIfNeeded];
    }];
}

@end
