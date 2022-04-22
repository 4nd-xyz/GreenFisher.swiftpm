//
//  FishermanReset.swift
//  
//
//  Created by Anderson on 08/04/22.
//

import GameplayKit

public class FishermanReset: GKState {
  // MARK: Properties
  public var node: FishermanSKNode
  
  // MARK: - Init
  public init(node: FishermanSKNode) {
    self.node = node
  }
  
  // MARK: - Metodos
  public override func isValidNextState(_ stateClass: AnyClass) -> Bool {
    // This state can only transition to the serve state.
    switch stateClass {
    case
      is FishermanStop.Type:
      return true
    default:
      return false
    }
  }
  
  
  // MARK: GKState overrides
  public override func didEnter(from previousState: GKState?) {
    
  }
}
