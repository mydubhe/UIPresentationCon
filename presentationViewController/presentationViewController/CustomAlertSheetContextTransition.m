//
//  CustomAlertSheetContextTransition.m
//  presentationViewController
//
//  Created by dubhe on 16/4/11.
//  Copyright © 2016年 dubhe. All rights reserved.
//

#import "CustomAlertSheetContextTransition.h"

@interface CustomAlertSheetContextTransition ()

@end

@implementation CustomAlertSheetContextTransition
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.4f;
}
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    if (_isPresent) {
        [self animatePresentationWithTransition:transitionContext];
    }else {
        [self animateDismissTransition:transitionContext];
    }
}

- (void)animatePresentationWithTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    //获取到切入的控制器
    UIViewController *presentedController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *presentedView = [transitionContext viewForKey:UITransitionContextToViewKey];
    //获取到切换发生的View容器
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:presentedView];
    
    CGRect frame = [transitionContext finalFrameForViewController:presentedController];
    frame.origin.y += containerView.frame.size.height;
    presentedView.frame = frame;
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        presentedView.frame = [transitionContext finalFrameForViewController:presentedController];
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}

- (void)animateDismissTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    //获取到切入的控制器
    UIViewController *presentedController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView *presentedView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *containerView = [transitionContext containerView];
    
    CGRect frame = [transitionContext initialFrameForViewController:presentedController];
    frame.origin.y += containerView.frame.size.height;
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        presentedView.frame = frame;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}

@end
