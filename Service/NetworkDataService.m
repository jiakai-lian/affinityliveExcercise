//
//  NetworkDataService.m
//  AffinityLiveExcercise
//
//  Created by jiakai lian on 4/04/2015.
//  Copyright (c) 2015 jiakai. All rights reserved.
//

#import "NetworkDataService.h"
#import "NSDictionary+URLEncoding.h"
#import "Common.h"

@interface NetworkDataService()

@property(nonatomic, strong) NSURLConnection *connection;
@property(nonatomic, strong) NSMutableData *responseData;
@property(nonatomic, copy) SuccessBlock successBlock;
@property(nonatomic, copy) FailureBlock failureBlock;
@property(nonatomic, strong) id data;

@end

@implementation NetworkDataService

static NSUInteger const TIMEOUT = 10;

static NSString *const GET = @"get";

- (void)getDataWithSuccessBlock:(SuccessBlock)success andFailureBlock:(FailureBlock)failure;
{
    self.successBlock = success;
    self.failureBlock = failure;

    [self sendRequest:SERVER_URL HttpMethod:GET Data:nil];
}


#pragma mark - NSURLConnectionDelegate

- (BOOL)connection:(NSURLConnection *)conn canAuthenticateAgainstProtectionSpace:(NSURLProtectionSpace *)protectionSpace
{
    return YES;
}

- (void)connection:(NSURLConnection *)conn didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge
{
    [challenge.sender useCredential:[NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust] forAuthenticationChallenge:challenge];
}

- (void)connection:(NSURLConnection *)conn didReceiveResponse:(NSURLResponse *)response
{
    [self.responseData setLength:0];
}

- (void)connection:(NSURLConnection *)conn didReceiveData:(NSData *)data
{
    // Append the new data to receivedData.
    // receivedData is an instance variable declared elsewhere.
    [self.responseData appendData:data];
}

- (void)connection:(NSURLConnection *)conn
  didFailWithError:(NSError *)error
{
    // inform error
    NSLog(@"Connection failed! Error - %@ %@",
          [error localizedDescription],
          [[error userInfo] objectForKey:NSURLErrorFailingURLStringErrorKey]);
    
    if (self.failureBlock)
    {
        self.failureBlock(error);
    }
}

- (void)connectionDidFinishLoading:(NSURLConnection *)conn
{
    NSLog(@"Succeeded! Received %lu bytes of data", (unsigned long) [_responseData length]);
    
    NSString *json = [[NSString alloc] initWithData:_responseData encoding:NSASCIIStringEncoding];
    NSLog(@"data = %@", json);
    
    self.data = json;
    
    _responseData = nil;
    
    if (self.successBlock)
    {
        self.successBlock(self.data);
    }
    
}



#pragma mark - Send Request

- (NSData *)sendRequest:(NSString *)url HttpMethod:(NSString *)httpMethod Data:(NSData *)data
{
    
    self.responseData = [NSMutableData dataWithCapacity:0];//clear the response first
    
    url = [url stringByAppendingString:[self createParametersString]];
    
    LOG(@"URL = %@", url);
    
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]
                                                            cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData
                                                        timeoutInterval:TIMEOUT];
    
    [request setHTTPMethod:httpMethod];
    
    [request addValue:@"application/json" forHTTPHeaderField:@"content-type"];
    
//    request = [self appendAuthentication:request];
    
    
    //[request setHTTPBody:data];
    
    self.connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    
    if (!self.connection)
    {
        // Release the receivedData object.
        _responseData = nil;
        
        // Inform the user that the connection failed.
    }
    
    return nil;
}

- (NSMutableURLRequest *)appendAuthentication:(NSMutableURLRequest *)request
{
    NSString *authStr = [NSString stringWithFormat:@"%@:%@", CLIENT_ID , CLIENT_SECRET];
    NSData *authData = [authStr dataUsingEncoding:NSASCIIStringEncoding];
    NSString *authValue = [NSString stringWithFormat:@"Basic %@", [authData base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed]];
    
    LOG(@"authValue = %@", authValue);
    [request setValue:authValue forHTTPHeaderField:@"Authorization"];
    
    return request;
}

- (NSString *)createParametersString
{
    NSDictionary* parameters = [[NSDictionary alloc] initWithObjectsAndKeys:
                                @"RedWine", @"password",
                                @"sample_user_1", @"username",
                                @"client_credentials", @"grant_type",
                                nil];
    
    return [parameters urlEncodedString];
    
    
}

@end
