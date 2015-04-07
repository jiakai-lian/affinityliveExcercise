//
//  YammerFeedViewController.m
//  AffinityLiveExcercise
//
//  Created by jiakai lian on 6/04/2015.
//  Copyright (c) 2015 jiakai. All rights reserved.
//

#import "YammerFeedViewController.h"
#import "YMConstants.h"
#import "UIViewController+AlertMessage.h"

@interface YammerFeedViewController ()
@property(weak, nonatomic) IBOutlet UILabel *labelTitle;
@property(weak, nonatomic) IBOutlet UILabel *labelAssignee;
@property(weak, nonatomic) IBOutlet UILabel *labelManager;
@property(weak, nonatomic) IBOutlet UITextView *textViewDescription;
@property(weak, nonatomic) IBOutlet UITextView *textViewMessage;

@end

@implementation YammerFeedViewController

@synthesize token;
@synthesize task;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didCompletePost:) name:YMYammerSDKPostFeedDidCompleteNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didFailPost:) name:YMYammerSDKPostFeedDidFailNotification object:nil];


    [self updateUI:task];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private Method
- (void)updateUI:(Task *)t
{
    self.labelTitle.text = t.title;
    self.labelAssignee.text = [t.assignee fullName];
    self.labelManager.text = [t.assignee fullName];//don't have manager data in sample json, so replace as assignee first
    self.textViewDescription.text = [t toJSONString];

}

#pragma mark - Yammer post feed notifications

- (void)didCompletePost:(NSNotification *)note
{
    [self showAlertMessageWithTitle:@"Post Feed" andMessage:@"Post Feed Succeed"];
}

- (void)didFailPost:(NSNotification *)note
{
    NSError *error = note.userInfo[YMYammerSDKErrorUserInfoKey];
    [self showAlertMessageWithTitle:@"Post Feed Error" andError:error];
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
