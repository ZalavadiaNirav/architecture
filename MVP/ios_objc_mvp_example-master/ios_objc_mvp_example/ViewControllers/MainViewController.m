//
//  MainViewController.m
//  ios_objc_mvp_example
//
//  Created by Luis Sánchez-Beato Frates on 2/3/16.
//  Copyright © 2016 Luis Sánchez-Beato Frates. All rights reserved.
//

#import "MainViewController.h"

#import "CounterRepository.h"

@interface MainViewController ()

@end

@implementation MainViewController

/**
 *  
 Inicializa presenter con el repositorio a usar y la vista a la que hará referencia.
 */

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Init repository.
    CounterRepository *counterRepository = [[CounterRepository alloc] init];
    
    // Init presenter with repository and view.
    presenter = [[CounterPresenter alloc]initWithRepository:counterRepository inView:self];
    
    // Display current value
    [presenter getCurrentValue];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

-(IBAction)incrementEvent:(id)sender {

    // Llamada a caso de uso/historia de usuario
    [presenter incrementCounter];
}

-(IBAction)decrementEvent:(id)sender {

    // Llamada a caso de uso/historia de usuario
    [presenter decrementCounter];
}

#pragma mark - ICounterView protocol methods

- (void)updateCounterValue:(NSString*)value {
    valueLabel.text = value;
}


@end
