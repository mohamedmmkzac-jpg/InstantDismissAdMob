#import <UIKit/UIKit.h>

%hook GADFullScreenAdViewController

- (void)viewDidAppear:(BOOL)animated {
    %orig; // Let the ad naturally initialize so the app registers its presence

    // Wait exactly 0.5 seconds on the main layout loop, then safely dismiss it
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self dismissViewControllerAnimated:YES completion:nil];
    });
}

%end
