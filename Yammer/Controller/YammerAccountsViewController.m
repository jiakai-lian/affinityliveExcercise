//
//  YammerAccountsViewController.m
//  AffinityLiveExcercise
//
//  Created by jiakai lian on 5/04/2015.
//  Copyright (c) 2015 jiakai. All rights reserved.
//

#import "YammerAccountsViewController.h"
#import "YMLoginController.h"
#import "YMConstants.h"
#import "UIViewController+AlertMessage.h"
@interface YammerAccountsViewController ()

@end

@implementation YammerAccountsViewController

@synthesize task;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didCompleteLogin:) name:YMYammerSDKLoginDidCompleteNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didFailLogin:) name:YMYammerSDKLoginDidFailNotification object:nil];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:YMYammerSDKLoginDidCompleteNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:YMYammerSDKLoginDidFailNotification object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Login controller notification handling methods

- (void)didCompleteLogin:(NSNotification *)note
{
    NSString *authToken = note.userInfo[YMYammerSDKAuthTokenUserInfoKey];
//    [self handleSuccessWithToken:authToken];
}

- (void)didFailLogin:(NSNotification *)note
{
    NSError *error = note.userInfo[YMYammerSDKErrorUserInfoKey];
    [self showAlertMessageWithTitle:@"Authentication error" andError:error];
}

#pragma mark - IBAction
- (IBAction)addNewYammerAccount:(id)sender {
    [[YMLoginController sharedInstance] startLogin];
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}


#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
