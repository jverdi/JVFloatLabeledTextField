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

/**
 *  Inspects the string and determins a direction
 *  that is most likely.
 *
 *  @return the direction that the string in most likely to be.
 */
-(JVTextDirection)getBaseDirection;

@end