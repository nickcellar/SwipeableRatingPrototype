//
//  SwipableRatingCell.m
//  SwipeableRatingPrototype
//
//  Created by Nicholas Wong on 3/1/14.
//  Copyright (c) 2014 Nicholas Workshop. All rights reserved.
//

#import "SwipeableRatingCell.h"

@interface SwipeableRatingCell ()
@property(weak, nonatomic) IBOutlet UIImageView *uButton1;
@property(weak, nonatomic) IBOutlet UIImageView *uButton2;
@property(weak, nonatomic) IBOutlet UIImageView *uButton3;
@property(weak, nonatomic) IBOutlet UIImageView *uButton4;
@property(weak, nonatomic) IBOutlet UIImageView *uButton5;
@property id onValueChangedObject;
@property SEL onValueChangedSelector;
@end

@implementation SwipeableRatingCell

- (void)awakeFromNib
{
    _rating = 1;
    [_uButton1 setHighlighted:YES];
    [_uButton2 setHighlighted:NO];
    [_uButton3 setHighlighted:NO];
    [_uButton4 setHighlighted:NO];
    [_uButton5 setHighlighted:NO];
}

- (void)touchesHandler:(NSSet *)touches
{
    _rating = 1;
    CGPoint touchPosition = [touches.anyObject locationInView:self];

    if (CGRectContainsPoint(_uButton1.frame, touchPosition)) _rating = 1;
    else if (CGRectContainsPoint(_uButton2.frame, touchPosition)) _rating = 2;
    else if (CGRectContainsPoint(_uButton3.frame, touchPosition)) _rating = 3;
    else if (CGRectContainsPoint(_uButton4.frame, touchPosition)) _rating = 4;
    else if (CGRectContainsPoint(_uButton5.frame, touchPosition)) _rating = 5;

    [_uButton1 setHighlighted:NO];
    [_uButton2 setHighlighted:NO];
    [_uButton3 setHighlighted:NO];
    [_uButton4 setHighlighted:NO];
    [_uButton5 setHighlighted:NO];

    switch ((int) _rating) {
        case 5:
            [_uButton5 setHighlighted:YES];
        case 4:
            [_uButton4 setHighlighted:YES];
        case 3:
            [_uButton3 setHighlighted:YES];
        case 2:
            [_uButton2 setHighlighted:YES];
        case 1:
            [_uButton1 setHighlighted:YES];
    }

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    [_onValueChangedObject performSelector:_onValueChangedSelector withObject:self];
#pragma clang diagnostic pop
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self touchesHandler:touches];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self touchesHandler:touches];
}

- (void)setValueChangedCallbackObject:(id)object withSelector:(SEL)selector
{
    _onValueChangedObject = object;
    _onValueChangedSelector = selector;
}

@end
