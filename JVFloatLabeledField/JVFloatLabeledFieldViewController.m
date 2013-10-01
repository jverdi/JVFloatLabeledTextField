//
//  JVFloatLabeledFieldViewController.m
//  JVFloatLabeledField
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

#import "JVFloatLabeledFieldViewController.h"
#import "JVFloatLabeledTextField.h"

const static CGFloat kJVFieldHeight = 44.0f;
const static CGFloat kJVFieldHMargin = 10.0f;

const static CGFloat kJVFieldFontSize = 16.0f;

const static CGFloat kJVFieldFloatingLabelFontSize = 11.0f;

@interface JVFloatLabeledFieldViewController ()

@end

@implementation JVFloatLabeledFieldViewController

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
    
    CGFloat topOffset = [[UIApplication sharedApplication] statusBarFrame].size.height + self.navigationController.navigationBar.frame.size.height;
    
    UIColor *floatingLabelColor = [UIColor grayColor];
    UIColor *floatingLabelActiveColor = [UIColor blueColor];
    
    JVFloatLabeledTextField *titleField = [[JVFloatLabeledTextField alloc] initWithFrame:
                                           CGRectMake(kJVFieldHMargin, topOffset, self.view.frame.size.width - 2 * kJVFieldHMargin, kJVFieldHeight)];
    titleField.placeholder = NSLocalizedString(@"Title", @"");
    titleField.font = [UIFont systemFontOfSize:kJVFieldFontSize];
    titleField.floatingLabel.font = [UIFont systemFontOfSize:kJVFieldFloatingLabelFontSize];
    titleField.floatingLabelTextColor = floatingLabelColor;
    titleField.floatingLabelActiveTextColor = floatingLabelActiveColor;
    titleField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.view addSubview:titleField];
    
    UIView *div1 = [UIView new];
    div1.frame = CGRectMake(kJVFieldHMargin, titleField.frame.origin.y + titleField.frame.size.height,
                            self.view.frame.size.width - 2 * kJVFieldHMargin, 1.0f);
    div1.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.3f];
    [self.view addSubview:div1];
    
    JVFloatLabeledTextField *priceField = [[JVFloatLabeledTextField alloc] initWithFrame:
                                           CGRectMake(kJVFieldHMargin, div1.frame.origin.y + div1.frame.size.height, 80.0f, kJVFieldHeight)];
    priceField.placeholder = NSLocalizedString(@"Price", @"");
    priceField.font = [UIFont systemFontOfSize:kJVFieldFontSize];
    priceField.floatingLabel.font = [UIFont systemFontOfSize:kJVFieldFloatingLabelFontSize];
    priceField.floatingLabelTextColor = floatingLabelColor;
    priceField.floatingLabelActiveTextColor = floatingLabelActiveColor;
    [self.view addSubview:priceField];
    
    UIView *div2 = [UIView new];
    div2.frame = CGRectMake(kJVFieldHMargin + priceField.frame.size.width,
                            titleField.frame.origin.y + titleField.frame.size.height,
                            1.0f, kJVFieldHeight);
    div2.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.3f];
    [self.view addSubview:div2];
    
    JVFloatLabeledTextField *locationField = [[JVFloatLabeledTextField alloc] initWithFrame:
                                              CGRectMake(kJVFieldHMargin + kJVFieldHMargin + priceField.frame.size.width + 1.0f,
                                                         div1.frame.origin.y + div1.frame.size.height,
                                                         self.view.frame.size.width - 3*kJVFieldHMargin - priceField.frame.size.width - 1.0f,
                                                         kJVFieldHeight)];
    locationField.placeholder = NSLocalizedString(@"Specific Location (optional)", @"");
    locationField.font = [UIFont systemFontOfSize:kJVFieldFontSize];
    locationField.floatingLabel.font = [UIFont systemFontOfSize:kJVFieldFloatingLabelFontSize];
    locationField.floatingLabelTextColor = floatingLabelColor;
    locationField.floatingLabelActiveTextColor = floatingLabelActiveColor;
    [self.view addSubview:locationField];
    
    UIView *div3 = [UIView new];
    div3.frame = CGRectMake(kJVFieldHMargin, priceField.frame.origin.y + priceField.frame.size.height,
                            self.view.frame.size.width - 2*kJVFieldHMargin, 1.0f);
    div3.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.3f];
    [self.view addSubview:div3];
    
    JVFloatLabeledTextField *descriptionField = [[JVFloatLabeledTextField alloc] initWithFrame:
                                                 CGRectMake(kJVFieldHMargin, div3.frame.origin.y + div3.frame.size.height,
                                                            self.view.frame.size.width - 2*kJVFieldHMargin, kJVFieldHeight)];
    descriptionField.placeholder = NSLocalizedString(@"Description", @"");
    descriptionField.font = [UIFont systemFontOfSize:kJVFieldFontSize];
    descriptionField.floatingLabel.font = [UIFont systemFontOfSize:kJVFieldFloatingLabelFontSize];
    descriptionField.floatingLabelTextColor = floatingLabelColor;
    descriptionField.floatingLabelActiveTextColor = floatingLabelActiveColor;
    [self.view addSubview:descriptionField];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
