//
//  YammerAccountsViewController.m
//  AffinityLiveExercise
//
//  Created by jiakai lian on 5/04/2015.
//  Copyright (c) 2015 jiakai. All rights reserved.
//

#import "YammerAccountsViewController.h"
#import "YMMultiUserLoginController.h"
#import "YMConstants.h"
#import "UIViewController+AlertMessage.h"
#import "AccessTokenResponse.h"
#import "TaskHandlerProtocol.h"
#import "AuthTokenHandlerProtocol.h"

static NSString *const POST_FEED_SEGUE = @"PostFeedSegue";

@interface YammerAccountsViewController ()
@property(weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic, strong) NSArray <AccessTokenResponse> *responseArray;
@end

@implementation YammerAccountsViewController

@synthesize task;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didCompleteLogin:) name:YMYammerSDKLoginDidCompleteNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didFailLogin:) name:YMYammerSDKLoginDidFailNotification object:nil];

    self.responseArray = [[YMMultiUserLoginController sharedInstance] storedMultiUserAuthToken];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:YMYammerSDKLoginDidCompleteNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:YMYammerSDKLoginDidFailNotification object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Login controller notification handling methods

- (void)didCompleteLogin:(NSNotification *)note
{
    self.responseArray = [[YMMultiUserLoginController sharedInstance] storedMultiUserAuthToken];
    [self.tableView reloadData];
}

- (void)didFailLogin:(NSNotification *)note
{
    NSError *error = note.userInfo[YMYammerSDKErrorUserInfoKey];
    [self showAlertMessageWithTitle:@"Authentication error" andError:error];
}

#pragma mark - IBAction
- (IBAction)addNewYammerAccount:(id)sender
{
//    [[YMLoginController sharedInstance] clearAuthToken];
//    [[YMMultiUserLoginController sharedInstance] clearMultiUserAuthToken];
    [[YMMultiUserLoginController sharedInstance] startLogin];
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.responseArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *const CELL_IDENTIFIER = @"Account";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_IDENTIFIER forIndexPath:indexPath];

    AccessTokenResponse *response = [self.responseArray objectAtIndex:(NSUInteger)indexPath.row];

    cell.textLabel.text = response.user.email;
    return cell;
}


#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    AccessTokenResponse *response = [self.responseArray objectAtIndex:(NSUInteger) indexPath.row];
    [self performSegueWithIdentifier:POST_FEED_SEGUE sender:response.access_token.token];
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.

    UIViewController *destination = [segue destinationViewController];

    NSAssert([sender isKindOfClass:[NSString class]], @"Sender should be a string (token)");
    NSAssert([destination conformsToProtocol:@protocol(TaskHandlerProtocol)] && [destination conformsToProtocol:@protocol(AuthTokenHandlerProtocol)], @"Destination view controller should support TaskHandlerProtocol and AuthTokenHandlerProtocol");

    if ([destination conformsToProtocol:@protocol(TaskHandlerProtocol)] && [destination conformsToProtocol:@protocol(AuthTokenHandlerProtocol)])
    {
        UIViewController <TaskHandlerProtocol, AuthTokenHandlerProtocol> *controller = (UIViewController <TaskHandlerProtocol, AuthTokenHandlerProtocol> *) destination;
        controller.task = task;
        controller.token = (NSString *) sender;
    }

}


@end
