//
//  GamePad.swift
//  
//
//  Created by Anderson on 07/04/22.
//

import Foundation
import SpriteKit

class GamePad: SKNode {
  
  let actionButtonBegan: ((Controller) -> Void)
  let actionButtonEnded: ((Controller) -> Void)
  
  let up: GamePadUp
  let down: GamepadDown
  let left:GamePadleft
  let right: GamePadRight
  
  init(actionButtonBegan:@escaping ((Controller) -> Void),
    actionButtonEnded: @escaping ((Controller) -> Void)) {
    
    self.actionButtonBegan = actionButtonBegan
    self.actionButtonEnded = actionButtonEnded
    
    up = GamePadUp(actionButtonBegan: actionButtonBegan, actionButtonEnded: actionButtonEnded)
    down = GamepadDown(actionButtonBegan: actionButtonBegan, actionButtonEnded: actionButtonEnded)
    left = GamePadleft(actionButtonBegan: actionButtonBegan, actionButtonEnded: actionButtonEnded)
    right = GamePadRight(actionButtonBegan: actionButtonBegan, actionButtonEnded: actionButtonEnded)
    
    super.init()
    addChild(right)
    addChild(left)
  
    addChild(up)
    addChild(down)
    
    right.position = CGPoint(x: left.frame.height * 2.0, y: left.position.y)
    up.position    = CGPoint(x: left.frame.height * 1.0, y: left.frame.height * 1.0)
    down.position  = CGPoint(x: left.frame.height * 1.0, y: up.position.y * -1.0)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
 
}
