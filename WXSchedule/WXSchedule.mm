#line 1 "/Users/weiye/Documents/YEWEI/iOS/WXSchedule/WXSchedule/WXSchedule.xm"




#import <logos/logos.h>
#import <UIKit/UIKit.h>

@interface MMTableView : UITableView

@end

#include <logos/logos.h>
#include <substrate.h>
@class SessionSelectController; @class UIImageView; 


#line 12 "/Users/weiye/Documents/YEWEI/iOS/WXSchedule/WXSchedule/WXSchedule.xm"
static void (*_logos_orig$WeChat$UIImageView$addSubview$)(UIImageView*, SEL, UIView*); static void _logos_method$WeChat$UIImageView$addSubview$(UIImageView*, SEL, UIView*); static void (*_logos_orig$WeChat$SessionSelectController$viewDidLoad)(SessionSelectController*, SEL); static void _logos_method$WeChat$SessionSelectController$viewDidLoad(SessionSelectController*, SEL); 




static void _logos_method$WeChat$UIImageView$addSubview$(UIImageView* self, SEL _cmd, UIView* view) {
    _logos_orig$WeChat$UIImageView$addSubview$(self, _cmd, view);
    if([view isKindOfClass:[UIButton class]])
    {
        if([[[(UIButton*)view titleLabel] text] isEqualToString:@"Send"] ||
           [[[(UIButton*)view titleLabel] text] isEqualToString:@"Back to WAXQ"])
        {
            [(UIButton*) view sendActionsForControlEvents:UIControlEventTouchUpInside];
        }
    }
}






static void _logos_method$WeChat$SessionSelectController$viewDidLoad(SessionSelectController* self, SEL _cmd) {
    _logos_orig$WeChat$SessionSelectController$viewDidLoad(self, _cmd);
    








    MMTableView* contacts_list = (MMTableView *)[[[self view] subviews] objectAtIndex:1];
    if([contacts_list numberOfRowsInSection:1] > 0)
    {
        NSIndexPath* index = [NSIndexPath indexPathForRow:0 inSection:1];
        [contacts_list selectRowAtIndexPath:index animated:YES scrollPosition:UITableViewScrollPositionBottom];
        [self tableView:contacts_list didSelectRowAtIndexPath:index];
    }
}




static __attribute__((constructor)) void _logosLocalCtor_9f61408e()
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    {}
    if ([[[NSBundle mainBundle] bundleIdentifier] isEqualToString:@"com.tencent.xin"])
    {
        {Class _logos_class$WeChat$UIImageView = objc_getClass("UIImageView"); MSHookMessageEx(_logos_class$WeChat$UIImageView, @selector(addSubview:), (IMP)&_logos_method$WeChat$UIImageView$addSubview$, (IMP*)&_logos_orig$WeChat$UIImageView$addSubview$);Class _logos_class$WeChat$SessionSelectController = objc_getClass("SessionSelectController"); MSHookMessageEx(_logos_class$WeChat$SessionSelectController, @selector(viewDidLoad), (IMP)&_logos_method$WeChat$SessionSelectController$viewDidLoad, (IMP*)&_logos_orig$WeChat$SessionSelectController$viewDidLoad);}
    }
    
    [pool drain];
}
