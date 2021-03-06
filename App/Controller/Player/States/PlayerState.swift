//
//  PlayerState.swift
//
//
//  Created by Anderson on 08/04/22.
//

import Foundation
import GameplayKit

public class PlayerState: GKState {
  public var node: PlayerSKNode
  
  public init(node: PlayerSKNode) {
    self.node = node
  }
  
  public override func isValidNextState(_ stateClass: AnyClass) -> Bool {
    // This state can only transition to the serve state.
    switch stateClass {
    case
      is PlayerIdle.Type,
      is PlayerMoveRight.Type,
      is PlayerMoveDown.Type,
      is PlayerMoveUp.Type,
      is PlayerMoveLeft.Type,
      is PlayerFishing.Type:
      return true
    default:
      return false
    }
  }

}
