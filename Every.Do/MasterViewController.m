//
//  MasterViewController.m
//  Every.Do
//
//  Created by Ian Tsai on 2015-05-20.
//  Copyright (c) 2015 Ian Tsai. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "Todo.h"
#import "ToDoCell.h"
#import "AddTodoViewController.h"

@interface MasterViewController () <AddToDoDelegate>

@property NSMutableArray *objects;

@end

@implementation MasterViewController

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    
    self.objects = [NSMutableArray array];
    
    Todo *todo = [[Todo alloc] init];
    todo.title = @"Vaccum Floor";
    todo.detail = @"take the vaccum and vaccum the damn floor";
    todo.priorityNumber = 1;
    todo.isCompletedIndicator = NO;
    [self.objects addObject:todo];
    
    todo = [[Todo alloc] init];
    todo.title = @"Swifer Floor";
    todo.detail = @"take the swifer and swifer the damn floor";
    todo.priorityNumber = 2;
    todo.isCompletedIndicator = NO;
    [self.objects addObject:todo];
    
    todo = [[Todo alloc] init];
    todo.title = @"Mop Floor";
    todo.detail = @"take the mop and mop the damn floor";
    todo.priorityNumber = 3;
    todo.isCompletedIndicator = NO;
    [self.objects addObject:todo];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Segues

-(void)addTodo:(Todo *)todo{
    
    [self.objects addObject:todo];
    [self.tableView reloadData];
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Todo *todo = (self.objects)[indexPath.row];
        [[segue destinationViewController] setTodoItem:todo];
    }
    else if ([[segue identifier] isEqualToString:@"AddNewToDo"]){
        //Todo *todo = [[Todo alloc] init];
        AddTodoViewController *addTodoVC = segue.destinationViewController;
        
        addTodoVC.delegate = self;
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ToDoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

//    NSDate *object = self.objects[indexPath.row];
//    cell.textLabel.text = [object description];
    
    Todo *todo = (self.objects)[indexPath.row];
    
    cell.titleLabel.text = todo.title;
    cell.detailLabel.text = todo.detail;
    cell.priorityLabel.text = [NSString stringWithFormat:@"%d",todo.priorityNumber];
    
    
    
    
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

@end
