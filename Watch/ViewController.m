//
//  ViewController.m
//  Watch
//
//  Created by Andreas Andersson on 22/02/15.
//  Copyright (c) 2015 AppInMed. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic, weak) IBOutlet UIButton *button;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view setBackgroundColor:[UIColor redColor]];
}

-(IBAction)buttonOnClick:(id)sender{
    NSLog(@"%@ - %@",NSStringFromClass(self.class),NSStringFromSelector(_cmd));
}

@end
