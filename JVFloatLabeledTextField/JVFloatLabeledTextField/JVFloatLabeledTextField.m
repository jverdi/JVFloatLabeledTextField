//
//  JVFloatLabeledTextField.m
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

#import "JVFloatLabeledTextField.h"

@interface JVFloatLabeledTextField ()
@end

@implementation JVFloatLabeledTextField

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
    if(self) 
    {
        [self commonInit];
    }
    return self;
}

- (void)commonInit
{
    _floatingLabel = [UILabel new];
    _floatingLabel.alpha = 0.0f;
    [self addSubview:_floatingLabel];
	
    // some basic default fonts/colors
    _floatingLabel.font = [UIFont boldSystemFontOfSize:12.0f];
    self.floatingLabelTextColor = [UIColor grayColor];
    
    // If we're in a nib / storyboard we want to use the default placeholder as our placeholder
    if (self.placeholder) {
        self.placeholder = self.placeholder;
    }
}

- (void)setPlaceholder:(NSString *)placeholder
{
    [super setPlaceholder:placeholder];
    _floatingLabel.text = placeholder;
    [_floatingLabel sizeToFit];
    CGFloat originX = 0.f;
    if (self.textAlignment == NSTextAlignmentCenter)
        originX = (self.frame.size.width/2) - (_floatingLabel.frame.size.width/2);
    else if (self.textAlignment == NSTextAlignmentRight)
        originX = self.frame.size.width - _floatingLabel.frame.size.width;
    _floatingLabel.frame = CGRectMake(originX, _floatingLabel.font.lineHeight, _floatingLabel.frame.size.width, _floatingLabel.frame.size.height);
}

- (CGRect)textRectForBounds:(CGRect)bounds
{
	return UIEdgeInsetsInsetRect([super textRectForBounds:bounds], UIEdgeInsetsMake(_floatingLabel.font.lineHeight, 0.0f, 0.0f, 0.0f));
}

- (CGRect)editingRectForBounds:(CGRect)bounds
{
    return UIEdgeInsetsInsetRect([super editingRectForBounds:bounds], UIEdgeInsetsMake(_floatingLabel.font.lineHeight, 0.0f, 0.0f, 0.0f));
}

- (CGRect)clearButtonRectForBounds:(CGRect)bounds
{
	CGRect rect = [super clearButtonRectForBounds:bounds];
	rect = CGRectMake(rect.origin.x, rect.origin.y + _floatingLabel.font.lineHeight / 2.0f, rect.size.width, rect.size.height);
	return rect;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (self.isFirstResponder) {
        if (!self.text || 0 == [self.text length]) {
            [self hideFloatingLabel];
        }
        else {
            if (self.floatingLabelFont) {
                _floatingLabel.font = self.floatingLabelFont;
            }
            [self setLabelActiveColor];
            [self showFloatingLabel];
        }
    }
    else {
        _floatingLabel.textColor = self.floatingLabelTextColor;
        if (!self.text || 0 == [self.text length]) {
            [self hideFloatingLabel];
        }
    }
}

- (void)setLabelActiveColor {
    if (self.floatingLabelActiveTextColor) {
        _floatingLabel.textColor = self.floatingLabelActiveTextColor;
    }
    else {
        _floatingLabel.textColor = self.tintColor;
    }
}

- (void)showFloatingLabel
{
    [self setLabelOriginForTextAlignment];
    
    [UIView animateWithDuration:0.3f delay:0.0f options:UIViewAnimationOptionBeginFromCurrentState|UIViewAnimationOptionCurveEaseOut animations:^{
        _floatingLabel.alpha = 1.0f;
            
        _floatingLabel.frame = CGRectMake(_floatingLabel.frame.origin.x, 2.0f,
                                          _floatingLabel.frame.size.width, _floatingLabel.frame.size.height);
    } completion:nil];
}

- (void)hideFloatingLabel
{
    [self setLabelOriginForTextAlignment];
    
    [UIView animateWithDuration:0.3f delay:0.0f options:UIViewAnimationOptionBeginFromCurrentState|UIViewAnimationOptionCurveEaseIn animations:^{
        _floatingLabel.alpha = 0.0f;
    } completion:^(BOOL finished) {
        _floatingLabel.frame = CGRectMake(_floatingLabel.frame.origin.x, _floatingLabel.font.lineHeight,
                                          _floatingLabel.frame.size.width, _floatingLabel.frame.size.height);
    }];
}

- (void)setLabelOriginForTextAlignment
{
    CGFloat originX = _floatingLabel.frame.origin.x;
    if (self.textAlignment == NSTextAlignmentCenter) {
        originX = (self.frame.size.width/2) - (_floatingLabel.frame.size.width/2);
    }
    else if (self.textAlignment == NSTextAlignmentRight) {
        originX = self.frame.size.width - _floatingLabel.frame.size.width;
    }
    _floatingLabel.frame = CGRectMake(originX, _floatingLabel.frame.origin.y,
                                      _floatingLabel.frame.size.width, _floatingLabel.frame.size.height);
}

@end
