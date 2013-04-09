//
//  Person.m
//  Core Data Migration
//
//  Created by Nikita Pestrov on 09.04.13.
//  Copyright (c) 2013 easy ten. All rights reserved.
//

#import "Person.h"


@implementation Person

@dynamic age;

+ (Person *)initPersonNamed:(NSString *)name inManagedContext:(NSManagedObjectContext *)context
{
  Person *newPublisher = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:context];
  newPublisher.fullname = name;
  return newPublisher;
  
}
@end
