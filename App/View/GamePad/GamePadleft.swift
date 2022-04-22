//
//  GamePadleft.swift
//  
//
//  Created by Anderson on 07/04/22.
//

import Foundation
import SpriteKit

class GamePadleft: GamePadBase {
  override init(actionButtonBegan: @escaping ((Controller) -> Void), actionButtonEnded: @escaping ((Controller) -> Void)) {
    super.init(actionButtonBegan: actionButtonBegan, actionButtonEnded: actionButtonEnded)
    self.path = .makeRec(width: 50, height: 50, round: 5, roundCorner: [.topLeft, .bottomLeft])

    let sprite = SKSpriteNode.makeSystemImage(systemName: "arrowtriangle.left.fill", size: 30, color: .lightGray)
    sprite.position = CGPoint(x: frame.width / 2, y: frame.height / 2)
    addChild(sprite)
    
    background.path = path
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesBegan(touches, with: event)
    actionButtonBegan(.leftArrow)
  }
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesEnded(touches, with: event)
    actionButtonEnded(.leftArrow)
  }
}
