import Foundation
import SpriteKit
import GameplayKit

public class PlayerSKNode: SKNode {
  var fishY: Fish?
  
  // Teclado
  lazy var player: Player = {
    let player = Player()
    player.delegate = self
    return player
  }()
  
  // Tecla do teclado
  var swipeDiretion: UInt16 = .downArrow
  
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
    PlayerMoveLight(node: self),
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
    sprite.physicsBody?.contactTestBitMask = BitMask.player
    sprite.physicsBody?.collisionBitMask = BitMask.player
    
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
      stateMachine.enter(PlayerMoveLight.self)
    case .upArrow:
      stateMachine.enter(PlayerMoveUp.self)
    case .downArrow:
      stateMachine.enter(PlayerMoveDown.self)
    case .rightArrow:
      stateMachine.enter(PlayerMoveRight.self)
    }
  }
  
  func checkStateFish() {
    // Verificar colizacao com agua
    switch stateMachine.currentState {
    case is PlayerFishing:
      // Remove acao depsca para sobrecreve
      nodeFish.removeAllActions()
      stateMachine.enter(PlayerIdle.self)
      // Caso space muda para parado
    case is PlayerNoCatchFish, is PlayerCatchFish:
      stateMachine.enter(PlayerIdle.self)
    case is PlayerBitFish: // Caso tenha um peixe baseado em quickTime
      stateMachine.enter(PlayerCatchFish.self)
    case is PlayerIdle:
      // Caso parado comeca a pescar
      // Se tiver contato com agua
      if let corpo = skSPrite.physicsBody?.allContactedBodies().first,
        corpo.categoryBitMask == BitMask.watter  {
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
  
  // Retorna o usado nas acoes
  func getNode() -> SKNode {
    return nodeFish
  }
  
  func startFish() { }
  
  func bitFish(_ fish: Fish) {
    // Pesca
    self.fishY = fish
    dump(fishY)
    // Entra no estado de fisgado
    stateMachine.enter(PlayerBitFish.self)
  }
  
  func notGetFish() {
    print("---> notGetFish")
    // Caso o peixe não tenha mordido
    stateMachine.enter(PlayerNoCatchFish.self)
  }
  
  func endQuickTimeEvent() {
    guard let state = stateMachine.currentState else { fatalError("Deu ruim no estado") }
    
    // Caso tenha dado o quickTime Envent
    if state is PlayerBitFish {
      stateMachine.enter(PlayerNoCatchFish.self)
    }
  }
}
