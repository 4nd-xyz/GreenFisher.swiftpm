import Foundation
import SpriteKit

public struct FishermanSpriteSheet {
  private static let fisherman = SKTexture(imageNamed: "fisherman")
  
  public static func makeIdle() -> SKTexture {
    return SKTexture(rect: FishermanSpriteSheetRect.idle, in: fisherman)
  }
  
  public static func makeFishing() -> SKTexture {
    return SKTexture(rect: FishermanSpriteSheetRect.fishing, in: fisherman)
  }
  
  enum FishermanSpriteSheetRect {
    static let fishing    = CGRect(origin: CGPoint(x: 0.0, y: 0.0), size: CGSize(width: 0.5, height: 1))
    static let idle       = CGRect(origin: CGPoint(x: 0.5, y: 0.0), size: CGSize(width: 0.5, height: 1))
  }
  
}
