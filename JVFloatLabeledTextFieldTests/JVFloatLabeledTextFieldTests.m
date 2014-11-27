//
//  JVFloatLabeledTextFieldTests.m
//  JVFloatLabeledTextFieldTests
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
#import "JVFloatLabeledTextField.h"

@interface JVFloatLabeledTextFieldTests : XCTestCase
@property (nonatomic, strong) JVFloatLabeledTextField * testField;
@end

@implementation JVFloatLabeledTextFieldTests

- (void)setUp
{
    [super setUp];
    
    self.testField = [[JVFloatLabeledTextField alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 100.0f, 44.0f)];
    self.testField.placeholder = @"Test";
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testDefaults
{
    XCTAssertEqual(self.testField.floatingLabelYPadding, 0.0f);
    XCTAssertEqual(self.testField.placeholderYPadding, 0.0f);
    XCTAssertEqual(self.testField.floatingLabelFont, [UIFont boldSystemFontOfSize:12.0f]);
    XCTAssertEqual(self.testField.floatingLabelFont, self.testField.floatingLabel.font);
    XCTAssert(CGColorEqualToColor(self.testField.floatingLabelTextColor.CGColor, [UIColor grayColor].CGColor));
    XCTAssert(CGColorEqualToColor(self.testField.floatingLabelTextColor.CGColor, self.testField.floatingLabel.textColor.CGColor));
    XCTAssert(CGColorEqualToColor(self.testField.floatingLabelActiveTextColor.CGColor, self.testField.tintColor.CGColor));
    XCTAssertEqual(self.testField.animateEvenIfNotFirstResponder, 0);
    XCTAssertEqual(self.testField.floatingLabelShowAnimationDuration, 0.3f);
    XCTAssertEqual(self.testField.floatingLabelHideAnimationDuration, 0.3f);
    XCTAssertEqual(self.testField.hasUnderline, NO);
    XCTAssertEqual(self.testField.underlineHight, 0.5f);
    XCTAssert(CGColorEqualToColor(self.testField.underlineColor.CGColor, [UIColor lightGrayColor].CGColor));
}

@end
