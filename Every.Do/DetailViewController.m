//
//  DetailViewController.m
//  Every.Do
//
//  Created by Ian Tsai on 2015-05-20.
//  Copyright (c) 2015 Ian Tsai. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *detailLabel;

@property (weak, nonatomic) IBOutlet UILabel *priorityLabel;

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setTodoItem:(Todo*)newDetailItem {
    if (_todoItem != newDetailItem) {
        _todoItem = newDetailItem;
            
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    

    if (self.todoItem) {
        self.titleLabel.text = [self.todoItem title];
        self.detailLabel.text = [self.todoItem detail];
        self.priorityLabel.text = [NSString stringWithFormat:@"%d",[self.todoItem priorityNumber]];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
