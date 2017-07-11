//
//  ICounterPresenter.h
//  ios_objc_mvp_example
//
//  Created by Luis Sánchez-Beato Frates on 22/3/16.
//  Copyright © 2016 Luis Sánchez-Beato Frates. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ICounterPresenter <NSObject>

/**
 *  Describimos casos de uso/historias de usuario en la interfaz del presenter (en este caso ICounterPresenter)
 *  We describe use cases / user stories in the presenter interface (in this case ICounterPresenter)
 */

- (void)getCurrentValue;
- (void)incrementCounter;
- (void)decrementCounter;

@end
