//
//  GamepadSpace.swift
//  
//
//  Created by Anderson on 07/04/22.
//

import SpriteKit

class GamepadSpace: GamePadBase {
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesBegan(touches, with: event)
    actionButtonBegan(.space)
  }
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesEnded(touches, with: event)
    actionButtonEnded(.space)
  }
}

