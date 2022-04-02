import Foundation
import SpriteKit

public struct FishSpriteSheet {
  private static let fish = SKTexture(imageNamed: "fish")
  
  public static func makeBetrayed() -> SKTexture {
    return SKTexture(rect: FishSpriteSheetSpriteRect.betrayed, in: fish)
  }
  
  public static func makeGolden() -> SKTexture {
    return SKTexture(rect: FishSpriteSheetSpriteRect.golden, in: fish)
  }
  
  public static func makePainted() -> SKTexture {
    
    return SKTexture(rect: FishSpriteSheetSpriteRect.painted, in: fish)
  }
 
  enum FishSpriteSheetSpriteRect {
    static let painted  = CGRect(origin: CGPoint(x:    0, y: 0), size: .bit_25)
    static let betrayed = CGRect(origin: CGPoint(x: 0.25, y: 0), size: .bit_25)
    static let golden   = CGRect(origin: CGPoint(x: 0.50, y: 0), size: .bit_25)
    
  }
}
