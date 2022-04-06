import Foundation
import GameKit

public class FishermanFishing: GKState {
  // MARK: Properties
  public var node: FishermanSKNode
  private var textureFish = FishermanSpriteSheet.makeFishing()
  
  public init(node: FishermanSKNode) {
    self.node = node
  }
  
  public override func isValidNextState(_ stateClass: AnyClass) -> Bool {
    // This state can only transition to the serve state.
    switch stateClass {
    case
      is FishermanIdle.Type,
      is FishermanStop.Type,
      is FishermanBitFish.Type:
      return true
    default:
      return false
    }
  }
  
  // MARK: GKState overrides
  public override func didEnter(from previousState: GKState?) {
    print("----> didEnter Fisherman Pescando")
    node.skSPrite.texture = textureFish
  }
  
  public override func willExit(to nextState: GKState) { }
}
