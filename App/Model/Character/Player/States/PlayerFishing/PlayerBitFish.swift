import Foundation
import GameplayKit

public class PlayerBitFish: GKState {
  private lazy var sprite: SKSpriteNode = {
    let texture =  PopupSpriteSheet.makeEclamation()
    texture.filteringMode = .nearest
    let sprite = SKSpriteNode(texture: texture)
    sprite.zPosition = Zposition.popUp
    return sprite
  }()
  
  private var playerPesca: [UInt16: SKTexture] = [
    .upArrow:    PlayerSpriteSheet.makeTexture(rect: PlayerSpriteRect.up),
    .downArrow:  PlayerSpriteSheet.makeTexture(rect: PlayerSpriteRect.down),
    .leftArrow:  PlayerSpriteSheet.makeTexture(rect: PlayerSpriteRect.light),
    .rightArrow: PlayerSpriteSheet.makeTexture(rect: PlayerSpriteRect.right),
  ]
  
  
  // MARK: GKState overrides
  public var node: PlayerSKNode
  
  public init(node: PlayerSKNode) {
    self.node = node
  }
  
  public override func isValidNextState(_ stateClass: AnyClass) -> Bool {
    // This state can only transition to the serve state.
    switch stateClass {
    case
      is PlayerNoCatchFish.Type,
      is PlayerCatchFish.Type:
      return true
    default:
      return false
    }
  }
  
  // Mudar Textua de pesca Com alerta
  
  public override func didEnter(from previousState: GKState?) {
    print("didEnter -> State  PlayerBitFish")
    
    // Mostra esclamacao
    sprite.position = .zero
    node.skSPrite.addChild(sprite)
    sprite.position = CGPoint(x: sprite.position.x, y: sprite.position.y + sprite.size.height)
    
  }
  
  public override func willExit(to nextState: GKState) {
    sprite.removeFromParent()
    node.skSPrite.texture = nil
    let action = SKAction.setTexture(playerPesca[node.swipeDiretion]!, resize: true)
    node.skSPrite.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    node.skSPrite.run(action)
  }
  
  
}


