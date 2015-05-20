//
//  DetailViewController.h
//  Every.Do
//
//  Created by Ian Tsai on 2015-05-20.
//  Copyright (c) 2015 Ian Tsai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Todo.h"
@interface DetailViewController : UIViewController

@property (strong, nonatomic) Todo *todoItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

