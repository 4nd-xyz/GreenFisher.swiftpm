import Foundation
import SpriteKit
import GameplayKit

public class PlayerSKNode: SKNode {
  var fishY: Fish?
  
  lazy var player: Player = {
    let player = Player()
    player.delegate = self
    return player
  }()
  
  // Keyboard key
  var swipeDiretion: UInt32 = .upArrow
  
  // NodeFish
  lazy var nodeFish: SKNode = {
    let node = SKNode()
    addChild(node)
    return node
  }()
  
  lazy var stateMachine = GKStateMachine(states: [
    PlayerMoveRight(node: self),
    PlayerMoveUp(node: self),
    PlayerMoveDown(node: self),
    PlayerMoveLeft(node: self),
    PlayerIdle(node: self),
    PlayerFishing(node: self),
    PlayerBitFish(node: self),
    PlayerNoCatchFish(node: self),
    PlayerCatchFish(node: self),
  ])
  
  var skSPrite: SKSpriteNode = {
    let textura = PlayerSpriteSheet.makeTexture(rect: PlayerSpriteRect.up)
    textura.filteringMode = .nearest
    let sprite = SKSpriteNode(texture: textura)
    sprite.setScale(Scale.character)
    sprite.texture = textura
    sprite.zPosition = Zposition.charater
    sprite.physicsBody = SKPhysicsBody(rectangleOf: sprite.frame.size)
    sprite.physicsBody?.affectedByGravity = false
    sprite.physicsBody?.allowsRotation = false
    sprite.physicsBody?.collisionBitMask = BitMask.player
    sprite.physicsBody?.contactTestBitMask = BitMask.playerContact
    return sprite
  }()
  
  public override init() {
    super.init()
    zPosition = Zposition.charater
    addChild(skSPrite)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // Reset node
  func resetNode() {
    stateMachine.enter(PlayerIdle.self)
  }
  
  func actionButtonBegan(key: Controller) {
    switch key {
    case .space:
      checkStateFish()
      break
    case .leftArrow:
      stateMachine.enter(PlayerMoveLeft.self)
    case .upArrow:
      stateMachine.enter(PlayerMoveUp.self)
    case .downArrow:
      stateMachine.enter(PlayerMoveDown.self)
    case .rightArrow:
      stateMachine.enter(PlayerMoveRight.self)
    }
  }
  
  func checkStateFish() {
    // Check colization with water
    switch stateMachine.currentState {
    case is PlayerFishing:
      // Remove depsca action to overwrite
      nodeFish.removeAllActions()
      stateMachine.enter(PlayerIdle.self)
      // Case space changes to stopped
    case is PlayerNoCatchFish, is PlayerCatchFish:
      stateMachine.enter(PlayerIdle.self)
    case is PlayerBitFish: // If you have a quickTime based fish
      stateMachine.enter(PlayerCatchFish.self)
    case is PlayerIdle:
      if let corpos = skSPrite.physicsBody?.allContactedBodies().filter({
        $0.categoryBitMask & BitMask.playerContact != 0 && $0.categoryBitMask == swipeDiretion }
      ), !corpos.isEmpty {
        stateMachine.enter(PlayerFishing.self)
      }
    case .none:
      break
    case .some(_):
      break
    }
  }
  
  func actionButtonEnded(key: Controller) {
    if key != .space  {
      stateMachine.enter(PlayerIdle.self)
    }
  }
  
  func update(_ currentTime: TimeInterval) {
    stateMachine.update(deltaTime: currentTime)
  }
  
}

extension PlayerSKNode: FishingDelegate {
  
  // Returns used in actions
  func getNode() -> SKNode {
    return nodeFish
  }
  
  func startFish() { }
  
  func bitFish(_ fish: Fish) {
    // fishing
    self.fishY = fish
    
    // Enter hooked state
    stateMachine.enter(PlayerBitFish.self)
  }
  
  func notGetFish() {
    // If the fish hasn't bitten
    stateMachine.enter(PlayerNoCatchFish.self)
  }
  
  func endQuickTimeEvent() {
    guard let state = stateMachine.currentState else { fatalError("It went bad in the state") }
    
    // If you have given the quickTime Envent
    if state is PlayerBitFish {
      stateMachine.enter(PlayerNoCatchFish.self)
    }
  }
}
