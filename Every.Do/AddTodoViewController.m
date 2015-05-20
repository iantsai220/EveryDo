//
//  addTodoViewController.m
//  Every.Do
//
//  Created by Ian Tsai on 2015-05-20.
//  Copyright (c) 2015 Ian Tsai. All rights reserved.
//

#import "AddTodoViewController.h"

@interface AddTodoViewController () <UITextFieldDelegate>

@end

@implementation AddTodoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self resignFirstResponder];
    return YES;
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



- (IBAction)saveTodo:(id)sender {
    
    Todo *todo = [Todo new];
    
    todo.title = self.titleTextField.text;
    todo.detail = self.detailTextField.text;
    todo.priorityNumber = [self.priorityTextField.text intValue];
    
    [self.delegate addTodo:todo];
    
//    [self dismissViewControllerAnimated:NO completion:nil];
    [self.navigationController popViewControllerAnimated:YES];
    
}


@end
