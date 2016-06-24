//
//  TopDetailViewController.h
//  WXMovie
//
//  Created by wenyuan on 4/7/16.
//  Copyright © 2016  All rights reserved.
//

#import "BaseViewController.h"
#import "TopDetailHeaderView.h"

@interface TopDetailViewController : BaseViewController <UITableViewDataSource, UITableViewDelegate>
{
    TopDetailHeaderView *headerView;
}

@end
