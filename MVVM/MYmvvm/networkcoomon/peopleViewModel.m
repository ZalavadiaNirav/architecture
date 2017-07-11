//
//  peopleViewModel.m
//  networkcoomon
//
//  Created by Nirav Zalavadia on 11/07/17.
//  Copyright © 2017 CNSoftNet. All rights reserved.
//

#import "peopleViewModel.h"

@implementation peopleViewModel

#pragma mark -Network Methods

#pragma mark - Apicall

@synthesize peopleArr;

-(void)getPeopleData
{
    NetworkConnectionHandler *handler=[[NetworkConnectionHandler alloc] init];
    handler.networkDelegate=self;
    [handler getPeopleList:0];
}


-(void)networkConnectionFinishedSuccessfully:(id)response tag:(int)tag
{
    if (tag==0)
    {
       NSLog(@"data %@",[self parseDataInModel:response]);
        [_peopleViewDelegate sendResponse:(NSDictionary *)response];
    }

}

-(void)networkConnectionDidFailWithError:(NSString *)errorMsg tag:(int)tag
{
    [_peopleViewDelegate sendError:errorMsg];
    NSLog(@"didFailed");
}

-(void)networkRequestRejected:(NSString *)errorMsg tag:(int)tag
{
    [_peopleViewDelegate sendError:errorMsg];

    NSLog(@"rejected");
}

-(void)networkStatusInactive
{
    NSLog(@"No Internert Connection");
}

#pragma mark - Parse

-(NSMutableArray *)parseDataInModel :(NSDictionary *)responseDict
{
    peopleArr=[[NSMutableArray alloc] init];
    NSDictionary *temDict=(NSDictionary *)responseDict;
    NSArray *resultArr=[temDict objectForKey:@"results"];
    for (int i=0;i<[resultArr count]; i++)
    {
        pModel=[[peopleModel alloc] init];
        pModel.name=[[resultArr objectAtIndex:i] objectForKey:@"name"];
        pModel.height=[[resultArr objectAtIndex:i] objectForKey:@"height"];
        pModel.filmsArr=[[resultArr objectAtIndex:i] objectForKey:@"films"];
        [peopleArr addObject:pModel];
    }
    
    return peopleArr;
}



@end
