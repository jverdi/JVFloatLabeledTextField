//
//  JVFloatLabeledTextView.h
//  JVFloatLabeledTextField
//
//  Created by Jared Verdi on 11/19/13.
//  Copyright (c) 2013 Jared Verdi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JVFloatLabeledTextView : UITextView

@property (nonatomic, copy) NSString * placeholder;

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
 *  @param placeholder   The string that is displayed when there is no other text in the text view.
 *  @param floatingTitle The string that is displayed above the text view when it's not empty.
 */
- (void)setPlaceholder:(NSString *)placeholder floatingTitle:(NSString *)floatingTitle;

@end
