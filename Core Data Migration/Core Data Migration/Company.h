//
//  Company.h
//  Core Data Migration
//
//  Created by Nikita Pestrov on 09.04.13.
//  Copyright (c) 2013 easy ten. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Publisher.h"


@interface Company : Publisher

@property (nonatomic, retain) NSNumber * experience;

+ (Company *)initCompanyNamed:(NSString *)name inManagedContext:(NSManagedObjectContext *)context;

@end
