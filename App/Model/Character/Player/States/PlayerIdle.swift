import Foundation
import GameplayKit

public class PlayerIdle: PlayerState {
  // MARK: Properties
  
  // MARK: GKState overrides
  public override func didEnter(from previousState: GKState?) {
    print("----> Idle")
  }
}
