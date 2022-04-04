import Foundation
import SpriteKit

class PopupFish: SKShapeNode {
  
  lazy var popUp: SKSpriteNode = {
    let textura = PopupSpriteSheet.makeFrame()
    textura.filteringMode = .nearest
    let frame = SKSpriteNode(texture: textura)
    frame.zPosition = Zposition.popUp
    frame.xScale = (Scale.character * 2) + 2
    frame.yScale = Scale.character * 2
    return frame
  }()
  
  var infoFish:  SKLabelNode
  let spriteFish: SKSpriteNode
  
  init(fish: Fish) {
    let stringFish = """
      \(fish.name)
      KG \(fish.weight)
      CM \(fish.length)
    """
    
    infoFish = SKLabelNode(text: stringFish)
    infoFish.fontName = UIFont.makeFont()
    infoFish.numberOfLines = 3
    infoFish.fontSize = 18
    infoFish.zPosition = Zposition.popUpInfo
    infoFish.horizontalAlignmentMode = .center
    infoFish.fontColor = UIColor._0x0
    
    let texture = fish.texture
    texture.filteringMode = .nearest
    spriteFish = SKSpriteNode(texture: texture)
    spriteFish.setScale(Scale.character)
    spriteFish.zPosition  = Zposition.popUpInfo
  
    super.init()
    
    addChild(popUp)
    addChild(infoFish)
    addChild(spriteFish)
    
    infoFish.position = CGPoint(x: self.position.x, y: -10.0)
    spriteFish.position = CGPoint(x: self.position.x, y: (infoFish.frame.height / 2) * -1.0)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
