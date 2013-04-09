//
//  Company.m
//  Core Data Migration
//
//  Created by Nikita Pestrov on 09.04.13.
//  Copyright (c) 2013 easy ten. All rights reserved.
//

#import "Company.h"


@implementation Company

@dynamic experience;

+ (Company *)initCompanyNamed:(NSString *)name inManagedContext:(NSManagedObjectContext *)context
{
  Company *newPublisher = [NSEntityDescription insertNewObjectForEntityForName:@"Company" inManagedObjectContext:context];
  newPublisher.fullname = name;
  return newPublisher;
}

@end
