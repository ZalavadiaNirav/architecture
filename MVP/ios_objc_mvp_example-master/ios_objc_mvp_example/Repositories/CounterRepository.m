//
//  CounterRepository.m
//  ios_objc_mvp_example
//
//  Created by Luis Sánchez-Beato Frates on 14/6/16.
//  Copyright © 2016 Luis Sánchez-Beato Frates. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CounterRepository.h"

@implementation CounterRepository

-(NSInteger)getCurrentValue {
    return [[NSUserDefaults standardUserDefaults]integerForKey:@"CounterValueKey"];
}

-(void)setCurrentValue:(NSInteger)value {
    [[NSUserDefaults standardUserDefaults]setInteger:value forKey:@"CounterValueKey"];
    [[NSUserDefaults standardUserDefaults]synchronize];
}


@end