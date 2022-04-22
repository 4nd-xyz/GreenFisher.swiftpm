//
//  FishermanCatchFish.swift
//
//
//  Created by Anderson on 09/04/22.
//

import Foundation
import GameKit

public class FishermanCatchFish: GKState {
  
  // MARK: Properties
  public var node: FishermanSKNode
  
  public init(node: FishermanSKNode) {
    self.node = node
  }
  
  public override func isValidNextState(_ stateClass: AnyClass) -> Bool {
    // This state can only transition to the serve state.
    switch stateClass{
    case is FishermanIdle.Type,
      is FishermanStop.Type:
      return true
    default:
      return false
    }
  }
  
  // MARK: GKState overrides
  public override func didEnter(from previousState: GKState?) {
    self.node.nodeFish.removeAllActions()
    
    guard let scene = node.scene as? GameScene else { fatalError("Bad Score")}
    
    let score = scene.score
    score.scoreFishMan += (node.fisherman.fish?.weight) ?? 0

    // restart o loop 
    self.node.stateMachine.enter(FishermanIdle.self)
    
  }
}
