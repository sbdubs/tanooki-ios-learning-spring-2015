//
//  BNRHypnosisView.m
//  Hypnosister
//
//  Created by Sara Wallace on 2/9/15.
//  Copyright (c) 2015 Sara Wallace. All rights reserved.
//

#import "BNRHypnosisView.h"

@interface BNRHypnosisView()
@property (strong, nonatomic) UIColor *circleColor;
@end

@implementation BNRHypnosisView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
 CGRect bounds = self.bounds;
 //Figure out the center of the bounds rectangle
 CGPoint center;
 center.x = bounds.origin.x + bounds.size.width/2.0;
 center.y = bounds.origin.y + bounds.size.height/2.0;
    
    //The largest circle will circumscribe the view
    float maxRadius = hypot(bounds.size.width, bounds.size.height)/2.0;
    
    UIBezierPath *path = [[UIBezierPath alloc]init];
    
    for(float currentRadius = maxRadius; currentRadius>0; currentRadius -= 20){
        
        [path moveToPoint:CGPointMake(center.x + currentRadius, center.y)];
        
        [path addArcWithCenter:center
                         radius:currentRadius
         //Note this is currenRadius!
                     startAngle:0.0
                       endAngle:M_PI*2.0
                      clockwise:YES];
    }
    
    //Configure line width to 10 points
    path.lineWidth = 10;
    
    //Configure the drawing color to light gray
    [self.circleColor setStroke];
    
    //Draw the line!
    [path stroke];
    
    
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self){
        //All BNRHypnosisViews start with a clear background
        self.backgroundColor = [UIColor clearColor];
        self.circleColor = [UIColor lightGrayColor];
    }
    return self;
}

//When a finger touches the screen
- (void)touchesBegan:(NSString *)touches withEvent:(UIEvent *)event{
    NSLog(@"%@ was touched", self);
    
    //Get 3 random number between 0 and 1
    float red = (arc4random() % 100) / 100.0;
    float green = (arc4random() % 100) / 100.0;
    float blue = (arc4random() % 100) / 100.0;
    UIColor *randomColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    self.circleColor = randomColor;
}

- (void)setCircleColor:(UIColor *)circleColor
{
    _circleColor = circleColor;
    [self setNeedsDisplay];
}



@end
