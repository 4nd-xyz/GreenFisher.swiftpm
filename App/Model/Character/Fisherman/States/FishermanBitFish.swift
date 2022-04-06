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
    print("----> didEnter Fisherman BitFish")
    
    //     Criar uma ação de espera
    //     Que simula time de espera
    //     Pega a o pexei
    
    let action = SKAction.sequence([
      SKAction.wait(forDuration: node.fisherman.valueFishing),
      SKAction.run {
        self.node.stateMachine.enter(FishermanCatchFish.self)
      }
    ])
    
    dump(action)
    
    node.run(action)
  }
  
  public override func willExit(to nextState: GKState) {
    node.skSPrite.texture = texture
  }
}
