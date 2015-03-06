//
//  ViewController.m
//  Watch
//
//  Created by Andreas Andersson on 22/02/15.
//  Copyright (c) 2015 AppInMed. All rights reserved.
//

#import "ViewController.h"

#import "MBProgressHUD.h"

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
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    [NSTimer scheduledTimerWithTimeInterval:.6 target:self selector:@selector(dismissHUD) userInfo:nil repeats:NO];
    
//    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
//        // Do something...
//    });
    
}

-(void)dismissHUD{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
//    dispatch_async(dispatch_get_main_queue(), ^{
//        
//    });
    
}

@end
