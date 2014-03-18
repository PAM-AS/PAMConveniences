//
//  UIView+PAMConveniences.m
//  PAM
//
//  Created by Thomas Sunde Nielsen on 16.07.13.
//  Copyright (c) 2013 thomassnielsen. All rights reserved.
//

#import "UIView+PAMConveniences.h"

@implementation UIView (PAMConveniences)

- (void)setXOrigin:(float)xOrigin {
    [self setFrame:CGRectMake(xOrigin, self.frame.origin.y, self.frame.size.width, self.frame.size.height)];
}

- (void)setYOrigin:(float)yOrigin {
    [self setFrame:CGRectMake(self.frame.origin.x, yOrigin, self.frame.size.width, self.frame.size.height)];
}

- (void)setHeight:(float)height {
    [self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, height)];
}

- (void)setWidth:(float)width {
    [self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, width, self.frame.size.height)];
}

- (void)setOriginRelativeToView:(UIView *)relativeView offset:(CGPoint)offset relativePlacement:(PAMRelativePlacement)placement {
    [self setOriginRelativeToView:relativeView offset:offset relativePlacement:placement centered:YES];
}

- (void)setOriginRelativeToView:(UIView *)relativeView offset:(CGPoint)offset relativePlacement:(PAMRelativePlacement)placement centered:(BOOL)centered {
    
    if (placement == PAMRelativePlacementBelow && centered)
        [self setFrame:CGRectMake(relativeView.frame.origin.x + (relativeView.frame.size.width - self.frame.size.width)/2 + offset.x, relativeView.frame.origin.y + relativeView.frame.size.height + offset.y, self.frame.size.width, self.frame.size.height)];
    else if (placement == PAMRelativePlacementBelow)
        [self setFrame:CGRectMake(relativeView.frame.origin.x + offset.x, relativeView.frame.origin.y + relativeView.frame.size.height + offset.y, self.frame.size.width, self.frame.size.height)];

    if (placement == PAMRelativePlacementAbove)
        [self setFrame:CGRectMake(relativeView.frame.origin.x + offset.x, relativeView.frame.origin.y - self.frame.size.height - offset.y, self.frame.size.width, self.frame.size.height)];
    
    if (placement == PAMRelativePlacementLeft)
        [self setFrame:CGRectMake(relativeView.frame.origin.x - self.frame.size.width - offset.x, relativeView.frame.origin.y + offset.y, self.frame.size.width, self.frame.size.height)];
    
    if (placement == PAMRelativePlacementRight)
        [self setFrame:CGRectMake(relativeView.frame.origin.x + relativeView.frame.size.width - offset.x, relativeView.frame.origin.y + offset.y, self.frame.size.width, self.frame.size.height)];
}

+ (void)centerViews:(NSArray *)views inView:(UIView *)parentView direction:(PAMCenteringDirection)direction {
    [UIView centerViews:views inView:parentView direction:direction offset:0];
}


+ (void)centerViews:(NSArray *)views inView:(UIView *)parentView direction:(PAMCenteringDirection)direction offset:(float)offset {
    
    if (direction == PAMCenteringDirectionVertical) {
        float height = parentView.frame.size.height + offset;
        
        float firstViewTop = parentView.frame.size.height / 2;
        float lastViewBottom = parentView.frame.size.height / 2;
        
        for (UIView *subView in views) {
            
            if (subView.frame.origin.y < firstViewTop) {
                firstViewTop = subView.frame.origin.y;
            }
            
            if (subView.frame.origin.y + subView.frame.size.height > lastViewBottom) {
                lastViewBottom = subView.frame.origin.y + subView.frame.size.height;
            }
        }
        
        float subViewsHeight = lastViewBottom - firstViewTop;
        
        float subViewsTopOffset = (height - subViewsHeight) / 2;

        
        float yOffset = subViewsTopOffset - firstViewTop;
        
        for (UIView *subView in views)
            [subView setYOrigin:subView.frame.origin.y + yOffset];
    }
#warning Missing implementation for PAMCenteringDirectionHorizontal
}

- (void)add1pxBorderOfColor:(UIColor *)color
{
    [self.layer setBorderColor:[color CGColor]];
    if ([[UIScreen mainScreen] scale] > 1.0)
        [self.layer setBorderWidth:0.5];
    else
        [self.layer setBorderWidth:1.0];
}

- (void)removeBorder
{
    [self.layer setBorderWidth:0.0];
}

@end
