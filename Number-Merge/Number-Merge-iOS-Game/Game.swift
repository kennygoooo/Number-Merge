//
//  Game.swift
//  Number-Merge-iOS-Game
//
//  
//

import Foundation
import SwiftUI

struct Grid {
    var value : Int = 0
    var gridColor : Color {
        switch self.value {
        case 0: return Color(red: 226/255, green: 219/255, blue: 201/255)
        case 1: return .red
        case 2: return .orange
        case 3: return .yellow
        case 4: return .green
        case 5: return .blue
        case 6: return .indigo
        default: return .brown
        }
    }
    var textColor : Color {
        if [1, 2].contains(self.value) {
            return .white
        } else {
            return .white
        }
    }
}

struct Game {
    
    @AppStorage("bestScore") var bestScore = 0
    
    var score = 0
    var grids = Array(repeating: Grid(value: 0), count: 25)
    var randomGrid = Grid(value: 1)
    var isEnd = false
    
    mutating func nextRandomGrid() {
        var grid = grids.randomElement()!
        grid.value = [grid.value+1, grid.value+1, grid.value+1, grid.value+2].randomElement()!
        randomGrid = grid
    }
    
    mutating func checkMerge(index: Int) {
        if index == 0 {
            while(grids[1].value == grids[0].value || grids[5].value == grids[0].value) {
                if grids[1].value == grids[0].value {
                    updateScore(point: grids[0].value)
                    grids[0].value += 1
                    grids[1].value = 0
                }
                if grids[5].value == grids[0].value {
                    updateScore(point: grids[0].value)
                    grids[0].value += 1
                    grids[5].value = 0
                }
            }
        } else if [1, 2, 3].contains(index) {
            while(grids[index-1].value == grids[index].value || grids[index+1].value == grids[index].value || grids[index+5].value == grids[index].value) {
                if grids[index-1].value == grids[index].value {
                    updateScore(point: grids[index].value)
                    grids[index].value += 1
                    grids[index-1].value = 0
                }
                if grids[index+1].value == grids[index].value {
                    updateScore(point: grids[index].value)
                    grids[index].value += 1
                    grids[index+1].value = 0
                }
                if grids[index+5].value == grids[index].value {
                    updateScore(point: grids[index].value)
                    grids[index].value += 1
                    grids[index+5].value = 0
                }
            }
        } else if index == 4 {
            while(grids[3].value == grids[4].value || grids[9].value == grids[4].value) {
                if grids[3].value == grids[4].value {
                    updateScore(point: grids[4].value)
                    grids[4].value += 1
                    grids[3].value = 0
                }
                if grids[9].value == grids[4].value {
                    updateScore(point: grids[4].value)
                    grids[4].value += 1
                    grids[9].value = 0
                }
            }
        } else if [5, 10, 15].contains(index) {
            while(grids[index-5].value == grids[index].value || grids[index+1].value == grids[index].value || grids[index+5].value == grids[index].value) {
                if grids[index-5].value == grids[index].value {
                    updateScore(point: grids[index].value)
                    grids[index].value += 1
                    grids[index-5].value = 0
                }
                if grids[index+1].value == grids[index].value {
                    updateScore(point: grids[index].value)
                    grids[index].value += 1
                    grids[index+1].value = 0
                }
                if grids[index+5].value == grids[index].value {
                    updateScore(point: grids[index].value)
                    grids[index].value += 1
                    grids[index+5].value = 0
                }
            }
        } else if [6, 7, 8, 11, 12, 13, 16, 17, 18].contains(index) {
            while(grids[index-5].value == grids[index].value || grids[index+1].value == grids[index].value || grids[index+5].value == grids[index].value || grids[index-1].value == grids[index].value) {
                if grids[index-5].value == grids[index].value {
                    updateScore(point: grids[index].value)
                    grids[index].value += 1
                    grids[index-5].value = 0
                }
                if grids[index+1].value == grids[index].value {
                    updateScore(point: grids[index].value)
                    grids[index].value += 1
                    grids[index+1].value = 0
                }
                if grids[index+5].value == grids[index].value {
                    updateScore(point: grids[index].value)
                    grids[index].value += 1
                    grids[index+5].value = 0
                }
                if grids[index-1].value == grids[index].value {
                    updateScore(point: grids[index].value)
                    grids[index].value += 1
                    grids[index-1].value = 0
                }
            }
        } else if [9, 14, 19].contains(index) {
            while(grids[index-5].value == grids[index].value || grids[index+5].value == grids[index].value || grids[index-1].value == grids[index].value) {
                if grids[index-5].value == grids[index].value {
                    updateScore(point: grids[index].value)
                    grids[index].value += 1
                    grids[index-5].value = 0
                }
                if grids[index+5].value == grids[index].value {
                    updateScore(point: grids[index].value)
                    grids[index].value += 1
                    grids[index+5].value = 0
                }
                if grids[index-1].value == grids[index].value {
                    updateScore(point: grids[index].value)
                    grids[index].value += 1
                    grids[index-1].value = 0
                }
            }
        } else if index == 20 {
            while(grids[15].value == grids[20].value || grids[21].value == grids[20].value) {
                if grids[15].value == grids[20].value {
                    updateScore(point: grids[20].value)
                    grids[20].value += 1
                    grids[15].value = 0
                }
                if grids[21].value == grids[20].value {
                    updateScore(point: grids[20].value)
                    grids[20].value += 1
                    grids[21].value = 0
                }
            }
        } else if [21, 22, 23].contains(index) {
            while(grids[index-5].value == grids[index].value || grids[index+1].value == grids[index].value || grids[index-1].value == grids[index].value) {
                if grids[index-5].value == grids[index].value {
                    updateScore(point: grids[index].value)
                    grids[index].value += 1
                    grids[index-5].value = 0
                }
                if grids[index+1].value == grids[index].value {
                    updateScore(point: grids[index].value)
                    grids[index].value += 1
                    grids[index+1].value = 0
                }
                if grids[index-1].value == grids[index].value {
                    updateScore(point: grids[index].value)
                    grids[index].value += 1
                    grids[index-1].value = 0
                }
            }
        } else {
            while(grids[19].value == grids[24].value || grids[23].value == grids[24].value) {
                if grids[19].value == grids[24].value {
                    updateScore(point: grids[24].value)
                    grids[24].value += 1
                    grids[19].value = 0
                }
                if grids[23].value == grids[24].value {
                    updateScore(point: grids[24].value)
                    grids[24].value += 1
                    grids[23].value = 0
                }
            }
        }
    }
    
    mutating func updateScore(point: Int) {
        score += point
    }
    
    mutating func checkEnd() {
        var isEnd = true
        for grid in grids {
            if grid.value == 0 {
                isEnd = false
                break
            }
        }
        if isEnd {
            if score > bestScore {
                bestScore = score
            }
            self.isEnd = isEnd
        }
    }
    
    mutating func restartGame() {
        grids = Array(repeating: Grid(value: 0), count: 25)
        score = 0
        isEnd = false
        self.nextRandomGrid()
    }
}
