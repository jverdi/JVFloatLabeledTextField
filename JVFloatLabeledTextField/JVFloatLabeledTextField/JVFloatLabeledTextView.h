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

@end
