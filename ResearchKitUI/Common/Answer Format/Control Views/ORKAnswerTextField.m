/*
 Copyright (c) 2015, Apple Inc. All rights reserved.
 
 Redistribution and use in source and binary forms, with or without modification,
 are permitted provided that the following conditions are met:
 
 1.  Redistributions of source code must retain the above copyright notice, this
 list of conditions and the following disclaimer.
 
 2.  Redistributions in binary form must reproduce the above copyright notice,
 this list of conditions and the following disclaimer in the documentation and/or
 other materials provided with the distribution.
 
 3.  Neither the name of the copyright holder(s) nor the names of any contributors
 may be used to endorse or promote products derived from this software without
 specific prior written permission. No license is granted to the trademarks of
 the copyright holders even if such marks are included in this software.
 
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE
 FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */


#import "ORKAnswerTextField.h"
#import "ORKSkin.h"

#import "ORKAccessibility.h"


@implementation ORKAnswerTextField

- (instancetype)init {
    self = [super init];
    if (self) {
        [self init_ORKAnswerTextField];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self init_ORKAnswerTextField];
    }
    return self;
}

- (void)init_ORKAnswerTextField {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(updateAppearance)
                                                 name:UIContentSizeCategoryDidChangeNotification
                                               object:nil];
    [self addAccessoryViewWithDoneButton];
    [self updateAppearance];
}

- (void)addAccessoryViewWithDoneButton {
    UIToolbar* accessoryViewWithDoneButton = [[UIToolbar alloc] init];
    [accessoryViewWithDoneButton sizeToFit];
    UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc]
                                      initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                      target:nil action:nil];
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc]
                                   initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                   target:self action:@selector(keyboardAccessoryViewDoneButtonPressed)];
    accessoryViewWithDoneButton.items = @[flexibleSpace, doneButton];
    [accessoryViewWithDoneButton setBarTintColor:ORKColor(ORKBackgroundColorKey)];
    #if !TARGET_OS_VISION
    self.inputAccessoryView = accessoryViewWithDoneButton;
    #endif
}

- (void)keyboardAccessoryViewDoneButtonPressed {
    [[NSNotificationCenter defaultCenter]
     postNotificationName:ORKDoneButtonPressedKey
     object:self];
    [self resignFirstResponder];
}

- (void)updateAppearance {
    self.font = [[self class] defaultFont];
    [self invalidateIntrinsicContentSize];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

+ (UIFont *)defaultFont {
    UIFontDescriptor *descriptor = [UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleSubheadline];
    return [UIFont systemFontOfSize:((NSNumber *)[descriptor objectForKey:UIFontDescriptorSizeAttribute]).doubleValue + 2.0];
}

#pragma mark - Accessibility

- (CGRect)accessibilityFrame {
    UITableViewCell *containingCell = (UITableViewCell *)[self ork_superviewOfType:[UITableViewCell class]];
    if (containingCell != nil) {
        return UIAccessibilityConvertFrameToScreenCoordinates(containingCell.bounds, containingCell);
    }
    return [super accessibilityFrame];
}

@end

