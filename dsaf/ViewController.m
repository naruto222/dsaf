//
//  ViewController.m
//  dsaf
//
//  Created by gong on 16/3/21.
//  Copyright © 2016年 gong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<NSURLConnectionDataDelegate>
@property (nonatomic, strong) NSMutableData *fileData;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    NSURL *url = [NSURL URLWithString:@"http://4k.znds.com/20140314/bridge.jpg"];
    
    NSURLRequest *re = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection connectionWithRequest:re delegate:self];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    static int i = 0;
    i += data.length;
    NSLog(@"%d",i);
    
    [self.fileData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    self.fileData = [NSMutableData data];
    
    
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    
    [self.fileData writeToFile:[path stringByAppendingPathComponent:@"aaa"] atomically:YES];
}

@end
