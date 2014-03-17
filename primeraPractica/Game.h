//
//  Game.h
//  primeraPractica
//
//  Created by Jorge Lorenzon on 3/6/14.
//  Copyright (c) 2014 Jorge Lorenzon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Game : NSObject

@property(nonatomic, strong) NSMutableArray* cells;
@property(nonatomic) int turn;
@property(nonatomic) int playerTurn; //1 = player1, 2 = player 2
- (void) print;

- (void) selectCell:(int)index byPlayer:(int)playerIdx;
- (BOOL) didPlayerWin:(int)playerIdx;

-(void)assignCellwith:(int)index;

@end
