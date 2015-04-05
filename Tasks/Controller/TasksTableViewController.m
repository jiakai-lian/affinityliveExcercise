//
//  TasksTableViewController.m
//  AffinityLiveExcercise
//
//  Created by jiakai lian on 5/04/2015.
//  Copyright (c) 2015 jiakai. All rights reserved.
//

#import "TasksTableViewController.h"
#import <OrderedDictionary.h>
#import "SampleTaskResponse.h"
#import "NSArray+Group.h"
#import "TaskTableViewCell.h"
#import "NSString+ALDate.h"

@interface TasksTableViewController ()

@property (nonatomic, strong) OrderedDictionary * tasks;

@end

@implementation TasksTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

     self.clearsSelectionOnViewWillAppear = NO;
    
    NSArray<Task> *array = [[SampleTaskResponse GetSampleJSONResponse] response];
    
    self.tasks = [array orderedDictionaryUsingBlock:^id<NSCopying>(id obj) {
        
        return ((Task *)obj).assignee;
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return self.tasks.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [[self.tasks objectAtIndex:section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TaskTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    Task * task = [[self.tasks objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    
    cell.labelTitle.text = task.title;
    cell.labelDateStarted.text = [task.date_started formatedUnixTimeStamp];
    cell.labelDateDue.text = [task.date_due formatedUnixTimeStamp];;
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    Assignee *assignee = [self.tasks keyAtIndex:section];

    //section title is the full name of the assignee
    return [NSString stringWithFormat:@"%@ %@", assignee.firstname, assignee.surname];
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
