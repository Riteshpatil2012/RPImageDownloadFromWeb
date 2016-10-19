//
//  ViewController.m
//  RPImageDownloadFromWeb
//
//  Created by Student P_08 on 16/10/16.
//  Copyright © 2016 riteshpatil. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setup];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setup{
    self.processBar.hidesWhenStopped = YES;
}

-(void)downloadImageFromURLString:(NSString *)urlstring{
    [self.processBar startAnimating];
    NSURL *URL = [NSURL URLWithString:urlstring];
    
    NSURLSessionConfiguration *myConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    NSURLSession *mySession = [NSURLSession sessionWithConfiguration:myConfiguration];
    
    NSURLSessionDownloadTask *myDownloadTask = [mySession downloadTaskWithURL:URL completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            
        }
        else{
            if (response) {
                NSHTTPURLResponse *httpresponce = (NSHTTPURLResponse *)response;
                if (httpresponce.statusCode == 200) {
                    NSData *imageData = [NSData dataWithContentsOfURL:location];
                    UIImage *myImage = [UIImage imageWithData:imageData];
                    [self performSelectorOnMainThread:@selector(reloadImage:) withObject:myImage waitUntilDone:NO];
                }
            }
        }
    }];
    [myDownloadTask resume];
}
-(void)reloadImage:(UIImage *)myImage{
    [self.processBar stopAnimating];
    self.myImageView.image = myImage;
}

- (IBAction)Downoad:(id)sender {
    [self downloadImageFromURLString:kImageURLString];
}
@end
