//
//  peopelDataSource.h
//  networkcoomon
//
//  Created by Nirav Zalavadia on 11/07/17.
//  Copyright © 2017 CNSoftNet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "peopleModel.h"
#import "peopleViewModel.h"

@interface peopelDataSource : NSObject <UITableViewDelegate,UITableViewDataSource>
{
    
}

@property (nonatomic,retain) peopleModel *pModel;
@property (nonatomic,retain) peopleViewModel *pVModel;

@end
