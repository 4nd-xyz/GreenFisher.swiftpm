import Foundation
import SpriteKit

public struct PopupSpriteSheet {
  private static let popup = SKTexture(imageNamed: "popup")
  
  public static func makeAngry() -> SKTexture {
    return SKTexture(rect: PopupSpriteSheetRect.angry, in: popup)
  }
  
  public static func makeHappy() -> SKTexture {
    return SKTexture(rect: PopupSpriteSheetRect.happy, in: popup)
  }
  
  public static func makeEclamation() -> SKTexture {
    return SKTexture(rect: PopupSpriteSheetRect.eclamation, in: popup)
  }
  
  public static func makeFrame() -> SKTexture {
    return SKTexture(rect: PopupSpriteSheetRect.frame, in: popup)
  }
  
  enum PopupSpriteSheetRect {
    static let angry      = CGRect(origin: CGPoint(x:    0, y: 0), size: .bit_25)
    static let happy      = CGRect(origin: CGPoint(x: 0.25, y: 0), size: .bit_25)
    static let eclamation = CGRect(origin: CGPoint(x: 0.50, y: 0), size: .bit_25)
    static let frame      = CGRect(origin: CGPoint(x: 0.75, y: 0), size: .bit_25)
    
  }
}
