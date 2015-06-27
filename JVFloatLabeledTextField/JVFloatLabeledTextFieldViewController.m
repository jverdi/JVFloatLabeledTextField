//
//  JVFloatLabeledTextFieldViewController.m
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

#import "JVFloatLabeledTextFieldViewController.h"
#import "JVFloatLabeledTextField.h"
#import "JVFloatLabeledTextView.h"

const static CGFloat kJVFieldHeight = 44.0f;
const static CGFloat kJVFieldHMargin = 10.0f;

const static CGFloat kJVFieldFontSize = 16.0f;

const static CGFloat kJVFieldFloatingLabelFontSize = 11.0f;

@interface JVFloatLabeledTextFieldViewController ()

@end

@implementation JVFloatLabeledTextFieldViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Floating Label Demo", @"");
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.

    self.edgesForExtendedLayout = UIRectEdgeNone;
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 70000
    [self.view setTintColor:[UIColor blueColor]];
#endif
    
    UIColor *floatingLabelColor = [UIColor brownColor];
    
    JVFloatLabeledTextField *titleField = [[JVFloatLabeledTextField alloc] initWithFrame:CGRectZero];
    titleField.font = [UIFont systemFontOfSize:kJVFieldFontSize];
    titleField.attributedPlaceholder =
    [[NSAttributedString alloc] initWithString:NSLocalizedString(@"Title", @"")
                                    attributes:@{NSForegroundColorAttributeName: [UIColor darkGrayColor]}];
    titleField.floatingLabelFont = [UIFont boldSystemFontOfSize:kJVFieldFloatingLabelFontSize];
    titleField.floatingLabelTextColor = floatingLabelColor;
    titleField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.view addSubview:titleField];
    titleField.translatesAutoresizingMaskIntoConstraints = NO;
    titleField.keepBaseline = YES;

    UIView *div1 = [UIView new];
    div1.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.3f];
    [self.view addSubview:div1];
    div1.translatesAutoresizingMaskIntoConstraints = NO;

    JVFloatLabeledTextField *priceField = [[JVFloatLabeledTextField alloc] initWithFrame:CGRectZero];
    priceField.font = [UIFont systemFontOfSize:kJVFieldFontSize];
    priceField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:NSLocalizedString(@"Price", @"")
                                                                       attributes:@{NSForegroundColorAttributeName: [UIColor darkGrayColor]}];
    priceField.floatingLabelFont = [UIFont boldSystemFontOfSize:kJVFieldFloatingLabelFontSize];
    priceField.floatingLabelTextColor = floatingLabelColor;
    [self.view addSubview:priceField];
    priceField.translatesAutoresizingMaskIntoConstraints = NO;

    UIView *div2 = [UIView new];
    div2.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.3f];
    [self.view addSubview:div2];
    div2.translatesAutoresizingMaskIntoConstraints = NO;
    
    JVFloatLabeledTextField *locationField = [[JVFloatLabeledTextField alloc] initWithFrame:CGRectZero];
    locationField.font = [UIFont systemFontOfSize:kJVFieldFontSize];
    locationField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:NSLocalizedString(@"Specific Location (optional)", @"")
                                                                          attributes:@{NSForegroundColorAttributeName: [UIColor darkGrayColor]}];
    locationField.floatingLabelFont = [UIFont boldSystemFontOfSize:kJVFieldFloatingLabelFontSize];
    locationField.floatingLabelTextColor = floatingLabelColor;
    [self.view addSubview:locationField];
    locationField.translatesAutoresizingMaskIntoConstraints = NO;

    UIView *div3 = [UIView new];
    div3.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.3f];
    [self.view addSubview:div3];
    div3.translatesAutoresizingMaskIntoConstraints = NO;

    JVFloatLabeledTextView *descriptionField = [[JVFloatLabeledTextView alloc] initWithFrame:CGRectZero];
    descriptionField.font = [UIFont systemFontOfSize:kJVFieldFontSize];
    descriptionField.placeholder = NSLocalizedString(@"Description", @"");
    descriptionField.placeholderTextColor = [UIColor darkGrayColor];
    descriptionField.floatingLabelFont = [UIFont boldSystemFontOfSize:kJVFieldFloatingLabelFontSize];
    descriptionField.floatingLabelTextColor = floatingLabelColor;
    [self.view addSubview:descriptionField];
    descriptionField.translatesAutoresizingMaskIntoConstraints = NO;

    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(xMargin)-[titleField]-(xMargin)-|" options:0 metrics:@{@"xMargin": @(kJVFieldHMargin)} views:NSDictionaryOfVariableBindings(titleField)]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[div1]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(div1)]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(xMargin)-[priceField]-(xMargin)-[div2(1)]-(xMargin)-[locationField]-(xMargin)-|" options:NSLayoutFormatAlignAllCenterY metrics:@{@"xMargin": @(kJVFieldHMargin)} views:NSDictionaryOfVariableBindings(priceField, div2, locationField)]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[div3]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(div3)]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(xMargin)-[descriptionField]-(xMargin)-|" options:0 metrics:@{@"xMargin": @(kJVFieldHMargin)} views:NSDictionaryOfVariableBindings(descriptionField)]];

    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[titleField(>=minHeight)][div1(1)][priceField(>=minHeight)][div3(1)][descriptionField]|" options:0 metrics:@{@"minHeight": @(kJVFieldHeight)} views:NSDictionaryOfVariableBindings(titleField, div1, priceField, div3, descriptionField)]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:priceField attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:div2 attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:priceField attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:locationField attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0.0]];

    [titleField becomeFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
