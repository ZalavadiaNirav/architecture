//
//  ICounterView.h
//  ios_objc_mvp_example
//
//  Created by Luis Sánchez-Beato Frates on 22/3/16.
//  Copyright © 2016 Luis Sánchez-Beato Frates. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ICounterView <NSObject>

- (void)updateCounterValue:(NSString*)value;

@end
