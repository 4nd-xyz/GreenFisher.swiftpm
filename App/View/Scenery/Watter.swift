import SpriteKit

public class Watter: SKNode {
  
  private let createSprite = ScenerySpriteSheet.makeWatter()
  private let pScreenH = Screen.screenHeight * 0.4
  private let pScreenW = Screen.screenWidth * 0.5
  private let sizePixel  = Scale.watter * PixelSize.size
  private lazy var qtdH: Int =  Int(pScreenH / sizePixel)
  private lazy var qtdW: Int =  Int(pScreenW / sizePixel)
  
  public override init() { super.init() }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  public func createMap() {
    let node = createVerticalGround()
    
    for i in 0...qtdH {
      let posss = node.copy() as! SKNode
      addChild(posss)
      posss.position.y += sizePixel * CGFloat(i)
    }
    
    let origin = CGPoint(x: -PixelSize.watter / 2, y: -PixelSize.watter / 2)
    let frame = calculateAccumulatedFrame().size
//    let frame2 = CGSize(width: 30, height: 30)
    
    physicsBody = SKPhysicsBody(edgeLoopFrom: CGRect(origin: origin, size: frame))
    physicsBody?.categoryBitMask = BitMask.watter
  }
  
  private func createVerticalGround() -> SKNode {
    let nodePai = SKNode()
    
    // Coloca a posicao nó
    for _ in 0...qtdW {
      let texture = createSprite
      texture.filteringMode = .nearest
      let sprite = SKSpriteNode(texture: texture)
      sprite.setScale(Scale.watter)
      sprite.position.x = nodePai.calculateAccumulatedFrame().width
      sprite.zPosition = Zposition.watter
      nodePai.addChild(sprite)
    }
    
    return nodePai
  }
  
}

