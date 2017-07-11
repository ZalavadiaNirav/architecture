//
//  MainViewController.h
//  ios_objc_mvp_example
//
//  Created by Luis Sánchez-Beato Frates on 2/3/16.
//  Copyright © 2016 Luis Sánchez-Beato Frates. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CounterPresenter.h"

#import "ICounterView.h"

@interface MainViewController : UIViewController<ICounterView> {

    CounterPresenter *presenter;
    
    IBOutlet UIButton *incrementButton;
    IBOutlet UIButton *decrementButton;
    IBOutlet UILabel *valueLabel;
}

-(IBAction)incrementEvent:(id)sender;
-(IBAction)decrementEvent:(id)sender;

@end
