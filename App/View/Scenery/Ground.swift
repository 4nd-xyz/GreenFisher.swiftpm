import SpriteKit

public class Ground: SKNode {
  private let sizePixel  = Scale.ground * PixelSize.size
  private let createSprite = ScenerySpriteSheet.makeGrass()
  private lazy var qtdH: Int =  Int(Screen.screenHeight / sizePixel)
  private lazy var qtdW: Int =  Int(Screen.screenWidth / sizePixel)

  public func createMap() {
    let node = createVerticalGround()

    for i in 0...qtdH {
      let posss = node.copy() as! SKNode
      addChild(posss)
      posss.position.y += sizePixel * CGFloat(i)
    }
  }
  
  private func createVerticalGround() -> SKNode {
    let nodePai = SKNode()
    
    for _ in 0...qtdW {
      let texture = createSprite
      texture.filteringMode = .nearest
      let sprite = SKSpriteNode(texture: texture)
      sprite.setScale(Scale.ground)
      sprite.position.x = nodePai.calculateAccumulatedFrame().width
      sprite.zPosition = Zposition.ground
      nodePai.addChild(sprite)
    }
    return nodePai
  }

}
