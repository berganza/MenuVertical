//
//  ViewController.m
//  MenuVertical
//
//  Created by LLBER on 23/11/13.
//  Copyright (c) 2013 LLBER. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.posicionPantalla = self.pantallaDelantera.frame.origin.y;

}


#define POSICION_VISTA 490

-(void) animateLayerToPoint: (CGFloat)y {
    
    [UIView animateWithDuration:1
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         CGRect marco = self.pantallaDelantera.frame;
                         marco.origin.y = y;
                         self.pantallaDelantera.frame = marco;
                     }
                     completion:^(BOOL finished) {
                         self.posicionPantalla = self.pantallaDelantera.frame.origin.y;
                     }];
}

- (IBAction)gesto:(UIPanGestureRecognizer *)reconocerGesto {
    
    if(reconocerGesto.state == UIGestureRecognizerStateChanged) {
        
        CGPoint punto = [reconocerGesto translationInView:self.pantallaDelantera];
        CGRect marco = self.pantallaDelantera.frame;
        marco.origin.y = self.posicionPantalla + punto.y;
        
        if (marco.origin.y <0) marco.origin.y = 0;
        self.pantallaDelantera.frame = marco;
    }
    
    if (reconocerGesto.state == UIGestureRecognizerStateEnded) {
        
        if (self.pantallaDelantera.frame.origin.y <=250) {
            
            [self animateLayerToPoint:0];
        } else {
            
            [self animateLayerToPoint: POSICION_VISTA];
        }
    }
}






- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
