//
//  GameViewController.h
//  primeraPractica
//
//  Created by Jorge Lorenzon on 3/6/14.
//  Copyright (c) 2014 Jorge Lorenzon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Game.h"

@interface GameViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *boton;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *buttons;

@property(nonatomic, strong) Game* game;

- (id) initWithGame:(Game*)game;

- (void) onPress;

- (IBAction)onPress2:(id)sender;

@end
