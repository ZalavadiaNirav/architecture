//
//  ViewController.h
//  networkcoomon
//
//  Created by Nirav Zalavadia on 10/07/17.
//  Copyright © 2017 CNSoftNet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NetworkConnectionHandler.h"
#import "peopleViewModel.h"
#import "peopleModel.h"
#import "peopelDataSource.h"


@interface ViewController : UIViewController <peopleViewModelDelegate>
{
    peopleViewModel *objVM;
    peopelDataSource *pDataSource;
}

@property (nonatomic,retain) peopleViewModel *objVM;
@property (nonatomic,retain) peopelDataSource *pDataSource;

@property (weak, nonatomic) IBOutlet UITableView *peopleTbl;


@end

