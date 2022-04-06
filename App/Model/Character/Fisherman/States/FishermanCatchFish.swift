import Foundation
import GameKit

public class FishermanCatchFish: GKState {
  
  // MARK: Properties
  public var node: FishermanSKNode
  //private var texture = FishermanSpriteSheet.makeIdle()
 
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
    print("----> didEnter Fisherman CatchFish")
    self.node.nodeFish.removeAllActions()
    
    guard let score = node.scene?.childNode(withName: "Score") as? Score else { fatalError("Deu ruim no score")}
    
    score.scoreFishMan += (node.fisherman.fish?.weight) ?? 0
    
    dump(node.fisherman.fish)
    // Comeca o loop novamente
    node.run(SKAction.sequence([
      //SKAction.wait(forDuration: node.fisherman.waitTimeFishing),
      SKAction.run {
        self.node.stateMachine.enter(FishermanIdle.self)
      }
    ]))
    
    
  }
}
