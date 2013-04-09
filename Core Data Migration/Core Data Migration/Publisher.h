//
//  Publisher.h
//  Core Data Migration
//
//  Created by Nikita Pestrov on 06.04.13.
//  Copyright (c) 2013 easy ten. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Ad;

@interface Publisher : NSManagedObject

@property (nonatomic, retain) NSString * fullname;
@property (nonatomic, retain) NSNumber * rating;
@property (nonatomic, retain) NSSet *ads;

+ (Publisher *)initPublisherNamed:(NSString *)name inManagedContext:(NSManagedObjectContext *)context;

@end

@interface Publisher (CoreDataGeneratedAccessors)

- (void)addAdsObject:(Ad *)value;
- (void)removeAdsObject:(Ad *)value;
- (void)addAds:(NSSet *)values;
- (void)removeAds:(NSSet *)values;

@end
