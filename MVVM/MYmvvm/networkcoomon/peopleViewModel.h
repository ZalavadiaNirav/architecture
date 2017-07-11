//
//  peopleViewModel.h
//  networkcoomon
//
//  Created by Nirav Zalavadia on 11/07/17.
//  Copyright © 2017 CNSoftNet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "peopleModel.h"
#import "NetworkConnectionHandler.h"

@protocol peopleViewModelDelegate <NSObject>

-(void)sendResponse: (NSDictionary *)responseObject;
-(void)sendError :(NSString *)errorMessage;

@end


@interface peopleViewModel : NSObject <NetworkConnectionHandlerDelegate>
{
    peopleModel *pModel;
   
}

@property (nonatomic,retain) NSMutableArray *peopleArr;
@property (weak) id<peopleViewModelDelegate> peopleViewDelegate;

-(void)getPeopleData;

@end
