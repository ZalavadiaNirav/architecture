//
//  CounterPresenter.m
//  ios_objc_mvp_example
//
//  Created by Luis Sánchez-Beato Frates on 22/3/16.
//  Copyright © 2016 Luis Sánchez-Beato Frates. All rights reserved.
//

#import "CounterPresenter.h"

@implementation CounterPresenter

#pragma mark - Init methods

- (CounterPresenter *)initWithRepository:(id <ICounterRepository>)repository inView:(id <ICounterView>)view {

    if (self = [super init]) {
        counterRepository = repository;
        counterView = view;
    }
    
    return self;
}


/**
 *  Implementamos los métodos del protocolo ICounterPresenter en CounterPresenter.
 */

#pragma mark - ICounterPresenter Protocol Methods

- (void)getCurrentValue {    
    [counterView updateCounterValue:[NSString stringWithFormat:@"%ld", (long)[counterRepository getCurrentValue]]];
}

- (void)incrementCounter {
    
    NSInteger value = [counterRepository getCurrentValue];
    
    value = value + 1;

    [counterRepository setCurrentValue:value];

    [counterView updateCounterValue:[NSString stringWithFormat:@"%ld", (long)value]];    
}

- (void)decrementCounter {

    NSInteger value = [counterRepository getCurrentValue];
    
    value = value - 1;
    
    [counterRepository setCurrentValue:value];
    
    [counterView updateCounterValue:[NSString stringWithFormat:@"%ld", (long)value]];
}

@end
