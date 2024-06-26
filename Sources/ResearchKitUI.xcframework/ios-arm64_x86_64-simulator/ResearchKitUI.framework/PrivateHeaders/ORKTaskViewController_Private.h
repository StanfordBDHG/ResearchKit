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


#import <ResearchKitUI/ORKTaskViewController.h>


NS_ASSUME_NONNULL_BEGIN

@interface ORKTaskViewController (ORKActiveTaskSupport)

/**
 Creates a default step view controller suitable for presenting the passed step,
 and, if applicable, prefills its results using the `defaultResultSource`.
 */
- (ORKStepViewController *)viewControllerForStep:(ORKStep *)step;

- (void)didFinishWithReason:(ORKTaskFinishReason)reason error:(nullable NSError *)error;

- (BOOL)handlePermissionRequestsDeniedForStep:(ORKStep *)step error:(NSError **)outError;

- (BOOL)canPerformAnimatedNavigationFromStep:(ORKStep *)step;

- (void)stepViewController:(ORKStepViewController *)stepViewController didFinishWithNavigationDirection:(ORKStepViewControllerNavigationDirection)direction
                  animated:(BOOL)animated;

/**
 Forces navigation to the step with the specified identifier.
 
 Call this method to force navigation to the specified step. Any skipped steps are not part of the navigation stack,
 so going back will go back to the step that was current when this method was called. Any skipped steps will not be part
 of the task result either.
 */
- (void)goToStepWithIdentifier:(NSString *)identifier;

- (void)handleResponseFromAudioRequest:(BOOL)success;

@end

NS_ASSUME_NONNULL_END
