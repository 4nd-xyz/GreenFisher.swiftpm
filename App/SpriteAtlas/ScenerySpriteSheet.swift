import Foundation
import SpriteKit

struct ScenerySpriteSheet {
  private static let scenery = SKTexture(imageNamed: "scenery")
  
  static func makeWatter() -> SKTexture {
    return SKTexture(rect: ScenerySpriteRect.watter, in: scenery)
  }
  
  static func makeEdge() -> SKTexture {
    return SKTexture(rect: ScenerySpriteRect.edge, in: scenery)
  }
  
  static func makeGrass() -> SKTexture {
    return SKTexture(rect: ScenerySpriteRect.grass, in: scenery)
  }
  
  static func makeTree() -> SKTexture {
    return SKTexture(rect: ScenerySpriteRect.tree, in: scenery)
  }
  
  enum ScenerySpriteRect {
    static let watter = CGRect(origin: CGPoint(x:    0, y: 0), size: .bit_25)
    static let edge   = CGRect(origin: CGPoint(x: 0.25, y: 0), size: .bit_25)
    static let grass  = CGRect(origin: CGPoint(x: 0.50, y: 0), size: .bit_25)
    static let tree   = CGRect(origin: CGPoint(x: 0.75, y: 0), size: .bit_25)
    
  }
}

extension CGSize {
  static let bit_25 = CGSize(width: 0.25, height: 1)
}
