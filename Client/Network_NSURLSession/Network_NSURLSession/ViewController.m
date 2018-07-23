//
//  ViewController.m
//  Network_NSURLSession
//
//  Created by Maple on 2018/7/23.
//  Copyright © 2018 Maple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)update {
    
    //构造 Request 对象，设置 url 和 POST 请求方法 以及请求体
    NSURL *url = [NSURL URLWithString:@"http://127.0.0.1:9000"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:[@"username=maple&password=xxx" dataUsingEncoding:NSUTF8StringEncoding]];
    //构造网络请求
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"%@ %@ %@ %@", data, response, error, [NSThread currentThread]);
    }];
    //启动任务
    [task resume];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self update];
}


/**
 Get 请求
 */
- (void)loadData {
    NSURLSession *session = [NSURLSession sharedSession];
    NSURL *url = [NSURL URLWithString:@"http://127.0.0.1:9000"];
    NSURLSessionDataTask *task = [session dataTaskWithURL:url
                                        completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        id obj = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves
                                                   error:nil];
        NSLog(@"%@ %@ %@ %@", obj, response, error, [NSThread currentThread]);
    }];
    [task resume];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self loadData];
    
}




@end
