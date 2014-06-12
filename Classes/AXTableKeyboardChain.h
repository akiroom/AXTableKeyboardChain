//
//  AXTableKeyboardChain.h
//  Pods
//

#import <UIKit/UIKit.h>

extern UIView * AXTableKeyboardChainGetNextField(UITableView *tableView, UIView *field);
extern BOOL AXTableKeyboardChainGoToNext(UITableView *tableView, UIView *field);
