//
//  NPCoreDataPrepopulator.m
//  Core Data Migration
//
//  Created by Nikita Pestrov on 06.04.13.
//  Copyright (c) 2013 easy ten. All rights reserved.
//

#import "NPCoreDataPrepopulator.h"
#import "Publisher.h"
#import "Person.h"
#import "Company.h"
#import "Ad.h"
#import "AppDelegate.h"

@implementation NPCoreDataPrepopulator

- (void)createdDataBaseFromScratch
{
  NSManagedObjectContext *context = [[AppDelegate sharedAppDelegate]managedObjectContext];
  Person *publisher1 = [Person initPersonNamed:@"Nikita" inManagedContext:context];
  [publisher1 addAdsObject:[Ad initAdWithPrice:3000 andDescription:@"Room for rent" inManagedContext:context]];
  publisher1.age = @19;
  
  Person *publisher2 = [Person initPersonNamed:@"David" inManagedContext:context];
  [publisher2 addAdsObject:[Ad initAdWithPrice:10000 andDescription:@"iPhone 4" inManagedContext:context]];
  publisher2.age = @23;
  
  Person *publisher3 = [Person initPersonNamed:@"Jack" inManagedContext:context];
  [publisher3 addAdsObject:[Ad initAdWithPrice:70000 andDescription:@"Macbook Air" inManagedContext:context]];
  publisher3.age = @27;
  
  Company *publisher4 = [Company initCompanyNamed:@"GM" inManagedContext:context];
  [publisher4 addAdsObject:[Ad initAdWithPrice:100000 andDescription:@"Audi A4" inManagedContext:context]];
  [publisher4 addAdsObject:[Ad initAdWithPrice:170000 andDescription:@"VW Golf" inManagedContext:context]];
  [publisher4 addAdsObject:[Ad initAdWithPrice:350000 andDescription:@"Aston Martin" inManagedContext:context]];
  publisher4.experience = @17;
  NSError *err;
  [context save:&err];
}

@end
