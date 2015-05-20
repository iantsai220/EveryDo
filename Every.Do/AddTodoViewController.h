//
//  addTodoViewController.h
//  Every.Do
//
//  Created by Ian Tsai on 2015-05-20.
//  Copyright (c) 2015 Ian Tsai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Todo.h"

@protocol AddToDoDelegate <NSObject>

-(void)addTodo:(Todo *)todo;

@end


@interface AddTodoViewController : UIViewController

@property (nonatomic, weak) id<AddToDoDelegate> delegate;

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;

@property (weak, nonatomic) IBOutlet UITextField *detailTextField;

@property (weak, nonatomic) IBOutlet UITextField *priorityTextField;

- (IBAction)saveTodo:(id)sender;

@end
