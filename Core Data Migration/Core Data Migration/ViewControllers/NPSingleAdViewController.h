//
//  NPSingleAdViewController.h
//  Core Data Migration
//
//  Created by Nikita Pestrov on 08.04.13.
//  Copyright (c) 2013 easy ten. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Ad.h"
#import "Publisher.h"
#import "Person.h"
#import "Company.h"
@interface NPSingleAdViewController : UIViewController

- (NPSingleAdViewController *)initWithAd:(Ad *)ad;

@end
