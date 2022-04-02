import Foundation
import SpriteKit

public struct PlayerFishingSheet {
  private static let playerFishing = SKTexture(imageNamed: "playerFishing")
  
  public static func makeFishingUp() -> SKTexture {
    let texture = SKTexture(rect: PlayerFishingRect.up, in: playerFishing)
    texture.filteringMode = .nearest
    return texture
  }
  
  public static func makeFishingDown() -> SKTexture {
    let texture = SKTexture(rect: PlayerFishingRect.down, in: playerFishing)
    texture.filteringMode = .nearest
    return texture
  }
  
  public static func makeFishingLight() -> SKTexture {
    let texture = SKTexture(rect: PlayerFishingRect.light, in: playerFishing)
    texture.filteringMode = .nearest
    return texture
  }
  
  public static func makeFishingRight() -> SKTexture {
    let texture = SKTexture(rect: PlayerFishingRect.right, in: playerFishing)
    texture.filteringMode = .nearest
    return texture
  }
  
  public enum PlayerFishingRect {
    private static let sizeUpDown = CGSize(width: 0.25, height: 0.70)
    private static let sizeLightRight = CGSize(width: 0.5, height: 0.5)
    
    static let up    = CGRect(origin: CGPoint(x: 0.0,  y: 0.0), size: sizeUpDown)
    static let down  = CGRect(origin: CGPoint(x: 0.25, y: 0.0), size: sizeUpDown)
    static let light = CGRect(origin: CGPoint(x: 0.5,  y: 0.00), size: sizeLightRight)
    static let right = CGRect(origin: CGPoint(x: 0.5,  y: 0.5), size: sizeLightRight)
  }
  
}
