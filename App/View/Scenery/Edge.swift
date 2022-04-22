
import SpriteKit

public class Edge: SKNode {
  
  private let createSprite = ScenerySpriteSheet.makeEdge()
  private let pScreenH = Screen.screenHeight * 0.35
  private let pScreenW = Screen.screenWidth * 0.55
  private let sizePixel  = Scale.edge * PixelSize.size
  private lazy var qtdH: Int =  Int(pScreenH / sizePixel)
  private lazy var qtdW: Int =  Int(pScreenW / sizePixel)
  
  public override init() { super.init() }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  public func createMap() {
    let horiNode = createHoritalGround()

    let posss1 = horiNode.copy() as! SKNode
    let posss2 = horiNode.copy() as! SKNode
    posss1.xScale = -posss1.xScale
    posss1.position.x -= sizePixel
    posss2.position.x += sizePixel * (CGFloat(qtdW) + 1)
    
    posss1.physicsBody?.categoryBitMask = BitMask.edgeRight
    posss2.physicsBody?.categoryBitMask = BitMask.edgeLeft
    
    addChild(posss1)
    addChild(posss2)
    
    let node = createVerticalGround()
    let posss  = node.copy() as! SKNode
    let posss3 = node.copy() as! SKNode
    
    posss.position.y += sizePixel * (CGFloat(qtdH) + 1)
    posss3.yScale = -posss3.yScale
    posss3.position.y -= sizePixel
    
    posss.physicsBody?.categoryBitMask = BitMask.edgeDown
    posss3.physicsBody?.categoryBitMask = BitMask.edgeUp
    
    addChild(posss)
    addChild(posss3)
  }
  
  private func createVerticalGround() -> SKNode {
    let nodePai = SKNode()

    for _ in 0...qtdW {
      let texture = createSprite
      texture.filteringMode = .nearest
      let sprite = SKSpriteNode(texture: texture)
      sprite.setScale(Scale.edge)
      
      sprite.position.x = nodePai.calculateAccumulatedFrame().width
      sprite.zPosition = Zposition.edge
      sprite.zRotation = CGFloat(90).degreesToRadians()
      nodePai.addChild(sprite)
    }
    
    let frame = nodePai.calculateAccumulatedFrame()
    let size = CGSize(width: frame.width, height: frame.height / 2.5)
    nodePai.physicsBody = SKPhysicsBody(edgeLoopFrom: .init(origin: frame.origin, size: size))
    
    return nodePai
    
  }
  
  private func createHoritalGround() -> SKNode {
    let nodePai = SKNode()

    for _ in 0...qtdH {
      let texture = createSprite
      texture.filteringMode = .nearest
      let sprite = SKSpriteNode(texture: texture)
      sprite.setScale(Scale.edge)
      sprite.position.y = nodePai.calculateAccumulatedFrame().height
      sprite.zPosition = Zposition.edge
      nodePai.addChild(sprite)
    }
    
    let frame = nodePai.calculateAccumulatedFrame()
    let size = CGSize(width: frame.width / 1.5, height: frame.height)
    
    nodePai.physicsBody = SKPhysicsBody(edgeLoopFrom: .init(origin: frame.origin, size: size))
    return nodePai
  }
}

