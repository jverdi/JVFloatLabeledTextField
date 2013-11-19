//
//  JVFloatLabeledTextView.m
//  JVFloatLabeledTextField
//
//  Created by Jared Verdi on 11/19/13.
//  Copyright (c) 2013 Jared Verdi. All rights reserved.
//

#import "JVFloatLabeledTextView.h"

const static CGFloat JVFloatLabeledTextViewDefaultLeftInset = 5.0f; // iOS default
const static CGFloat JVFloatLabeledTextViewDefaultTopInset = 8.0f; // iOS default

const static CGFloat JVFloatLabeledTextViewDefaultLeft6Inset = 8.0f; // iOS default
const static CGFloat JVFloatLabeledTextViewDefaultTop6Inset = 12.0f; // iOS default

const static CGFloat JVFloatLabeledTextViewDefaultRetinaInsetNudge = 0.5f; // iOS default

@interface JVFloatLabeledTextView ()

@property (nonatomic, strong, readonly) UILabel * placeholderLabel;
@property (nonatomic) CGFloat startingTextContainerInsetTop;

@end

@implementation JVFloatLabeledTextView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
	    [self commonInit];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commonInit];
        
        // force setter to be called on a placeholder defined in a NIB/Storyboard
    	if (self.placeholder) {
        	self.placeholder = self.placeholder;
    	}
    }
    return self;
}

- (void)commonInit
{
    self.startingTextContainerInsetTop = self.textContainerInset.top;
    
    _placeholderLabel = [UILabel new];
    _placeholderLabel.font = self.font;
    _placeholderLabel.text = self.placeholder;
    _placeholderLabel.numberOfLines = 0;
    _placeholderLabel.lineBreakMode = NSLineBreakByWordWrapping;
    _placeholderLabel.backgroundColor = [UIColor clearColor];
    _placeholderLabel.textColor = [JVFloatLabeledTextView defaultiOSPlaceholderColor];
    [self insertSubview:_placeholderLabel atIndex:0];
    
    _floatingLabel = [UILabel new];
    _floatingLabel.alpha = 0.0f;
    [self addSubview:_floatingLabel];
	
    // some basic default fonts/colors
    _floatingLabel.font = [UIFont boldSystemFontOfSize:12.0f];
    _floatingLabelTextColor = [UIColor grayColor];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(textDidChange:)
                                                 name:UITextViewTextDidChangeNotification
                                               object:self];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UITextViewTextDidChangeNotification
                                                  object:self];
}

#pragma mark -

- (void)setPlaceholder:(NSString *)placeholder
{
    _placeholder = placeholder;
    _placeholderLabel.text = placeholder;
    [_placeholderLabel sizeToFit];
    
    _floatingLabel.text = placeholder;
    [_floatingLabel sizeToFit];
}

- (void)layoutSubviews
{
    [self adjustTextContainerInsetTop];
    
    [super layoutSubviews];
    
    CGRect textRect = [self textRect];
    
    _placeholderLabel.frame = CGRectMake(textRect.origin.x, textRect.origin.y,
                                         _placeholderLabel.frame.size.width, _placeholderLabel.frame.size.height);
    [self setLabelOriginForTextAlignment];
    
    if (self.floatingLabelFont) {
        _floatingLabel.font = self.floatingLabelFont;
    }
    
    if (self.isFirstResponder) {
        if (!self.text || 0 == [self.text length]) {
            [self hideFloatingLabel:YES];
        }
        else {
            [self setLabelActiveColor];
            [self showFloatingLabel:YES];
        }
    }
    else {
        _floatingLabel.textColor = self.floatingLabelTextColor;
        if (!self.text || 0 == [self.text length]) {
            [self hideFloatingLabel:NO];
        }
        else {
            [self showFloatingLabel:NO];
        }
    }
}

