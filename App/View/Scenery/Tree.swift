import SpriteKit

public class Tree: SKNode {
  private let createSprite = ScenerySpriteSheet.makeTree()
  private let sizePixel  = Scale.tree * PixelSize.size
  private lazy var qtd: Int =  Int(Screen.screenWidth / sizePixel)
  override public init() { super.init() }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  public func createMap() {
    let node = createVerticalGround()
    let posss = node.copy() as! SKNode
    posss.position.y += Screen.screenHeight - sizePixel
    addChild(posss)
    addChild(node)
  }
  
  private func createVerticalGround() -> SKNode {
    let nodePai = SKNode()
    
    for _ in 0...qtd {
      let texture = createSprite
      texture.filteringMode = .nearest
      let sprite = SKSpriteNode(texture: texture)
      sprite.setScale(Scale.tree)
      sprite.position.x = nodePai.calculateAccumulatedFrame().width
      sprite.zPosition = Zposition.tree
      nodePai.addChild(sprite)
      
    }
    nodePai.physicsBody = SKPhysicsBody(edgeLoopFrom: nodePai.calculateAccumulatedFrame())
    nodePai.physicsBody?.categoryBitMask = BitMask.tree
    
    return nodePai
  }
}
