//
//
//

import GameplayKit

public class FishermanStop: GKState {
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
      is FishermanReset.Type:
      return true
    default:
      return false
    }
  }
  
  // MARK: GKState overrides
  public override func didEnter(from previousState: GKState?) {
    print("----> didEnter Fisherman Stop ")
    node.nodeFish.removeAllActions()
    node.removeAllActions()
    
  }
}
