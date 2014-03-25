//
//  JVFloatLabeledTextField.h
//  JVFloatLabeledTextField
//
//  The MIT License (MIT)
//
//  Copyright (c) 2013 Jared Verdi
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


#import <UIKit/UIKit.h>

@interface JVFloatLabeledTextField : UITextField

@property (nonatomic, strong, readonly) UILabel * floatingLabel;
@property (nonatomic, strong) NSNumber * floatingLabelYPadding UI_APPEARANCE_SELECTOR;
@property (nonatomic, strong) UIFont * floatingLabelFont UI_APPEARANCE_SELECTOR;
@property (nonatomic, strong) UIColor * floatingLabelTextColor UI_APPEARANCE_SELECTOR;
@property (nonatomic, strong) UIColor * floatingLabelActiveTextColor UI_APPEARANCE_SELECTOR; // tint color is used by default if not provided
@property (nonatomic, assign) NSInteger animateEvenIfNotFirstResponder UI_APPEARANCE_SELECTOR; // Can't use BOOL for UI_APPEARANCE. Non-zero == YES
@property (nonatomic, assign) NSTimeInterval floatingLabelShowAnimationDuration;
@property (nonatomic, assign) NSTimeInterval floatingLabelHideAnimationDuration;

/**
 *  Sets the placeholder and the floating title
 *
 *  @param placeholder   The string that is displayed when there is no other text in the text field.
 *  @param floatingTitle The string that is displayed above the text field when it's not empty.
 */
- (void)setPlaceholder:(NSString *)placeholder floatingTitle:(NSString *)floatingTitle;

@end
