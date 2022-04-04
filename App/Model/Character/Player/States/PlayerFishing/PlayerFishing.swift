import Foundation
import GameplayKit

public class PlayerFishing: GKState {
  
  // MARK: GKState overrides
  private var playerPesca: [UInt16: SKTexture] = [
    .upArrow:    PlayerSpriteSheet.makeTexture(rect: PlayerSpriteRect.up),
    .downArrow:  PlayerSpriteSheet.makeTexture(rect: PlayerSpriteRect.down),
    .leftArrow:  PlayerSpriteSheet.makeTexture(rect: PlayerSpriteRect.light),
    .rightArrow: PlayerSpriteSheet.makeTexture(rect: PlayerSpriteRect.right),
  ]
  
  private var texturasPesca: [UInt16: (textura: SKTexture, anchorPoint: CGPoint)] = [
    .upArrow:    (textura: PlayerFishingSheet.makeFishingUp(),    anchorPoint: CGPoint(x: 0.5, y: 0.35)),
    .downArrow:  (textura: PlayerFishingSheet.makeFishingDown(),  anchorPoint: CGPoint(x: 0.5, y: 0.65)),
    .leftArrow:  (textura: PlayerFishingSheet.makeFishingLight(), anchorPoint: CGPoint(x: 0.75, y: 0.5)),
    .rightArrow: (textura: PlayerFishingSheet.makeFishingRight(), anchorPoint: CGPoint(x: 0.25, y: 0.5)),
  ]
  
  public var node: PlayerSKNode
  
  public init(node: PlayerSKNode) {
    self.node = node
  }
  
  public override func isValidNextState(_ stateClass: AnyClass) -> Bool {
    // This state can only transition to the serve state.
    switch stateClass {
    case is PlayerIdle.Type, is PlayerBitFish.Type, is PlayerNoCatchFish.Type:
      return true
    default:
      return false
    }
  }
  
  public override func didEnter(from previousState: GKState?) {
    print("didEnter -> State  Fishing")
    // Mudar Textua de pesca
    let tuple = texturasPesca[node.swipeDiretion]!
    let action = SKAction.setTexture(tuple.textura, resize: true)
    node.skSPrite.anchorPoint = tuple.anchorPoint
    node.skSPrite.run(action)
    node.player.fishing()
  }
  
  public override func willExit(to nextState: GKState) {
    if !(nextState is PlayerBitFish) {
      print("---> PlayerBitFish ")
      //node.skSPrite.texture = nil
//      let action = SKAction.setTexture(playerPesca[node.swipeDiretion]!, resize: true)
//      node.skSPrite.run(action)
//      node.skSPrite.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        //let textura = playerPesca[node.swipeDiretion]!
        let sprite = SKSpriteNode(texture: playerPesca[node.swipeDiretion]!)
        sprite.setScale(Scale.character)
        sprite.zPosition = Zposition.charater
        sprite.position = node.skSPrite.position
        sprite.physicsBody = SKPhysicsBody(rectangleOf: sprite.frame.size)
        sprite.physicsBody?.affectedByGravity = false
        sprite.physicsBody?.allowsRotation = false
        sprite.physicsBody?.contactTestBitMask = BitMask.player
        sprite.physicsBody?.collisionBitMask = BitMask.player
        node.addChild(sprite)
        node.skSPrite.removeFromParent()
        node.skSPrite = sprite
    }
  }
  
}

