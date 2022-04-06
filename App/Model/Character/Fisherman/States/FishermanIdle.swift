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
    print("----> didEnter Fisherman Idle")
    // Roda uma acao infinitamente depois de um tempo
    
    /// Loop de estados
    node.run(
      SKAction.sequence([
        // Tempo de espera do Fisherman
        SKAction.wait(forDuration: 1),
        SKAction.run {
          self.node.fisherman.fishing()
        }])
    )
    
  }
}
