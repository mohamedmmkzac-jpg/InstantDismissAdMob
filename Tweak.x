#import <Foundation/Foundation.h>

// Forward declaration to bypass needing full Apple framework headers on the server
@interface NSObject
- (void)dismissViewControllerAnimated:(BOOL)flag completion:(void (^)(void))completion;
@end

%hook GADFullScreenAdViewController

- (void)viewDidAppear:(BOOL)animated {
    %orig; // Allow Google Ads to log presentation so the app awards points

    // Wait exactly 0.5 seconds on the main layout loop, then automatically dismiss the ad screen
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self dismissViewControllerAnimated:YES completion:nil];
    });
}

%end
