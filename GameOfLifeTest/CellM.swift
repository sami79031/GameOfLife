//
//  CellM.swift
//  GameOfLifeTest
//
//  Created by Sami Ali on 12/12/16.
//  Copyright © 2016 com.thracecodeinc. All rights reserved.
//

import Foundation

func randomBool() -> Bool {
    
    return arc4random_uniform(2) == 0
}


class CellM {
    var width  = 0
    var height = 0
    var cells: [Bool] = []
    var nextGenerationCells: [Bool] = []
    var generations = 0
    
    init(width: Int, height: Int) {
        self.width  = width
        self.height = height
        initCells()
    }
    
    func cellPos(x: Int, y: Int) -> Int {
        return x * height + y
    }
    
    func alive(x: Int, y: Int) -> Bool {
        return cells[cellPos(x, y: y)]
    }
    
    func alive(pos: Int) -> Bool {
        return cells[pos]
    }
    
    
    func nextGeneration() {
        for pos in 0 ..< cells.count {
            nextGenerationCells[pos] = cellLives(pos)
        }
        
        swap(&nextGenerationCells, &cells)
        generations += 1
    }
    
    
    func getNeighborsCount(pos: Int) -> Int {
        let x = pos / height
        let y = pos % height
        var count = 0
        
        for dx in -1...1 {
            for dy in -1...1 {
                if (dx != 0 || dy != 0) {
                    
                    let newX = (x + dx + width) % width
                    let newY = (y + dy + height) % height
                    
                    
                    if alive(newX, y: newY) {
                        count += 1
                    }
                    
                }
            }
        }
        
        return count
    }
    
    
    func cellLives(pos: Int) -> Bool {
        let neighbors = getNeighborsCount(pos)
        
        return neighbors == 3 || (neighbors == 2 && alive(pos))
    }
    
    func emptyGrid() -> [Bool] {
        return Array(count: width * height, repeatedValue: false)
    }
    
    func initCells() {
        cells = emptyGrid()
        cells = emptyGrid().map {
            _ in randomBool()
        }
        nextGenerationCells = emptyGrid()
    }
    
}