//
//  PlayerNoCatchFish.swift
//
//
//  Created by Anderson on 08/04/22.
//

import Foundation
import GameplayKit

public class PlayerNoCatchFish: GKState {
  
  // MARK: GKState overrides
  private lazy var sprite: SKSpriteNode = {
    let texture =  PopupSpriteSheet.makeAngry()
    texture.filteringMode = .nearest
    let sprite = SKSpriteNode(texture: texture)
    sprite.zPosition = Zposition.popUp
    return sprite
  }()
  
  public var node: PlayerSKNode
  
  public init(node: PlayerSKNode) {
    self.node = node
  }
  
  private lazy var alertAction: SKAction = {
    let audio = SKAction.playSoundFileNamed(Sounds.noGetFish, waitForCompletion: false)
    return audio
  }()
  
  public override func isValidNextState(_ stateClass: AnyClass) -> Bool {
    // This state can only transition to the serve state.
    switch stateClass {
    case is PlayerIdle.Type:
      return true
    default:
      return false
    }
  }
  
  public override func didEnter(from previousState: GKState?) {
    node.skSPrite.run(alertAction)
    sprite.position = .zero
    node.skSPrite.addChild(sprite)
    sprite.position = CGPoint(x: sprite.position.x, y: sprite.position.y + sprite.size.height)
    
  }
  
  public override func willExit(to nextState: GKState) {
    node.skSPrite.removeAllActions()
    sprite.removeFromParent()
  }
}
