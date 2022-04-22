import Foundation
import SpriteKit

// Pintado
public struct Painted: Fish {
  public var weight: Int { normalDistribution(low: 8, high: 20) }
  public var length: Int { normalDistribution(low: 20, high: 100) }
  public var texture: SKTexture = FishSpriteSheet.makePainted()
  public var name = "Painted"
  public let timeHook = 0.4
}

