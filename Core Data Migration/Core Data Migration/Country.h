//
//  Country.h
//  Core Data Migration
//
//  Created by Nikita Pestrov on 10.04.13.
//  Copyright (c) 2013 easy ten. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Ad;

@interface Country : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *ads;

@end


@interface Country (CoreDataGeneratedAccessors)

- (void)addAdsObject:(Ad *)value;
- (void)removeAdsObject:(Ad *)value;
- (void)addAds:(NSSet *)values;
- (void)removeAds:(NSSet *)values;

@end