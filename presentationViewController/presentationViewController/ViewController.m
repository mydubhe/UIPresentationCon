//
//  ViewController.m
//  presentationViewController
//
//  Created by dubhe on 16/4/11.
//  Copyright © 2016年 dubhe. All rights reserved.
//

#import "ViewController.h"
#import "CustomViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    UIButton *button = [[UIButton alloc] init];
    [self.view addSubview:button];
    NSMutableArray * arr = [NSMutableArray array];
    button.translatesAutoresizingMaskIntoConstraints = NO;
    [arr addObject:[NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    [arr addObject:[NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
    [arr addObject:[NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0]];
    [arr addObject:[NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0]];
    [self.view addConstraints:arr];
    [button setBackgroundColor:[UIColor yellowColor]];
    [button addTarget:self action:@selector(showCustomController) forControlEvents:UIControlEventTouchUpInside];
}

- (void) showCustomController {
    CustomViewController * customVC = [[CustomViewController alloc] init];
    [self presentViewController:customVC animated:YES completion:nil];
}

- (void) controllerWillDismiss {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
