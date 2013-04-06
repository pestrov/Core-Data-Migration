//
//  NPCoreDataPrepopulator.m
//  Core Data Migration
//
//  Created by Nikita Pestrov on 06.04.13.
//  Copyright (c) 2013 easy ten. All rights reserved.
//

#import "NPCoreDataPrepopulator.h"
#import "Publisher.h"
#import "Ad.h"
#import "AppDelegate.h"

@implementation NPCoreDataPrepopulator

- (void)createdDataBaseFromScratch
{
  NSManagedObjectContext *context = [[AppDelegate sharedAppDelegate]managedObjectContext];
  Publisher *publisher1 = [Publisher initPublisherNamed:@"Nikita" inManagedContext:context];
  [publisher1 addAdsObject:[Ad initAdWithPrice:3000 andDescription:@"Room for rent" inManagedContext:context]];
  
  Publisher *publisher2 = [Publisher initPublisherNamed:@"David" inManagedContext:context];
  [publisher2 addAdsObject:[Ad initAdWithPrice:10000 andDescription:@"iPhone 4" inManagedContext:context]];
  
  Publisher *publisher3 = [Publisher initPublisherNamed:@"Jack" inManagedContext:context];
  [publisher3 addAdsObject:[Ad initAdWithPrice:70000 andDescription:@"Macbook Air" inManagedContext:context]];
  
  Publisher *publisher4 = [Publisher initPublisherNamed:@"Jack" inManagedContext:context];
  [publisher4 addAdsObject:[Ad initAdWithPrice:100000 andDescription:@"Audi A4" inManagedContext:context]];
  [publisher4 addAdsObject:[Ad initAdWithPrice:170000 andDescription:@"VW Golf" inManagedContext:context]];
  [publisher4 addAdsObject:[Ad initAdWithPrice:350000 andDescription:@"Aston Martin" inManagedContext:context]];
  
  NSError *err;
  [context save:&err];
}

@end
