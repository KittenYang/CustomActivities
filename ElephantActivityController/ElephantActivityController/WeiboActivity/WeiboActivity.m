//
//  WeiboActivity.m
//  ElephantActivityController
//
//  Created by Kitten Yang on 7/30/15.
//  Copyright (c) 2015 Kitten Yang. All rights reserved.
//

#import "WeiboActivity.h"

@implementation WeiboActivity{
    
    NSArray *localActivityItems;
    NSString *string;
    UIImage *image;
    NSURL *url;
}


+ (UIActivityCategory)activityCategory{
    return UIActivityCategoryShare;
}

- (NSString *)activityType{
    
    return @"ElephantActivityTypeWeibo";
}

- (NSString *)activityTitle{
    return @"分享到微博";
}


- (UIImage *)activityImage{
    return [UIImage imageNamed:@"avatar"];
}


- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems{

    for (UIActivityItemProvider *item in activityItems) {
        if ([item isKindOfClass: [UIImage class]]) {
            return YES;
        }
        else if ([item isKindOfClass: [NSString class]])
        {
            return YES;
        }else if ([item isKindOfClass:[NSURL class]]){
            
            return YES;
        }
    }
    
    return NO;
}

- (void)prepareWithActivityItems:(NSArray *)activityItems{
    for (id item in activityItems) {
        
        if ([item isKindOfClass: [NSString class]]) {
            string = item;
        }
        else if ([item isKindOfClass: [UIImage class]]) {
            image = item;
        }
        else if ([item isKindOfClass: [NSURL class]]) {
            url = item;
        }
    }
    
    localActivityItems = [NSArray arrayWithArray:activityItems];
    NSLog(@"准备ActivityItems中...:%@",localActivityItems);
    
    
}

- (void)performActivity{
    
    
    NSLog(@"执行ActivityItems...:%@",localActivityItems);
    
    [self activityDidFinish:YES];
    
}


@end
