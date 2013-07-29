//
//  PBFlatButton.m
//  FlatUIlikeiOS7
//
//  Created by Piotr Bernad on 11.06.2013.
//  Copyright (c) 2013 Piotr Bernad. All rights reserved.
//

#import "PBFlatButton.h"


@implementation PBFlatButton {
    UIColor *_backgroundColor;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self appearanceButton];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self appearanceButton];
    }
    return self;
}

- (void)setMainColor:(UIColor *)mainColor {
    _mainColor = mainColor;
    [self appearanceButton];
}

- (void)setAlternateColor:(UIColor *)alternateColor {
    _alternateColor = alternateColor;
    [self appearanceButton];
}

- (void)setFont:(UIFont *)font {
    _font = font;
    [self appearanceButton];
}

- (void)appearanceButton {
    if (!_backgroundColor)
        _backgroundColor = [UIColor clearColor];
    if (!_alternateColor)
        _alternateColor = [UIColor whiteColor];
    if (!_mainColor)
        _mainColor = [[PBFlatSettings sharedInstance] mainColor];
    if (!_font)
        _font = [[PBFlatSettings sharedInstance] font];

    [self setBackgroundColor:_backgroundColor];
    [self setTitleColor:_mainColor forState:UIControlStateNormal];
    [self setTitleColor:_alternateColor forState:UIControlStateHighlighted];
    [self setTitleColor:_alternateColor forState:UIControlStateSelected];
    [self.titleLabel setFont:_font];
}

- (void)setHighlighted:(BOOL)highlighted {
    if (self.highlighted != highlighted) {
        [super setHighlighted:highlighted];
        
        UIColor *temp = _mainColor;
        _mainColor = _backgroundColor;
        _backgroundColor = temp;
        
        [self setNeedsDisplay];
    }
}

- (void)drawRect:(CGRect)rect {
    UIBezierPath *roundedRectanglePath = [UIBezierPath bezierPathWithRoundedRect:CGRectInset(rect, 1, 1) cornerRadius: 5];
    [_backgroundColor setFill];
    [roundedRectanglePath fill];
    [_mainColor setStroke];
    roundedRectanglePath.lineWidth = 1;
    [roundedRectanglePath stroke];
}

@end
