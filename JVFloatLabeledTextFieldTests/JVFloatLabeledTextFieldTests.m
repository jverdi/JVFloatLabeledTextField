//
//  JVFloatLabeledTextFieldTests.m
//  JVFloatLabeledTextFieldTests
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
    XCTAssertNotNil(self.testField.floatingLabelFont);
    XCTAssertEqual(self.testField.floatingLabelFont, self.testField.floatingLabel.font);
    XCTAssert(CGColorEqualToColor(self.testField.floatingLabelTextColor.CGColor,
                                  [UIColor grayColor].CGColor));
    XCTAssert(CGColorEqualToColor(self.testField.floatingLabelTextColor.CGColor,
                                  self.testField.floatingLabel.textColor.CGColor));
    XCTAssertNil(self.testField.floatingLabelActiveTextColor);
    XCTAssertEqual(self.testField.animateEvenIfNotFirstResponder, 0);
    XCTAssertEqual(self.testField.floatingLabelShowAnimationDuration, 0.3f);
    XCTAssertEqual(self.testField.floatingLabelHideAnimationDuration, 0.3f);
}

- (void)testHorizontalOffset
{
    self.testField.floatingLabelXPadding = -100;
    [self.testField layoutSubviews];
    XCTAssertEqual(self.testField.floatingLabel.frame.origin.x, -100);
}

- (void)testKeepBaseline
{
    self.testField.keepBaseline = 1;

    CGRect textRectInitial = [self.testField textRectForBounds:self.testField.bounds];
    CGRect editRectInitial = [self.testField editingRectForBounds:self.testField.bounds];
    CGRect clearRectInitial = [self.testField clearButtonRectForBounds:self.testField.bounds];

    self.testField.text = @"hello world!";

    CGRect textRectFinal = [self.testField textRectForBounds:self.testField.bounds];
    CGRect editRectFinal = [self.testField editingRectForBounds:self.testField.bounds];
    CGRect clearRectFinal = [self.testField clearButtonRectForBounds:self.testField.bounds];

    XCTAssert(CGRectEqualToRect(textRectInitial, textRectFinal));
    XCTAssert(CGRectEqualToRect(editRectInitial, editRectFinal));
    XCTAssert(CGRectEqualToRect(clearRectInitial, clearRectFinal));
}

-(void)testIntrinsicContentHeight
{
    self.testField.text = @"foo";
    CGFloat firstHeight = self.testField.intrinsicContentSize.height;
    
    self.testField.text = @"bar";
    CGFloat secondHeight = self.testField.intrinsicContentSize.height;
    
    XCTAssertEqual(firstHeight, secondHeight);
}

@end
