
//
//  ViewController.m
//  ElephantActivityController
//
//  Created by Kitten Yang on 7/30/15.
//  Copyright (c) 2015 Kitten Yang. All rights reserved.
//

#import "ViewController.h"
#import "WeiboActivity.h"


#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)



@interface ViewController ()

@property(nonatomic,strong)UIActivityViewController *activityController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)popUp:(id)sender {
    
    NSArray* activities = [NSArray arrayWithObjects:[WeiboActivity new], nil];
//    @[[WeiboActivity new]];
    
    NSArray *activityItems =[NSArray arrayWithObjects:@"这是一条测试文本",[UIImage imageNamed:@"avatar"],nil];
//  @[@"这是一条测试文本",[UIImage imageNamed:@"500 copy"]];
    
    self.activityController = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:activities];
    
    __typeof__(self) __weak selfBlock = self;
    
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"8.0"))
    {
        [self.activityController setCompletionWithItemsHandler:^(NSString *activityType, BOOL completed, NSArray *returnedItems, NSError *activityError) {

            selfBlock.activityController.excludedActivityTypes=nil;
            selfBlock.activityController = nil;
        }];
    }
    else
    {
        [self.activityController setCompletionHandler:^(NSString *activityType, BOOL completed) {
            selfBlock.activityController.excludedActivityTypes=nil;
            selfBlock.activityController = nil;
        }];
    }

    
    [self presentViewController:_activityController animated:YES completion:NULL];
    
}

@end
