//
//  GameViewController.m
//  primeraPractica
//
//  Created by Jorge Lorenzon on 3/6/14.
//  Copyright (c) 2014 Jorge Lorenzon. All rights reserved.
//

#import "GameViewController.h"
#import "Game.h"
#import "Cell.h"


@interface GameViewController ()

@end

@implementation GameViewController

- (id) initWithGame:(Game*)game
{
    if (self = [super init])
    {
        self.game = game;
    }
    return self;
}
- (IBAction)fillCell:(id)sender {
    UIButton *button = (UIButton *)sender;

    int currentPlayerTurn = self.game.playerTurn;
    
    [self.game assignCellwith: [sender tag]];
    
    if (currentPlayerTurn == 1){
        [button setBackgroundImage:[UIImage imageNamed:@"Cross"] forState:UIControlStateDisabled];
    }
    else if (currentPlayerTurn == -1){
        [button setBackgroundImage:[UIImage imageNamed:@"Circle"] forState:UIControlStateDisabled];
    }
    [button setEnabled:NO];
    if ([self.game didPlayerWin: currentPlayerTurn]) {
        int player = 1;
        if(currentPlayerTurn == -1) {
            player = 2;
        }
        NSString* message = [NSString stringWithFormat:@"Player %i won", player];
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Game Over"
                                                  message:message
                                                  delegate:self
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
        [alert show];
        for (UIButton* b in _buttons) {
            if ([b isEnabled]) {
                [b setHidden:YES];
            }
        }
    }
}

- (IBAction)onPress2:(id)sender {
    self.game = [[Game alloc] init];
    for (UIButton *b in _buttons) {
        [b setEnabled: YES];
        [b setHidden: NO];
        [b setBackgroundImage:nil forState:UIControlStateNormal];
    }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) onPress
{
    self.view.backgroundColor = [UIColor redColor];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
