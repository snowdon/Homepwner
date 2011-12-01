//
//  PossessionStore.h
//  Homepwner
//
//  Created by  Chuns on 11-10-19.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Possession;

@interface PossessionStore : NSObject {
    NSMutableArray *allPossessions;
}


// class method

+ (PossessionStore *)defaultStore;

- (NSArray *)allPossessions;
- (Possession *)createPossession;
- (void)removePossession:(Possession *)p;
- (void)movePossessionAtIndex:(int)from
                      toIndex:(int)to;

- (NSString *)possessionArchivePath;

- (BOOL)saveChanges;

- (void)fetchPossessionsIfNecessary;


@end
