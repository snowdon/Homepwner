//
//  PossessionStore.m
//  Homepwner
//
//  Created by  Chuns on 11-10-19.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "PossessionStore.h"
#import "Possession.h"
#import "ImageStore.h"

static PossessionStore *defaultStore = nil;

@implementation PossessionStore

- (void)movePossessionAtIndex:(int)from
                      toIndex:(int)to
{
    if (from == to)
    {
        return;
    }
    
    Possession *p = [allPossessions objectAtIndex:from];
    [p retain];
    
    [allPossessions removeObjectAtIndex:from];
    
    [allPossessions insertObject:p atIndex:to];
    
    [p release];
    
}


- (void)removePossession:(Possession *)p
{
    NSString *key = [p imageKey];
    [[ImageStore defaultImageStore] deleteImageForKey:key];
    
    [allPossessions removeObjectIdenticalTo:p];
}

+ (PossessionStore *)defaultStore
{
    if(!defaultStore) {
        //create the singleton
        defaultStore = [[super allocWithZone:NULL] init];
    }
    return defaultStore;
}

+ (id)allocWithZone:(NSZone *)zone
{
    return [self defaultStore];
}

- (id)init
{
    if (defaultStore) {
        return defaultStore;
    }
    self = [super init];
   
    return self;
    
    
}

- (id)retain
{
    return self;
}

- (void)release
{
    
}

- (NSInteger)retainCount
{
    return NSUIntegerMax;
}


- (NSArray *)allPossessions
{
    [self fetchPossessionsIfNecessary];
    
    return allPossessions;
}

- (Possession *)createPossession
{
    [self fetchPossessionsIfNecessary];
    
    Possession *p = [Possession randomPossession];
    
    [allPossessions addObject:p];
    
    return p;
}

- (NSString *)possessionArchivePath
{
    return pathInDocumentDirectory(@"possessions.data");
}

- (BOOL)saveChanges
{
    return [NSKeyedArchiver archiveRootObject:allPossessions
                                       toFile:[self possessionArchivePath]];
}

- (void)fetchPossessionsIfNecessary
{
    if (!allPossessions) {
        NSString *path = [self possessionArchivePath];
        allPossessions = [[NSKeyedUnarchiver unarchiveObjectWithFile:path] retain];
        
        if (!allPossessions) {
            allPossessions = [[NSMutableArray alloc] init];
        }
    }
}


- (id)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    
    if (self) {
        [self setPossessionName:[decoder decodeObjectForKey:@"possessionName"]];
        [self setSerialNumber:[decoder decodeObjectForKey:@"sericalNumber"]];
        [self setImageKey:[decoder decodeObjectForKey:@"imageKey"]];
        
        [self setValueInDollars:[decoder decodeIntForKey:@"valueInDollars"]];
        
    //    dateCreated = [[decoder decodeObjectForKey:@"dateCreated"] retain];

        
    }
    return self;
}



@end
