//
//  Person.h
//  Core Data Migration
//
//  Created by Nikita Pestrov on 09.04.13.
//  Copyright (c) 2013 easy ten. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Publisher.h"


@interface Person : Publisher

@property (nonatomic, retain) NSNumber * age;

+ (Person *)initPersonNamed:(NSString *)name inManagedContext:(NSManagedObjectContext *)context;

@end
