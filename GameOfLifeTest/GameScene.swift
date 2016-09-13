//
//  GameScene.swift
//  GameOfLifeTest
//
//  Created by Sami Ali on 12/12/16.
//  Copyright (c) 2016 com.thracecodeinc. All rights reserved.
//

import SpriteKit
private let pixelSize = 10

class GameScene: SKScene {
    var cellM: CellM!
    let cellSize = CGSize(width: pixelSize, height: pixelSize)
    var rects: [SKSpriteNode] = []
    let white = SKColor.whiteColor()
    let black = SKColor.blackColor()
    var cntr = 0
    override func didMoveToView(view: SKView) {
        cellM = CellM(width: Int(size.width ) / pixelSize, height: Int(size.height) / pixelSize)
        print("did move")
        addCells()
        
    }
    
    func addCells() {
        for X in 0..<cellM.width {
            for Y in 0..<cellM.height {
                addCell(X, y: Y)
            }
        }
    }
    
    func addCell(x: Int, y: Int) {
        let shape = SKSpriteNode(color: black, size: cellSize)
        
        let xCord = x * pixelSize + pixelSize
        let yCord = y * pixelSize + pixelSize
        shape.position = CGPoint(x: xCord, y: yCord)
   
        rects.append(shape)
        self.addChild(shape)
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */

    }
    
    override func update(currentTime: CFTimeInterval) {
        cellM.nextGeneration()
        
        for i in 0 ..< self.cellM.cells.count {
            if cellM.alive(i) == true{
                rects[i].color = white
            }else{
                rects[i].color = black
            }
            
        }
    }
}
