//
//  SwipeableRatingCell.h
//  SwipeableRatingPrototype
//
//  Created by Nicholas Wong on 3/1/14.
//  Copyright (c) 2014 Nicholas Workshop. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SwipeableRatingCell : UITableViewCell

@property float rating;

- (void)setValueChangedCallbackObject:(id)object withSelector:(SEL)selector;

@end
