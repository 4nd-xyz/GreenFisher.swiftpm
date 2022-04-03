import Foundation
import SpriteKit

// Pintado
public struct Painted: Fish {
  public var weight: Int { normalDistribution(low: 30, high: 40) }
  public var length: Int { normalDistribution(low: 40, high: 140) }
  public var texture: SKTexture = FishSpriteSheet.makePainted()
  public var name = "Painted"
  public let timeHook = 0.4
}

