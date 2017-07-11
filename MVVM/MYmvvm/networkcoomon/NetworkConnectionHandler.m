//
//  NetworkConnectionHandler.m
//  networkcoomon
//
//  Created by Nirav Zalavadia on 10/07/17.
//  Copyright © 2017 CNSoftNet. All rights reserved.
//

#import "NetworkConnectionHandler.h"

@implementation NetworkConnectionHandler

-(void)getPeopleList:(int)tag
{
    NSURL *url=[NSURL URLWithString:[NSString stringWithFormat:@"http:www.swapi.co/api/people"]];
    NSURLSession *session=[NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSMutableURLRequest *req=[self getRequestBodyWithRequestType:@"GET" URL:url parameters:nil];
    [self callWebServiceForSession:session Request:req withTag:tag];
}


-(void)sendErrorToSender :(id)response tag:(int)tag
{
    [_networkDelegate networkConnectionDidFailWithError:@"error occur in api response" tag:tag];
}

-(void)sendResponseToSender :(id)response tag:(int)tag
{
    if([[response objectForKey:@"count"] intValue]>0)
    {
        [_networkDelegate networkConnectionFinishedSuccessfully:response tag:tag];
    }
    else
    {
        [_networkDelegate networkRequestRejected:[NSString stringWithFormat:@"%@",[response objectForKey:@"message"]] tag:tag];
    }
}

-(NSMutableURLRequest *)getRequestBodyWithRequestType :(NSString *)requestType URL:(NSURL *)url parameters:(NSDictionary *)parametersDict
{
    NSMutableURLRequest *req=[[NSMutableURLRequest alloc] initWithURL:url];
    [req setHTTPMethod:requestType];
    [req setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
//    [req setValue:@"TOken" forHTTPHeaderField:@"Authorization"];
    return req;
    
}


-(void)callWebServiceForSession :(NSURLSession *)session Request:(NSMutableURLRequest *)request withTag:(int)tag
{
    NSURLSessionDataTask *task=[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *   response, NSError *error)
    {
        if(error !=nil)
        {
            [self sendErrorToSender:error tag:tag];
            NSLog(@"ERROR");
        }
        else
        {
            @try
            {
                NSDictionary *responseDict=[NSJSONSerialization JSONObjectWithData:data options:0 error:(&error)];
                [self sendResponseToSender:responseDict tag:tag];
            }
            @catch(NSException *exception) {
                NSLog(@"error %@ Exception %@",[error description],exception.description);
            }
            
        }
        
    }];
    [task resume];
}




@end
