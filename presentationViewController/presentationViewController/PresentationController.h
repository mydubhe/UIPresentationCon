//
//  PresentationController.h
//  presentationViewController
//
//  Created by dubhe on 16/4/11.
//  Copyright © 2016年 dubhe. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PresentationController;
@protocol PresentionControllerDelegate <NSObject>

- (void) controllerWillDismiss;

@end
@interface PresentationController : UIPresentationController
@property (nonatomic, assign) id<PresentionControllerDelegate> dismissDelegate;
@property (strong, nonatomic)  UIView *dimmingView;

@end
