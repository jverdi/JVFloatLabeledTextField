//
//  NSString+TextDirectionality.h
//  JVFloatLabeledTextField
//
//  Created by Benjamin Briggs on 19/06/2014.
//  Copyright (c) 2014 Jared Verdi. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, JVTextDirection) {
    JVTextDirectionNeutral = 0,
    JVTextDirectionLeftToRight,
    JVTextDirectionRightToLeft,
};


@interface NSString (TextDirectionality)

-(JVTextDirection)getBaseDirection;

@end