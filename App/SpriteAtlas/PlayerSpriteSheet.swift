import SpriteKit

public struct PlayerSpriteSheet {
  private static let player = SKTexture(imageNamed: "player")
  
  
  // MARK: - Factor
  static func makeAnimation(origin: CGRect, size: CGSize = .bit_25) -> [SKTexture] {
    var textures = [SKTexture]()
    for i in 0...7 {
      
      let point = CGRect(origin: CGPoint(x: CGFloat(i > 3 ?  i - 4 : i) * origin.maxX, y: origin.minY), size: CGSize(width: 0.25, height: 0.25))
      let textura = SKTexture(rect: point, in: player)
      textura.filteringMode = .nearest
      textures.append(textura)
    }
    return textures
  }
  
  public static func makeTexture(rect: CGRect) -> SKTexture{
    return SKTexture(rect: rect, in: player)
  }
  
}

public enum PlayerSpriteRect {
  private static let size = CGSize(width: 0.25, height: 0.25)
  static let up    = CGRect(origin: CGPoint(x: 0.00, y: 0.00), size: size)
  static let down  = CGRect(origin: CGPoint(x: 0.00, y: 0.75), size: size)
  static let light = CGRect(origin: CGPoint(x: 0.00, y: 0.25), size: size)
  static let right = CGRect(origin: CGPoint(x: 0.00, y: 0.50), size: size)
  
}

