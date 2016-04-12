//
//  CustomViewController.m
//  presentationViewController
//
//  Created by dubhe on 16/4/11.
//  Copyright © 2016年 dubhe. All rights reserved.
//

#import "CustomViewController.h"
#import "CustomAlertSheetContextTransition.h"
#import "PresentationController.h"
#import "ViewController.h"

@interface CustomViewController ()<UIViewControllerTransitioningDelegate,UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *data;

@end

@implementation CustomViewController
- (instancetype) init {
    if (self == [super init]) {
        self.transitioningDelegate = self;
        self.modalPresentationStyle = UIModalPresentationCustom;
    }
    return self;
}

- (void) loadData {
    NSArray * arr = @[@"确定",
                      @"取消",
                      @"下一级"];
    if (_data) {
        _data = [NSMutableArray array];
    }else {
        [_data removeAllObjects];
    }
    _data = [NSMutableArray arrayWithArray:arr];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.userInteractionEnabled = YES;
    UITableView * tableView = [[UITableView alloc] init];
    tableView.clipsToBounds = YES;
    tableView.layer.borderWidth = 1;
    tableView.layer.borderColor = [UIColor grayColor].CGColor;
    tableView.layer.cornerRadius = 2;
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
    self.tableView = tableView;
    tableView.translatesAutoresizingMaskIntoConstraints = NO;
    NSMutableArray *constraintsArr = [NSMutableArray array];
    [constraintsArr addObject:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0]];
    [constraintsArr addObject:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:0]];
    [constraintsArr addObject:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0]];
    [constraintsArr addObject:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:400]];
    [self.view addConstraints:constraintsArr];
        
    [self loadData];
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _data.count;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self DismissAction:nil];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = _data[indexPath.row];
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
     [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
    NSLog(@"我被选了");
}

- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source {
    PresentationController * presentationCon = [[PresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
    return presentationCon;
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    CustomAlertSheetContextTransition * transition = [[CustomAlertSheetContextTransition alloc] init];
    transition.isPresent = YES;
    return transition;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    CustomAlertSheetContextTransition * transition = [[CustomAlertSheetContextTransition alloc] init];
    transition.isPresent = NO;
    return transition;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) DismissAction:(UITapGestureRecognizer *)tap {
    [(ViewController*)self.presentingViewController controllerWillDismiss];
}

@end
