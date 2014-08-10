//
//  JVFloatLabeledTextView.m
//  JVFloatLabeledTextField
//
//  Created by Jared Verdi on 11/19/13.
//  Copyright (c) 2013 Jared Verdi. All rights reserved.
//

#import "JVFloatLabeledTextView.h"
#import "NSString+TextDirectionality.h"

#define kFloatingLabelShowAnimationDuration 0.3f
#define kFloatingLabelHideAnimationDuration 0.3f

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
    self.startingTextContainerInsetTop = self.textContainerInset.top - 3;
    self.textContainer.lineFragmentPadding = 0;
    
    _placeholderLabel = [[UILabel alloc] initWithFrame:self.frame];
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
    _animateEvenIfNotFirstResponder = NO;
    _floatingLabelShowAnimationDuration = kFloatingLabelShowAnimationDuration;
    _floatingLabelHideAnimationDuration = kFloatingLabelHideAnimationDuration;

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(layoutSubviews)
                                                 name:UITextViewTextDidChangeNotification
                                               object:self];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(layoutSubviews)
                                                 name:UITextViewTextDidBeginEditingNotification
                                               object:self];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(layoutSubviews)
                                                 name:UITextViewTextDidEndEditingNotification
                                               object:self];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UITextViewTextDidChangeNotification
                                                  object:self];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UITextViewTextDidBeginEditingNotification
                                                  object:self];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UITextViewTextDidEndEditingNotification
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

- (void)setPlaceholder:(NSString *)placeholder floatingTitle:(NSString *)floatingTitle
{
    _placeholder = placeholder;
    _placeholderLabel.text = placeholder;
    [_placeholderLabel sizeToFit];

    _floatingLabel.text = floatingTitle;
    [_floatingLabel sizeToFit];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self adjustTextContainerInsetTop];
    
    CGRect textRect = [self textRect];
    
    _placeholderLabel.alpha = [self.text length] > 0 ? 0.0f : 1.0f;
    _placeholderLabel.frame = CGRectMake(textRect.origin.x, textRect.origin.y,
                                         _placeholderLabel.frame.size.width, _placeholderLabel.frame.size.height);
    [self setLabelOriginForTextAlignment];
    
    if (self.floatingLabelFont) {
        _floatingLabel.font = self.floatingLabelFont;
    }
    
    BOOL firstResponder = self.isFirstResponder;
    _floatingLabel.textColor = (firstResponder && self.text && self.text.length > 0 ? self.getLabelActiveColor : self.floatingLabelTextColor);
    if (!self.text || 0 == [self.text length]) {
        [self hideFloatingLabel:firstResponder];
    }
    else {
        [self showFloatingLabel:firstResponder];
    }
}

- (UIColor *)getLabelActiveColor
{
    if (_floatingLabelActiveTextColor) {
        return _floatingLabelActiveTextColor;
    }
    else if ([self respondsToSelector:@selector(tintColor)]) {
        return [self performSelector:@selector(tintColor)];
    }
    return [UIColor blueColor];
}

- (void)showFloatingLabel:(BOOL)animated
{
    void (^showBlock)() = ^{
        _floatingLabel.alpha = 1.0f;
        _floatingLabel.frame = CGRectMake(_floatingLabel.frame.origin.x,
                                          _floatingLabelYPadding,
                                          _floatingLabel.frame.size.width,
                                          _floatingLabel.frame.size.height);
    };
    
    if (animated || _animateEvenIfNotFirstResponder) {
        [UIView animateWithDuration:_floatingLabelShowAnimationDuration
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
                                          _floatingLabel.font.lineHeight + _placeholderYPadding,
                                          _floatingLabel.frame.size.width,
                                          _floatingLabel.frame.size.height);
        
    };
    
    if (animated || _animateEvenIfNotFirstResponder) {
        [UIView animateWithDuration:_floatingLabelHideAnimationDuration
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
    self.textContainerInset = UIEdgeInsetsMake(self.startingTextContainerInsetTop + _floatingLabel.font.lineHeight + _placeholderYPadding,
                                               self.textContainerInset.left, self.textContainerInset.bottom, self.textContainerInset.right) ;
}

- (void)setLabelOriginForTextAlignment
{
    CGFloat floatingLabelOriginX = [self textRect].origin.x;
    CGFloat placeholderLabelOriginX = floatingLabelOriginX;
    
    if (self.textAlignment == NSTextAlignmentCenter) {
        floatingLabelOriginX = (self.frame.size.width/2) - (_floatingLabel.frame.size.width/2);
        placeholderLabelOriginX = (self.frame.size.width/2) - (_placeholderLabel.frame.size.width/2);
    }
    else if (self.textAlignment == NSTextAlignmentRight) {
        floatingLabelOriginX = self.frame.size.width - _floatingLabel.frame.size.width;
        placeholderLabelOriginX = self.frame.size.width - _placeholderLabel.frame.size.width - self.textContainerInset.right;
    } else if (self.textAlignment == NSTextAlignmentNatural) {
        JVTextDirection baseDirection = [_floatingLabel.text getBaseDirection];
        if (baseDirection == JVTextDirectionRightToLeft) {
            floatingLabelOriginX = self.frame.size.width - _floatingLabel.frame.size.width;
            placeholderLabelOriginX = self.frame.size.width - _placeholderLabel.frame.size.width - self.textContainerInset.right;
        }
    }
    
    _floatingLabel.frame = CGRectMake(floatingLabelOriginX, _floatingLabel.frame.origin.y,
                                      _floatingLabel.frame.size.width, _floatingLabel.frame.size.height);
    
    _placeholderLabel.frame = CGRectMake(placeholderLabelOriginX, _placeholderLabel.frame.origin.y,
                                         _placeholderLabel.frame.size.width, _placeholderLabel.frame.size.height);
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

- (void)setFloatingLabelFont:(UIFont *)floatingLabelFont
{
    _floatingLabelFont = floatingLabelFont;
    _floatingLabel.font = (_floatingLabelFont ? _floatingLabelFont : [UIFont boldSystemFontOfSize:12.0f]);
    self.placeholder = self.placeholder; // Force the label to lay itself out with the new font.
}

#pragma mark - Apple UITextView defaults

+ (UIColor *)defaultiOSPlaceholderColor
{
    return [[UIColor lightGrayColor] colorWithAlphaComponent:0.65f];
}

#pragma mark - UITextView

- (void)setTextAlignment:(NSTextAlignment)textAlignment
{
    [super setTextAlignment:textAlignment];
    
    [self setNeedsLayout];
}

- (void)setFont:(UIFont *)font
{
    [super setFont:font];
    self.placeholderLabel.font = self.font;
    [self layoutSubviews];
}

#pragma mark - Accessibility

- (NSString *)accessibilityLabel
{
    NSString *accessibilityLabel;
    if ([self.text isEqualToString:@""] == NO) {
        accessibilityLabel = [NSString stringWithFormat:@"%@ %@",[self.floatingLabel accessibilityLabel],self.text];
    } else {
        accessibilityLabel = [self.floatingLabel accessibilityLabel];
    }
    return accessibilityLabel;
}

@end
