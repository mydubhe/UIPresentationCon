//
//  PresentationController.m
//  presentationViewController
//
//  Created by dubhe on 16/4/11.
//  Copyright © 2016年 dubhe. All rights reserved.
//

#import "PresentationController.h"

@implementation PresentationController

- (instancetype) initWithPresentedViewController:(UIViewController *)presentedViewController presentingViewController:(UIViewController *)presentingViewController {
    self = [super initWithPresentedViewController:presentedViewController presentingViewController:presentingViewController];
    if (self) {
        self.dimmingView = [[UIControl alloc] init];
        self.dimmingView.backgroundColor = [UIColor whiteColor];

    }
    return self;
}

- (void) presentationTransitionWillBegin {
    
    self.dimmingView.alpha = 0;
//    [self.containerView addSubview:self.presentedView];
    [self.presentedView setBackgroundColor:[UIColor blueColor]];
    [self.containerView addSubview:self.dimmingView];
    NSMutableArray * arr = [NSMutableArray array];
    self.dimmingView.translatesAutoresizingMaskIntoConstraints = NO;
    [arr addObject:[NSLayoutConstraint constraintWithItem:self.dimmingView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.containerView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    [arr addObject:[NSLayoutConstraint constraintWithItem:self.dimmingView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.containerView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
    [arr addObject:[NSLayoutConstraint constraintWithItem:self.dimmingView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.containerView attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0]];
    [arr addObject:[NSLayoutConstraint constraintWithItem:self.dimmingView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.containerView attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0]];
    [self.containerView addConstraints:arr];

    [self.presentingViewController.transitionCoordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        self.dimmingView.alpha = 0.5;
    } completion:nil];
}

- (void) presentationTransitionDidEnd:(BOOL)completed {
    if (!completed) {
        [self.dimmingView removeFromSuperview];
    }
}

- (void) dismissalTransitionWillBegin {
    [self.presentingViewController.transitionCoordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        self.dimmingView.alpha = 0;
    } completion:nil];
}

- (void) dismissalTransitionDidEnd:(BOOL)completed {
    if (completed) {
        [self.dimmingView removeFromSuperview];
    }
}




@end
