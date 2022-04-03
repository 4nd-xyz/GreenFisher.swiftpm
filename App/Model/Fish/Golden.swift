import Foundation
import SpriteKit

// Dourado
public struct Golden: Fish {
  public var weight: Int { normalDistribution(low: 40, high: 60) }
  public var length: Int { normalDistribution(low: 30, high: 50) }
  public var name = "Golden"
  public var texture: SKTexture = FishSpriteSheet.makeGolden()
  public let timeHook = 0.3
}

