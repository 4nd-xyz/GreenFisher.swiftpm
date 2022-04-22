//
//  FishermanBitFish.swift
//
//
//  Created by Anderson on 09/04/22.
//

import Foundation
import GameKit

public class FishermanBitFish: GKState {
  // MARK: Properties
  public var node: FishermanSKNode
  private var texture = FishermanSpriteSheet.makeIdle()
  
  public init(node: FishermanSKNode) {
    self.node = node
  }
  
  public override func isValidNextState(_ stateClass: AnyClass) -> Bool {
    // This state can only transition to the serve state.
    switch stateClass {
    case
      is FishermanStop.Type,
      is FishermanIdle.Type,
      is FishermanCatchFish.Type:
      return true
    default:
      return false
    }
  }
  
  // MARK: GKState overrides
  public override func didEnter(from previousState: GKState?) {
    
    // Create a wait action
    // That simulates a waiting time
    // Grab the fish
    
    let action = SKAction.sequence([
      SKAction.wait(forDuration: node.fisherman.valueFishing),
      SKAction.run {
        self.node.stateMachine.enter(FishermanCatchFish.self)
      }
    ])
    
    node.run(action)
  }
  
  public override func willExit(to nextState: GKState) {
    node.skSPrite.texture = texture
  }
}
