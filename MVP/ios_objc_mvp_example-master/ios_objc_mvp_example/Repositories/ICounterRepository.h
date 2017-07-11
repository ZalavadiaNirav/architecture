//
//  ICounterRepository.h
//  ios_objc_mvp_example
//
//  Created by Luis Sánchez-Beato Frates on 14/6/16.
//  Copyright © 2016 Luis Sánchez-Beato Frates. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ICounterRepository <NSObject>

/**
 *  Describimos operaciones disponibles. 
 *  We describe available operations.
 */

-(NSInteger)getCurrentValue;
-(void)setCurrentValue:(NSInteger)value;

@end