- (void)setLabelActiveColor
{
    if (self.floatingLabelActiveTextColor) {
        _floatingLabel.textColor = self.floatingLabelActiveTextColor;
    }
    else if ([self respondsToSelector:@selector(tintColor)]) {
        _floatingLabel.textColor = [self performSelector:@selector(tintColor)];
    }
    else {
        _floatingLabel.textColor = [UIColor blueColor];
    }
}

- (void)showFloatingLabel:(BOOL)animated
{
    void (^showBlock)() = ^{
        _floatingLabel.alpha = 1.0f;
        _floatingLabel.frame = CGRectMake(_floatingLabel.frame.origin.x,
                                          2.0f,
                                          _floatingLabel.frame.size.width,
                                          _floatingLabel.frame.size.height);
    };
    
    if (animated) {
        [UIView animateWithDuration:0.3f
                              delay:0.0f
                            options:UIViewAnimationOptionBeginFromCurrentState|UIViewAnimationOptionCurveEaseOut
                         animations:showBlock
                         completion:nil];
    }
    else {
        showBlock();
    }
}

- (void)hideFloatingLabel:(BOOL)animated
{
    void (^hideBlock)() = ^{
        _floatingLabel.alpha = 0.0f;
        _floatingLabel.frame = CGRectMake(_floatingLabel.frame.origin.x,
                                          _floatingLabel.font.lineHeight + _floatingLabelYPadding.floatValue,
                                          _floatingLabel.frame.size.width,
                                          _floatingLabel.frame.size.height);
        
    };
    
    if (animated) {
        [UIView animateWithDuration:0.3f
                              delay:0.0f
                            options:UIViewAnimationOptionBeginFromCurrentState|UIViewAnimationOptionCurveEaseIn
                         animations:hideBlock
                         completion:nil];
    }
    else {
        hideBlock();
    }
}

- (void)adjustTextContainerInsetTop
{
    self.textContainerInset = UIEdgeInsetsMake(self.startingTextContainerInsetTop + _floatingLabel.font.lineHeight + _floatingLabelYPadding.floatValue,
                                               self.textContainerInset.left, self.textContainerInset.bottom, self.textContainerInset.right) ;
}

- (void)setLabelOriginForTextAlignment
{
    CGFloat originX = [self textRect].origin.x;
    
    if (self.textAlignment == NSTextAlignmentCenter) {
        originX = (self.frame.size.width/2) - (_floatingLabel.frame.size.width/2);
    }
    else if (self.textAlignment == NSTextAlignmentRight) {
        originX = self.frame.size.width - _floatingLabel.frame.size.width;
    }
    
    _floatingLabel.frame = CGRectMake(originX, _floatingLabel.frame.origin.y,
                                      _floatingLabel.frame.size.width, _floatingLabel.frame.size.height);
}

- (CGRect)textRect
{
    CGRect rect = UIEdgeInsetsInsetRect(self.bounds, self.contentInset);
    
    if (self.textContainer) {
        rect.origin.x += self.textContainer.lineFragmentPadding;
        rect.origin.y += self.textContainerInset.top;
    }
    
    return rect;
}

#pragma mark - Apple UITextView defaults

+ (UIColor *)defaultiOSPlaceholderColor
{
    return [UIColor colorWithWhite:0.702f alpha:1.0f];
}

#pragma mark - UITextView

- (void)setText:(NSString *)text
{
    [super setText:text];
    
    self.placeholderLabel.alpha = [self.placeholderLabel.text length] > 0 ? 1.0f : 0.0f;
}

- (void)setTextAlignment:(NSTextAlignment)textAlignment
{
    [super setTextAlignment:textAlignment];
    
    [self setNeedsLayout];
}

- (void)setFont:(UIFont *)font
{
    [super setFont:font];
    
    self.placeholderLabel.font = self.font;
}

#pragma mark - Notifications

- (void)textDidChange:(NSNotification *)notification
{
    self.placeholderLabel.alpha = [self.text length] > 0 ? 0.0f : 1.0f;
    [self layoutSubviews];
}

@end
