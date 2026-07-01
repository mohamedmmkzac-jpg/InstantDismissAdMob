#import <Foundation/Foundation.h>

// إعلان أولي للفئات لتخطي أخطاء الـ SDK المفقود على السيرفر
@interface NSObject
- (void)dismissViewControllerAnimated:(BOOL)flag completion:(void (^)(void))completion;
@end

// استهداف الكلاس المسؤول عن شاشات إعلانات جوجل الفول سكرين
%hook GADFullScreenAdViewController

- (void)viewDidAppear:(BOOL)animated {
    %orig; // السماح للإعلان بالتحميل والظهور لثواني معدودة لربط باج الجائزة

    // الانتظار نصف ثانية ثم إغلاق الإعلان تلقائياً
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self dismissViewControllerAnimated:YES completion:nil];
    });
}

%end
