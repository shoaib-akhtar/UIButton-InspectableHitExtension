//
//  UIButton+SBAInspectableHitExtension.h
//  SBAInspectableHitExtension
//
//  Copyright (c) 2015-2017 Shoaib Akhtar.
//
//  Permission is hereby granted, free of charge, to any person obtaining a
//  copy of this software and associated documentation files (the
//  "Software"), to deal in the Software without restriction, including
//  without limitation the rights to use, copy, modify, merge, publish,
//  distribute, sublicense, and/or sell copies of the Software, and to
//  permit persons to whom the Software is furnished to do so, subject to
//  the following conditions:
//
//  The above copyright notice and this permission notice shall be included
//  in all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
//  OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
//  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
//  IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
//  CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
//  TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
//  SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#import "UIButton+SBAInspectableHitExtension.h"
#import <objc/runtime.h>
@implementation UIButton (SBAInspectableHitExtension)
@dynamic hitTestEdgeInsets;
@dynamic topTouch,leftTouch,bottomTouch,rightTouch;

static const NSString *KEY_HIT_TEST_EDGE_INSETS_topTouch = @"HitTestEdgeInsetstopTouchKey";
static const NSString *KEY_HIT_TEST_EDGE_INSETS_leftTouch = @"HitTestEdgeInsetsleftTouchKey";
static const NSString *KEY_HIT_TEST_EDGE_INSETS_bottomTouch = @"HitTestEdgeInsetsbottomTouchKey";
static const NSString *KEY_HIT_TEST_EDGE_INSETS_Rigth = @"HitTestEdgeInsetsrightTouchKey";

#pragma mark - Setter

-(void)setHitTestEdgeInsets:(UIEdgeInsets)hitTestEdgeInsets {
    [self setTopTouch:hitTestEdgeInsets.top];
    [self setLeftTouch:hitTestEdgeInsets.left];
    [self setBottomTouch:hitTestEdgeInsets.bottom];
    [self setRightTouch:hitTestEdgeInsets.right];
}
-(void)setTopTouch:(CGFloat)topTouch
{
    NSValue *value = [NSValue value:&topTouch withObjCType:@encode(CGFloat)];
    objc_setAssociatedObject(self, &KEY_HIT_TEST_EDGE_INSETS_topTouch, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(void)setLeftTouch:(CGFloat)leftTouch
{
    NSValue *value = [NSValue value:&leftTouch withObjCType:@encode(CGFloat)];
    objc_setAssociatedObject(self, &KEY_HIT_TEST_EDGE_INSETS_leftTouch, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(void)setBottomTouch:(CGFloat)bottomTouch
{
    NSValue *value = [NSValue value:&bottomTouch withObjCType:@encode(CGFloat)];
    objc_setAssociatedObject(self, &KEY_HIT_TEST_EDGE_INSETS_bottomTouch, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(void)setRightTouch:(CGFloat)rightTouch
{
    NSValue *value = [NSValue value:&rightTouch withObjCType:@encode(CGFloat)];
    objc_setAssociatedObject(self, &KEY_HIT_TEST_EDGE_INSETS_Rigth, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark - Getter

-(UIEdgeInsets)hitTestEdgeInsets {
    UIEdgeInsets edgeInset=UIEdgeInsetsZero;
    edgeInset.top=self.topTouch;
    edgeInset.left=self.leftTouch;
    edgeInset.bottom=self.bottomTouch;
    edgeInset.right=self.rightTouch;
    
    return edgeInset;
}
-(CGFloat)topTouch
{
        NSValue *value = objc_getAssociatedObject(self, &KEY_HIT_TEST_EDGE_INSETS_topTouch);
        if(value) {
            CGFloat val; [value getValue:&val]; return val;
        }else {
            return 0.0;
        }
}
-(CGFloat)leftTouch
{
    NSValue *value = objc_getAssociatedObject(self, &KEY_HIT_TEST_EDGE_INSETS_leftTouch);
    if(value) {
        CGFloat val; [value getValue:&val]; return val;
    }else {
        return 0.0;
    }
}
-(CGFloat)bottomTouch
{
    NSValue *value = objc_getAssociatedObject(self, &KEY_HIT_TEST_EDGE_INSETS_bottomTouch);
    if(value) {
        CGFloat val; [value getValue:&val]; return val;
    }else {
        return 0.0;
    }
}
-(CGFloat)rightTouch
{
    NSValue *value = objc_getAssociatedObject(self, &KEY_HIT_TEST_EDGE_INSETS_Rigth);
    if(value) {
        CGFloat val; [value getValue:&val]; return val;
    }else {
        return 0.0;
    }
}
///

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    if(UIEdgeInsetsEqualToEdgeInsets(self.hitTestEdgeInsets, UIEdgeInsetsZero) ||       !self.enabled || self.hidden) {
        return [super pointInside:point withEvent:event];
    }
    
    CGRect relativeFrame = self.bounds;
    CGRect hitFrame = UIEdgeInsetsInsetRect(relativeFrame, self.hitTestEdgeInsets);
    
    return CGRectContainsPoint(hitFrame, point);
}
@end
