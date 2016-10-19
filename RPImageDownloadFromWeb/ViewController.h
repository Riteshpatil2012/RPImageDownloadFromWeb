//
//  ViewController.h
//  RPImageDownloadFromWeb
//
//  Created by Student P_08 on 16/10/16.
//  Copyright © 2016 riteshpatil. All rights reserved.
//
#define kImageURLString@"https://www.guthriegreen.com/sites/default/files/Kung-Fu-Panda-6%5B1%5D.jpg"

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *myImageView;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *processBar;
- (IBAction)Downoad:(id)sender;

@end

