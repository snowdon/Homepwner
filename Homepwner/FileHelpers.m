//
//  FileHelpers.m
//  Homepwner
//
//  Created by  Chuns on 11-12-1.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "FileHelpers.h"

NSString *pathInDocumentDirectory(NSString *fileName)
{
    NSArray *documentDirectories = 
        NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                            NSUserDomainMask,YES);
    
    NSString *documentDirectory = [documentDirectories objectAtIndex:0];
    
    return [documentDirectory stringByAppendingPathComponent:fileName];
}
