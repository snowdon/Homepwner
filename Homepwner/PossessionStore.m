//
//  PossessionStore.m
//  Homepwner
//
//  Created by  Chuns on 11-10-19.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "PossessionStore.h"
#import "Possession.h"

static PossessionStore *defaultStore = nil;

@implementation PossessionStore

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
    if (self) {
        allPossessions = [[NSMutableArray alloc] init];
    }
    
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
    return allPossessions;
}

- (Possession *)createPossession
{
    Possession *p = [Possession randomPossession];
    
    [allPossessions addObject:p];
    
    return p;
}

@end
