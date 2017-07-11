//
//  CounterPresenter.h
//  ios_objc_mvp_example
//
//  Created by Luis Sánchez-Beato Frates on 22/3/16.
//  Copyright © 2016 Luis Sánchez-Beato Frates. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ICounterPresenter.h"
#import "ICounterRepository.h"
#import "ICounterView.h"

@interface CounterPresenter : NSObject <ICounterPresenter> {
    
    id<ICounterRepository> counterRepository;
    id<ICounterView> counterView;
}

- (CounterPresenter *)initWithRepository:(id <ICounterRepository>)counterRepository inView:(id <ICounterView>)counterView;


@end
