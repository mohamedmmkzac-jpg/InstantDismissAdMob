#import <UIKit/UIKit.h>

// إعلان للكلاس عشان المترجم يعرف إنه يرث من UIViewController
@interface GADFullScreenAdViewController : UIViewController
@end

%hook GADFullScreenAdViewController

- (void)viewDidAppear:(BOOL)animated {
    %orig;

    // الانتظار نصف ثانية ثم الإغلاق بأمان
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (self.presentingViewController) {
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    });
}

%end
