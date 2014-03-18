//
//  UIView+PAMConveniences.h
//  PAM
//
//  Created by Thomas Sunde Nielsen on 16.07.13.
//  Copyright (c) 2013 thomassnielsen. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum PAMRelativePlacement {
    PAMRelativePlacementAbove,
    PAMRelativePlacementBelow,
    PAMRelativePlacementLeft,
    PAMRelativePlacementRight
} PAMRelativePlacement;

typedef enum PAMCenteringDirection {
    PAMCenteringDirectionVertical,
    PAMCenteringDirectionHorizontal
} PAMCenteringDirection;

@interface UIView (PAMConveniences)

- (void)setXOrigin:(float)xOrigin;
- (void)setYOrigin:(float)yOrigin;

- (void)setHeight:(float)height;
- (void)setWidth:(float)width;

- (void)setOriginRelativeToView:(UIView *)relativeView offset:(CGPoint)offset relativePlacement:(PAMRelativePlacement)placement;
- (void)setOriginRelativeToView:(UIView *)relativeView offset:(CGPoint)offset relativePlacement:(PAMRelativePlacement)placement centered:(BOOL)centered;

+ (void)centerViews:(NSArray *)views inView:(UIView *)parentView direction:(PAMCenteringDirection)direction;
+ (void)centerViews:(NSArray *)views inView:(UIView *)parentView direction:(PAMCenteringDirection)direction offset:(float)offset;

- (void)add1pxBorderOfColor:(UIColor *)color;
- (void)removeBorder;

@end
