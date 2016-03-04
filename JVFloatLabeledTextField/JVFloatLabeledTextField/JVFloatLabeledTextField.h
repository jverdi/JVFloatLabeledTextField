//
//  JVFloatLabeledTextField.h
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

#import <UIKit/UIKit.h>

/**
 * `JVFloatLabeledTextField` is a `UITextField` subclass that implements the "Float Label Pattern".
 *
 * Due to space constraints on mobile devices, it is common to rely solely on placeholders as a means to label fields.
 * This presents a UX problem, in that, once the user begins to fill out a form, no labels are present.
 *
 * `JVFloatLabeledTextField` aims to improve the user experience by having placeholders transition into 
 * "floating labels" that hover above the text field after it is populated with text.
 *
 * JVFloatLabeledTextField supports iOS 6+.
 *
 * Credits for the concept to Matt D. Smith (@mds), and his original design:  http://mattdsmith.com/float-label-pattern/
 */
IB_DESIGNABLE
@interface JVFloatLabeledTextField : UITextField

/**
 * Read-only access to the floating label.
 */
@property (nonatomic, strong, readonly) UILabel * floatingLabel;

/**
 * Padding to be applied to the y coordinate of the floating label upon presentation.
 * Defaults to zero.
 */
@property (nonatomic) IBInspectable CGFloat floatingLabelYPadding;

/**
 * Padding to be applied to the x coordinate of the floating label upon presentation.
 * Defaults to zero
 */
@property (nonatomic) IBInspectable CGFloat floatingLabelXPadding;

/**
 * Padding to be applied to the y coordinate of the placeholder.
 * Defaults to zero.
 */
@property (nonatomic) IBInspectable CGFloat placeholderYPadding;

/**
 * Font to be applied to the floating label. 
 * Defaults to the first applicable of the following:
 * - the custom specified attributed placeholder font at 70% of its size
 * - the custom specified textField font at 70% of its size
 */
@property (nonatomic, strong) UIFont * floatingLabelFont;

/**
 * Text color to be applied to the floating label. 
 * Defaults to `[UIColor grayColor]`.
 */
@property (nonatomic, strong) IBInspectable UIColor * floatingLabelTextColor;

/**
 * Text color to be applied to the floating label while the field is a first responder.
 * Tint color is used by default if an `floatingLabelActiveTextColor` is not provided.
 */
@property (nonatomic, strong) IBInspectable UIColor * floatingLabelActiveTextColor;

/**
 * Indicates whether the floating label's appearance should be animated regardless of first responder status.
 * By default, animation only occurs if the text field is a first responder.
 */
@property (nonatomic, assign) IBInspectable BOOL animateEvenIfNotFirstResponder;

/**
 * Duration of the animation when showing the floating label. 
 * Defaults to 0.3 seconds.
 */
@property (nonatomic, assign) NSTimeInterval floatingLabelShowAnimationDuration;

/**
 * Duration of the animation when hiding the floating label. 
 * Defaults to 0.3 seconds.
 */
@property (nonatomic, assign) NSTimeInterval floatingLabelHideAnimationDuration;

/**
 * Indicates whether the clearButton position is adjusted to align with the text
 * Defaults to 1.
 */
@property (nonatomic, assign) IBInspectable BOOL adjustsClearButtonRect;

/**
 * Indicates whether or not to drop the baseline when entering text. Setting to YES (not the default) means the standard greyed-out placeholder will be aligned with the entered text
 * Defaults to NO (standard placeholder will be above whatever text is entered)
 */
@property (nonatomic, assign) IBInspectable BOOL keepBaseline;

/**
 * Force floating label to be always visible
 * Defaults to NO
 */
@property (nonatomic, assign) BOOL alwaysShowFloatingLabel;

/**
 *  Sets the placeholder and the floating title
 *
 *  @param placeholder The string that to be shown in the text field when no other text is present.
 *  @param floatingTitle The string to be shown above the text field once it has been populated with text by the user.
 */
- (void)setPlaceholder:(NSString *)placeholder floatingTitle:(NSString *)floatingTitle;

@end
