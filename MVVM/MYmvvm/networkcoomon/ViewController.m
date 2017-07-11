//
//  ViewController.m
//  networkcoomon
//
//  Created by Nirav Zalavadia on 10/07/17.
//  Copyright © 2017 CNSoftNet. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize pDataSource,objVM;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    objVM=[[peopleViewModel alloc] init];
    pDataSource=[[peopelDataSource alloc] init];

    objVM.peopleViewDelegate=self;
    [objVM getPeopleData];
}



-(void)sendResponse:(NSDictionary *)responseObject
{
    if([objVM.peopleArr count]>0)
    {
        [_peopleTbl registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellIdentifier"];
        pDataSource.pVModel=objVM;
        _peopleTbl.delegate=pDataSource;
        _peopleTbl.dataSource=pDataSource;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.peopleTbl reloadData];
        });
    }
    else
    {
        NSLog(@"NO Data to show");
    }
    NSLog(@"GET Response %@",responseObject);
}

-(void)sendError:(NSString *)errorMessage
{
    NSLog(@"Error %@",errorMessage);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
