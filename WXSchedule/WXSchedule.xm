
// Logos by Dustin Howett
// See http://iphonedevwiki.net/index.php/Logos

#import <logos/logos.h>
#import <UIKit/UIKit.h>

@interface MMTableView : UITableView

@end

%group WeChat

%hook UIImageView

- (void)addSubview:(UIView*) view
{
    %orig;
    if([view isKindOfClass:[UIButton class]])
    {
        if([[[(UIButton*)view titleLabel] text] isEqualToString:@"Send"] ||
           [[[(UIButton*)view titleLabel] text] isEqualToString:@"Back to WAXQ"]) // change WAXQ to your own app name
        {
            [(UIButton*) view sendActionsForControlEvents:UIControlEventTouchUpInside];
        }
    }
}

%end

%hook SessionSelectController

- (void)viewDidLoad
{
    %orig;
    
//    NSInteger message = [[[self view] subviews] count];
//    NSLog(@"%d", message);
//    NSLog(@"==================================");
//    for(int i = 0; i < message; i++)
//    {
//        NSLog(@"%@", [[[[[self view] subviews] objectAtIndex:i] class] description]);
//    }
//    
    MMTableView* contacts_list = (MMTableView *)[[[self view] subviews] objectAtIndex:1];
    if([contacts_list numberOfRowsInSection:1] > 0)
    {
        NSIndexPath* index = [NSIndexPath indexPathForRow:0 inSection:1]; // by default the first contact will be chosen
        [contacts_list selectRowAtIndexPath:index animated:YES scrollPosition:UITableViewScrollPositionBottom];
        [self tableView:contacts_list didSelectRowAtIndexPath:index];
    }
}

%end
%end

%ctor
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    %init;
    if ([[[NSBundle mainBundle] bundleIdentifier] isEqualToString:@"com.tencent.xin"])
    {
        %init(WeChat);
    }
    
    [pool drain];
}
