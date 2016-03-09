//
//  JVFloatLabeledTextView.h
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
 * `JVFloatLabeledTextView` is a `UITextView` subclass that implements the "Float Label Pattern".
 *
 * Due to space constraints on mobile devices, it is common to rely solely on placeholders as a means to label fields.
 * This presents a UX problem, in that, once the user begins to fill out a form, no labels are present.
 *
 * `JVFloatLabeledTextView` aims to improve the user experience by having placeholders transition into "floating labels"
 * that hover above the text view after it is populated with text.
 *
 * JVFloatLabeledTextView supports iOS 7+.
 *
 * Credits for the concept to Matt D. Smith (@mds), and his original design:  http://mattdsmith.com/float-label-pattern/
 */
IB_DESIGNABLE
@interface JVFloatLabeledTextView : UITextView

/**
 * The placeholder string to be shown in the text view when no other text is present.
 */
@property (nonatomic, copy) IBInspectable NSString * placeholder;

/**
 * Read-only access to the placeholder label.
 */
@property (nonatomic, strong, readonly) UILabel * placeholderLabel;

/**
 * Read-only access to the floating label.
 */
@property (nonatomic, strong, readonly) UILabel * floatingLabel;

/**
 * Padding to be applied to the y coordinate of the floating label upon presentation.
 */
@property (nonatomic) IBInspectable CGFloat floatingLabelYPadding;

/**
 * Padding to be applied to the x coordinate of the floating label upon presentation.
 */
@property (nonatomic) IBInspectable CGFloat floatingLabelXPadding;

/**
 * Padding to be applied to the y coordinate of the placeholder.
 */
@property (nonatomic) IBInspectable CGFloat placeholderYPadding;

/**
 * Font to be applied to the floating label. Defaults to `[UIFont boldSystemFontOfSize:12.0f]`. 
 * Provided for the convenience of using as an appearance proxy.
 */
@property (nonatomic, strong) UIFont * floatingLabelFont;

/**
 * Text color to be applied to the floating label while the text view is not a first responder.
 * Defaults to `[UIColor grayColor]`. 
 * Provided for the convenience of using as an appearance proxy.
 */
@property (nonatomic, strong) IBInspectable UIColor * floatingLabelTextColor;

/**
 * Text color to be applied to the floating label while the text view is a first responder.
 * Tint color is used by default if an `floatingLabelActiveTextColor` is not provided.
 */
@property (nonatomic, strong) IBInspectable UIColor * floatingLabelActiveTextColor;

/**
 * Indicates whether the floating label should lock to the top of the text view, or scroll away with text when the text 
 * view is scrollable. By default, floating labels will lock to the top of the text view and their background color will
 * be set to the text view's background color
 * Note that this works best when floating labels have a non-clear background color.
 */
@property (nonatomic, assign) IBInspectable BOOL floatingLabelShouldLockToTop;

/**
 * Text color to be applied to the placeholder.
 * Defaults to `[[UIColor lightGrayColor] colorWithAlphaComponent:0.65f]`.
 */
@property (nonatomic, strong) IBInspectable UIColor * placeholderTextColor;

/**
 * Indicates whether the floating label's appearance should be animated regardless of first responder status.
 * By default, animation only occurs if the text field is a first responder.
 */
@property (nonatomic, assign) IBInspectable BOOL animateEvenIfNotFirstResponder;

/**
 * Duration of the animation when showing the floating label. 
 * Defaults to 0.3 seconds.
 */
@property (nonatomic, assign) NSTimeInterval floatingLabelShowAnimationDuration UI_APPEARANCE_SELECTOR;

/**
 * Duration of the animation when hiding the floating label. 
 * Defaults to 0.3 seconds.
 */
@property (nonatomic, assign) NSTimeInterval floatingLabelHideAnimationDuration UI_APPEARANCE_SELECTOR;

/**
 * Force floating label to be always visible
 * Defaults to NO
 */
@property (nonatomic, assign) BOOL alwaysShowFloatingLabel;

/**
 *  Sets the placeholder and the floating title
 *
 *  @param placeholder The string that to be shown in the text view when no other text is present.
 *  @param floatingTitle The string to be shown above the text view once it has been populated with text by the user.
 */
- (void)setPlaceholder:(NSString *)placeholder floatingTitle:(NSString *)floatingTitle;

@end
