//
//  JVFloatLabeledTextViewTests.m
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

#import <XCTest/XCTest.h>
#import "JVFloatLabeledTextView.h"

@interface JVFloatLabeledTextViewTests : XCTestCase
@property (nonatomic, strong) JVFloatLabeledTextView * testView;
@end

@implementation JVFloatLabeledTextViewTests

- (void)setUp
{
    [super setUp];
    
    self.testView = [[JVFloatLabeledTextView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 100.0f, 44.0f)];
    self.testView.placeholder = @"Test";
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testDefaults
{
    XCTAssertEqual(self.testView.placeholderLabel.text, self.testView.placeholder);
    XCTAssertEqual(self.testView.floatingLabelYPadding, 0.0f);
    XCTAssertEqual(self.testView.placeholderYPadding, 0.0f);
    XCTAssertEqual(self.testView.floatingLabelFont, [UIFont boldSystemFontOfSize:12.0f]);
    XCTAssertEqual(self.testView.floatingLabelFont, self.testView.floatingLabel.font);
    XCTAssert(CGColorEqualToColor(self.testView.floatingLabelTextColor.CGColor,
                                  [UIColor grayColor].CGColor));
    XCTAssert(CGColorEqualToColor(self.testView.floatingLabelTextColor.CGColor,
                                  self.testView.floatingLabel.textColor.CGColor));
    XCTAssert(CGColorEqualToColor(self.testView.floatingLabelActiveTextColor.CGColor,
                                  self.testView.tintColor.CGColor));
    XCTAssertEqual(self.testView.floatingLabelShouldLockToTop, 1);
    XCTAssert(CGColorEqualToColor(self.testView.placeholderTextColor.CGColor,
                                  [[UIColor lightGrayColor] colorWithAlphaComponent:0.65f].CGColor));
    XCTAssertEqual(self.testView.animateEvenIfNotFirstResponder, 0);
    XCTAssertEqual(self.testView.floatingLabelShowAnimationDuration, 0.3f);
    XCTAssertEqual(self.testView.floatingLabelHideAnimationDuration, 0.3f);
}

@end
