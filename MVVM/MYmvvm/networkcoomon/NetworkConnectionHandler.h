//
//  NetworkConnectionHandler.h
//  networkcoomon
//
//  Created by Nirav Zalavadia on 10/07/17.
//  Copyright © 2017 CNSoftNet. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NetworkConnectionHandlerDelegate

-(void)networkConnectionFinishedSuccessfully :(id)response tag:(int)tag;
-(void)networkConnectionDidFailWithError :(NSString *)errorMsg tag:(int)tag;
-(void)networkRequestRejected :(NSString *)errorMsg tag:(int)tag;
-(void)networkStatusInactive;

@end

@interface NetworkConnectionHandler : NSObject

@property (weak) id<NetworkConnectionHandlerDelegate> networkDelegate;

-(void)getPeopleList:(int)tag;
@end
