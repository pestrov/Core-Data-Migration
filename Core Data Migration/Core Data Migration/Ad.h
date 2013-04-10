//
//  Ad.h
//  Core Data Migration
//
//  Created by Nikita Pestrov on 05.04.13.
//  Copyright (c) 2013 easy ten. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Publisher, Country;

@interface Ad : NSManagedObject

@property (nonatomic, retain) NSDate * publicationDate;
@property (nonatomic, retain) NSString * adDescription;
@property (nonatomic, retain) NSNumber * price;
@property (nonatomic, strong) Publisher *publisher;
@property (nonatomic, strong) Country *country;

+ (Ad *)initAdWithPrice:(int)price andDescription:(NSString *)description inManagedContext:(NSManagedObjectContext *)context;
+ (NSArray *)allAdsInManagedContext:(NSManagedObjectContext *)context;

@end
