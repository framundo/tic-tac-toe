//
//  Game.m
//  primeraPractica
//
//  Created by Jorge Lorenzon on 3/6/14.
//  Copyright (c) 2014 Jorge Lorenzon. All rights reserved.
//

#import "Game.h"
#import "Cell.h"

@implementation Game

- (id) init
{
   if (self = [super init]) {
       _cells = [[NSMutableArray alloc] initWithCapacity:9];
       
       for (int i = 0; i < 9; ++i) {
           [_cells addObject:[[Cell alloc] init]];
       }
   }
    _playerTurn = 1;
   return self;
}



- (BOOL) didPlayerWin:(int)playerIdx
{
    NSMutableArray *rowSums = [NSMutableArray arrayWithObjects:
                              [NSNumber numberWithInteger: 0], [NSNumber numberWithInteger: 0], [NSNumber numberWithInteger: 0], nil];
    NSMutableArray *colSums = [NSMutableArray arrayWithObjects: [NSNumber numberWithInteger: 0], [NSNumber numberWithInteger: 0], [NSNumber numberWithInteger: 0], nil];
    int diag1Sum = 0;
    int diag2Sum = 0;
    int total = playerIdx * 3;
    for (int i = 0; i < 9; i++) {
        int row = i/3;
        int col = i%3;
        int val = [[_cells objectAtIndex: i] state];
        int rowSum = [[rowSums objectAtIndex:row] integerValue] + val;
        int colSum = [[colSums objectAtIndex:col] integerValue] + val;
        if (row == col) {
            diag1Sum += val;
        }
        if (row == 2-col) {
            diag2Sum += val;
        }
        if(rowSum == total || colSum == total || diag1Sum == total || diag2Sum == total) {
            return YES;
        }
        [rowSums replaceObjectAtIndex:row withObject: [NSNumber numberWithInteger: rowSum ]];
        [colSums replaceObjectAtIndex:col withObject: [NSNumber numberWithInteger: colSum ]];
    }
    return NO;
}



-(void)assignCellwith:(int)index{
    Cell* cell =  [_cells objectAtIndex:index];
    [cell setState:(_playerTurn)];
    _playerTurn = - _playerTurn;
}


@end
