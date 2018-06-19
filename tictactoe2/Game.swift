//
//  Game.swift
//  tictactoe2
//
//  Created by Matthew Jeng on 6/18/18.
//  Copyright © 2018 Matthew Jeng. All rights reserved.
//

import Foundation

protocol GameDelegate: class {
    func declareWinner(_ winner: Player)
}

enum Player {
    case x
    case o
}
enum GridValue: Int {
    case x = 1
    case o = -1
    case na = 0
}

class Game {
    
    let xdim = 3
    let ydim = 3
    var gridValues: [[GridValue]]!
    var currentPlayer: Player
    var gameDelegate: GameDelegate
    
    init(gameDelegate: GameDelegate) {
        self.gridValues = Array<[GridValue]>(repeating: Array<GridValue>(repeating: .na, count: xdim), count: ydim)
        self.currentPlayer = .x // x always starts
        self.gameDelegate = gameDelegate        
    }
    
    func getCurrentPlayer() -> Player {
        return currentPlayer
    }
    
    func userPressed(button: GridSquare) {
        let pos = button.pos
        switch currentPlayer {
        case .x:
            gridValues[pos.0][pos.1] = .x
            currentPlayer = .o
        case .o:
            gridValues[pos.0][pos.1] = .o
            currentPlayer = .x
        }
        
        checkWinner()
    }
    
    func checkWinner() {
        
        func checkSum(sum: Int, dim: Int) {
            if sum == xdim {
                declareWinner(.x)
            } else if sum == -xdim {
                declareWinner(.o)
            }
        }
        
        var rowSum: Int
        for i in 0..<xdim {
            rowSum = 0
            for j in 0..<ydim {
                rowSum += gridValues[i][j].rawValue
            }
            checkSum(sum: rowSum, dim: xdim)
        }
        
        var colSum: Int
        for j in 0..<ydim {
            colSum = 0
            for i in 0..<xdim {
                colSum += gridValues[i][j].rawValue
            }
            checkSum(sum: colSum, dim: ydim)
        }
        
        
        assert(xdim == ydim) // Going to assert this for now because building a generalized game, but don't want to include the extra logic yet for if not square grid
        let dim = xdim
        var diag1Sum = 0
        var diag2Sum = 0
        for i in 0..<dim {
            diag1Sum += gridValues[i][i].rawValue
            diag2Sum += gridValues[i][dim-i-1].rawValue
        }
        checkSum(sum: diag1Sum, dim: dim)
        checkSum(sum: diag2Sum, dim: dim)
        
    }
    
    func declareWinner(_ winner: Player) {
        gameDelegate.declareWinner(winner)
    }
    
    
    
}

