import Foundation
import SpriteKit
import GameKit

public class FishermanSKNode: SKNode {
  let fisherman = Fisherman()
  
  // Estado de pesca
  lazy var stateMachine = GKStateMachine(states: [
    FishermanIdle(node: self),
    FishermanFishing(node: self),
    FishermanBitFish(node: self),
    FishermanCatchFish(node: self),
    FishermanStop(node: self)
  ])
  
  // NodeFish
  lazy var nodeFish: SKNode = {
    let node = SKNode()
    addChild(node)
    return node
  }()
  
  var skSPrite: SKSpriteNode = {
    let textura = FishermanSpriteSheet.makeIdle()
    textura.filteringMode = .nearest
    let sprite = SKSpriteNode(texture: textura)
    sprite.setScale(Scale.character)
    sprite.texture = textura
    sprite.zPosition = Zposition.charater
    sprite.physicsBody = .init(edgeLoopFrom: sprite.frame)
    sprite.physicsBody?.categoryBitMask = BitMask.fisherMan
    return sprite
  }()
  
  public override init() {
    super.init()
    
    zPosition = Zposition.charater
    fisherman.delegate = self
    addChild(skSPrite)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func resetNode() {
    stateMachine.enter(FishermanReset.self)
    stateMachine.enter(FishermanIdle.self)
  }
}

extension FishermanSKNode: FishingDelegate {
  func getNode() -> SKNode {
    return nodeFish
  }
  
  // Comecou a pesca
  func startFish() { stateMachine.enter(FishermanFishing.self) }
  
  // Peixe fisgado
  func bitFish(_ fish: Fish) { stateMachine.enter(FishermanBitFish.self) }
  func notGetFish() { stateMachine.enter(FishermanIdle.self) }
  func endQuickTimeEvent() { stateMachine.enter(FishermanIdle.self) }
  
}
