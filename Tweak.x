#import <Foundation/Foundation.h>

// إعلان مسبق عشان نتفادى أي نقص في ملفات الـ SDK على السيرفر
@interface NSObject
- (void)dismissViewControllerAnimated:(BOOL)flag completion:(void (^)(void))completion;
@end

%hook GADFullScreenAdViewController

- (void)viewDidAppear:(BOOL)animated {
    %orig; // بنسيب إعلان جوجل يفتح نص ثانية عشان السيرفر يسجل الجائزة

    // الإغلاق التلقائي بعد 0.5 ثانية فوراً
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self dismissViewControllerAnimated:YES completion:nil];
    });
}

%end
