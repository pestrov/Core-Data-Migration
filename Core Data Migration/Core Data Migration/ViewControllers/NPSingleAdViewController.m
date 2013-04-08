//
//  NPSingleAdViewController.m
//  Core Data Migration
//
//  Created by Nikita Pestrov on 08.04.13.
//  Copyright (c) 2013 easy ten. All rights reserved.
//

#import "NPSingleAdViewController.h"

@interface NPSingleAdViewController ()
@property Ad *currentAd;

@property IBOutlet UILabel *ratingLabel;
@property IBOutlet UILabel *publisherLabel;
@property IBOutlet UILabel *adLabel;

@end

@implementation NPSingleAdViewController
- (NPSingleAdViewController *)initWithAd:(Ad *)ad
{
  self = [super init];
  if (self) {
    self.currentAd = ad;
  }
  return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
  self.adLabel.text = self.currentAd.adDescription;
  self.publisherLabel.text = self.currentAd.publisher.name;
  self.ratingLabel.text = [NSString stringWithFormat:@"Publisher rating: %@",self.currentAd.publisher.rating];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
