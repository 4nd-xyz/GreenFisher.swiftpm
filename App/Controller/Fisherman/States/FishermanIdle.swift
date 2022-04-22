//
//  FishermanIdle.swift
//
//
//  Created by Anderson on 09/04/22.
//

import Foundation
import GameKit

public class FishermanIdle: GKState {
  // MARK: Properties
  public var node: FishermanSKNode
  
  public init(node: FishermanSKNode) {
    self.node = node
  }
  
  public override func isValidNextState(_ stateClass: AnyClass) -> Bool {
    // This state can only transition to the serve state.
    switch stateClass {
    case
      is FishermanStop.Type,
      is FishermanReset.Type,
      is FishermanFishing.Type:
      return true
    default:
      return false
    }
  }
  
  // MARK: GKState overrides
  public override func didEnter(from previousState: GKState?) {
    
    
    // Loop in the state machine
    node.run(
      SKAction.sequence([
        // Fishermas waiting time
        SKAction.wait(forDuration: node.fisherman.waitTimeFishing),
        SKAction.run {
          self.node.fisherman.fishing()
        }])
    )
    
    
  }
}
