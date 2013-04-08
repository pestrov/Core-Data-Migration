//
//  Publisher.m
//  Core Data Migration
//
//  Created by Nikita Pestrov on 06.04.13.
//  Copyright (c) 2013 easy ten. All rights reserved.
//

#import "Publisher.h"
#import "Ad.h"


@implementation Publisher

@dynamic name;
@dynamic rating;
@dynamic ads;

+ (Publisher *)initPublisherNamed:(NSString *)name inManagedContext:(NSManagedObjectContext *)context
{
  Publisher *newPublisher = [NSEntityDescription insertNewObjectForEntityForName:@"Publisher" inManagedObjectContext:context];
  newPublisher.name = name;
  return newPublisher;
  
}

@end
