//
//  MSHMonitor.m
//  AppleScriptAppLearning
//
//  Created by mrliu on 2020/12/21.
//

#import "MSHMonitor.h"

@implementation MSHMonitor

+ (id)checkMonitor:(NSString *)name
{
    NSLog(@"para is = %@", name);
//    return @"test return string";
//    return @{@"test key" : @"test value"};
    return @[@"string1", @"string2", @"string3"];
}

@end
