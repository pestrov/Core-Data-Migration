//
//  NPToCountryMigrationPolicy.m
//  Core Data Migration
//
//  Created by Nikita Pestrov on 09.04.13.
//  Copyright (c) 2013 easy ten. All rights reserved.
//

#import "NPToCountryMigrationPolicy.h"
#define kFirstCountry @"kFirstCountry"

@implementation NPToCountryMigrationPolicy

- (BOOL)beginEntityMapping:(NSEntityMapping*)mapping
                   manager:(NSMigrationManager*)manager
                     error:(NSError**)error
{
  id country = [NSEntityDescription insertNewObjectForEntityForName:@"Country"
                                            inManagedObjectContext:[manager destinationContext]];
  [country setValue:@"Russia" forKey:@"name"];  
  NSDictionary *userInfo = [NSDictionary dictionaryWithObject:country forKey:kFirstCountry];
  [manager setUserInfo:userInfo];
  
  return YES;
}

- (BOOL)createDestinationInstancesForSourceInstance:(NSManagedObject*)sInstance
                                      entityMapping:(NSEntityMapping*)mapping
                                            manager:(NSMigrationManager*)manager
                                              error:(NSError**)error
{
  id destinationAdItem = [NSEntityDescription insertNewObjectForEntityForName:@"Ad"
                                                         inManagedObjectContext:[manager destinationContext]];
  
  NSEntityDescription *entity = [NSEntityDescription entityForName:@"Ad"
                                            inManagedObjectContext:[manager sourceContext]];
  NSDictionary *attributes = [entity attributesByName];
  NSArray *attributeNames = [attributes allKeys];
  NSDictionary *currentValues = [sInstance dictionaryWithValuesForKeys:attributeNames];
  [destinationAdItem setValuesForKeysWithDictionary:currentValues];
  
  [manager associateSourceInstance:sInstance
           withDestinationInstance:destinationAdItem
                  forEntityMapping:mapping];
  
  return YES;
}

- (BOOL)endInstanceCreationForEntityMapping:(NSEntityMapping*)mapping
                                    manager:(NSMigrationManager*)manager
                                      error:(NSError**)error
{
  return YES;
}

- (BOOL)createRelationshipsForDestinationInstance:(NSManagedObject*)dInstance
                                    entityMapping:(NSEntityMapping*)mapping
                                          manager:(NSMigrationManager*)manager
                                            error:(NSError**)error
{
  id country = [[manager userInfo] valueForKey:kFirstCountry];
  if (!country)
    NSLog(@"No country!");
  [dInstance setValue:country forKey:@"country"];
  return YES;
}

- (BOOL)endRelationshipCreationForEntityMapping:(NSEntityMapping*)mapping
                                        manager:(NSMigrationManager*)manager
                                          error:(NSError**)error
{
  return YES;
}

- (BOOL)performCustomValidationForEntityMapping:(NSEntityMapping*)mapping
                                        manager:(NSMigrationManager*)manager
                                          error:(NSError**)error
{
  NSFetchRequest *request = [[NSFetchRequest alloc] init];
  [request setIncludesPendingChanges:YES];
  [request setEntity:[NSEntityDescription entityForName:@"Ad"
                                 inManagedObjectContext:[manager destinationContext]]];
  [request setPredicate:[NSPredicate predicateWithFormat:@"country == nil"]];
  
  NSError *localError = nil;
  NSArray *results = [[manager destinationContext] executeFetchRequest:request
                                                                 error:&localError];
  if (localError) {
    *error = localError;
    return NO;
  }
  
  if ([results count] == 0) return YES;
  
  NSMutableArray *errors = [[NSMutableArray alloc] init];
  for (id adItem in results) {
    NSString *reason = [NSString stringWithFormat:@"Item with name %@ does not have a server set",
                        [adItem valueForKey:@"name"]];
    NSDictionary *dict = [NSDictionary dictionaryWithObject:reason
                                                     forKey:NSLocalizedDescriptionKey];
    NSError *itemError = [NSError errorWithDomain:@"PestrovMigration" code:1123 userInfo:dict];
    [errors addObject:itemError];
  }
  NSDictionary *userInfo = [NSDictionary dictionaryWithObjectsAndKeys:@"Validation failed on migration to model 4",
                            NSLocalizedDescriptionKey, errors, NSUnderlyingErrorKey, nil];
  *error = [NSError errorWithDomain:@"PestrovMigration" code:1124 userInfo:userInfo];
  
  return NO;
}

- (BOOL)endEntityMapping:(NSEntityMapping*)mapping
                 manager:(NSMigrationManager*)manager
                   error:(NSError**)error
{
  return YES;
}



@end
