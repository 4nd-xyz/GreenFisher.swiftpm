import Foundation
import SpriteKit

// Traira
public struct Betrayed: Fish {
  public var weight: Int { normalDistribution(low: 5, high: 20) }
  // problema com tamanho
  public var length: Int { normalDistribution(low: 10, high: 30) }
  public var name = "Betrayed"
  public var texture: SKTexture = FishSpriteSheet.makeBetrayed()
  public let timeHook = 0.6
}
