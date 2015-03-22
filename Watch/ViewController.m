//
//  ViewController.m
//  Watch
//
//  Created by Andreas Andersson on 22/02/15.
//  Copyright (c) 2015 AppInMed. All rights reserved.
//

#import "ViewController.h"

#import "MBProgressHUD.h"
#import "NZGoogleAnalyticsTracker.h"

#import "MKStoreKit.h"

@interface ViewController ()

@property(nonatomic, weak) IBOutlet UIButton *button;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view setBackgroundColor:[UIColor redColor]];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [NZGoogleAnalyticsTracker trackViewWithController:self];
}

-(IBAction)buttonOnClick:(id)sender{
    NSLog(@"%@ - %@",NSStringFromClass(self.class),NSStringFromSelector(_cmd));
    
//    com.fritzdorfsport.purchase.upgrade
//    
//    323ea75263674fcbbc0ebbd54a970254
    
    NSString *productIdentifier = @"com.fritzdorfsport.purchase.upgrade";
    [[MKStoreKit sharedKit] initiatePaymentRequestForProductWithIdentifier:productIdentifier];
    
    [[NSNotificationCenter defaultCenter] addObserverForName:kMKStoreKitProductPurchasedNotification
                                                      object:nil
                                                       queue:[[NSOperationQueue alloc] init]
                                                  usingBlock:^(NSNotification *note) {
                                                      
                                                      NSLog(@"Purchased/Subscribed to product with id: %@", [note object]);
                                                      
                                                      NSLog(@"%@", [[MKStoreKit sharedKit] valueForKey:@"purchaseRecord"]);
                                                  }];
    
//    [NZGoogleAnalyticsTracker trackEventWithCategory:@"category1" action:@"action1" label:@"label1"];
//
//    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
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
