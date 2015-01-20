//
//  NSString+TextDirectionality.h
//  JVFloatLabeledTextField
//
//  The MIT License (MIT)
//
//  Copyright (c) 2013-2015 Jared Verdi
//  Original Concept by Matt D. Smith
//  http://dribbble.com/shots/1254439--GIF-Mobile-Form-Interaction?list=users
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of
//  this software and associated documentation files (the "Software"), to deal in
//  the Software without restriction, including without limitation the rights to
//  use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
//  the Software, and to permit persons to whom the Software is furnished to do so,
//  subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
//  FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
//  COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
//  IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
//  CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

//  Based on a Stack Overflow answer http://stackoverflow.com/a/13697277/900251

#import <Foundation/Foundation.h>

/**
 * `JVTextDirection` indicates text directionality, such as Neutral, Left-to-Right, and Right-to-Left
 */
typedef NS_ENUM(NSUInteger, JVTextDirection) {
    /**
     * `JVTextDirectionNeutral` indicates text with no directionality
     */
    JVTextDirectionNeutral = 0,
    
    /**
     * `JVTextDirectionLeftToRight` indicates text left-to-right directionality
     */
    JVTextDirectionLeftToRight,
    
    /**
     * `JVTextDirectionRightToLeft` indicates text right-to-left directionality
     */
    JVTextDirectionRightToLeft,
};

/**
 * `NSString (TextDirectionality)` is an NSString category that is used to infer the text directionality of a string.
 */
@interface NSString (TextDirectionality)

/**
 *  Inspects the string and makes a best guess at text directionality.
 *
 *  @return the inferred text directionality of this string.
 */
- (JVTextDirection)getBaseDirection;

@end