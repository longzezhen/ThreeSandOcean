//
//  BaseNetwork.m
//  ThreeSandOcean
//
//  Created by 龙泽桢 on 2019/5/27.
//  Copyright © 2019 tools. All rights reserved.
//

#import "BaseNetwork.h"
@interface BaseNetwork()
@property (nonatomic,strong) AFHTTPSessionManager * manager;
@end

@implementation BaseNetwork
+(BaseNetwork *)shareNetwork
{
    static BaseNetwork * shareNetwork = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareNetwork = [[BaseNetwork alloc] init];
    });
    return shareNetwork;
}

-(void)getWithPath:(NSString *)path params:(id)params success:(HttpSuccessBlock)success failure:(HttpFailureBlock)failure
{
    [self.manager GET:path parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(task,[responseObject[@"code"] integerValue],responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}

-(void)postWithPath:(NSString *)path params:(id)params success:(HttpSuccessBlock)success failure:(HttpFailureBlock)failure
{
    [self.manager POST:path parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(task,[responseObject[@"code"] integerValue],responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}

#pragma mark - get
-(AFHTTPSessionManager *)manager
{
    if (!_manager) {
        _manager = [AFHTTPSessionManager manager];
        _manager.requestSerializer = [AFJSONRequestSerializer serializer];
        _manager.responseSerializer = [AFJSONResponseSerializer serializer];
        AFSecurityPolicy * security = [AFSecurityPolicy defaultPolicy];
        security.allowInvalidCertificates = YES;
        security.validatesDomainName = NO;
        _manager.securityPolicy = security;
        _manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", @"text/xml",@"text/plain",nil];
        _manager.requestSerializer.timeoutInterval = 10;
    }
    return _manager;
}
@end
