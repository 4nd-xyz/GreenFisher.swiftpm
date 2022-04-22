//
//  PlayerCatchFish.swift
//
//
//  Created by Anderson on 08/04/22.
//

import Foundation
import GameplayKit

public class PlayerCatchFish: GKState {
  private lazy var sprite: SKSpriteNode = {
    let texture =  PopupSpriteSheet.makeHappy()
    texture.filteringMode = .nearest
    let sprite = SKSpriteNode(texture: texture)
    sprite.zPosition = Zposition.popUp
    sprite.setScale(Scale.character)
    return sprite
  }()
  
  private lazy var alertAction: SKAction = {
    let audio = SKAction.playSoundFileNamed(Sounds.getFish, waitForCompletion: false)
    return audio
  }()
  
  
  var popup: PopupFish? = nil
  
  // MARK: GKState overrides
  public var node: PlayerSKNode
  
  public init(node: PlayerSKNode) {
    self.node = node
    super.init()
    
  }
  
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
    
    // Remove fishing action
    node.nodeFish.removeAllActions()
    
    // creates happy popup
    sprite.position = .zero
    node.addChild(sprite)
    sprite.position = CGPoint(x: node.skSPrite.position.x, y: node.skSPrite.position.y + sprite.size.height)
    
    // Creates popup fish
    guard let fish =  node.fishY else {
      fatalError("It was bad for the fish :/")
    }
    
    let popup = PopupFish(fish: fish)
    self.popup = popup
    guard let scena = node.scene else { fatalError("It was bad in the scene") }
    scena.addChild(popup)
    popup.position = CGPoint(x: Screen.screenWidth / 2, y: Screen.screenHeight / 2)
    
    // Update score
    guard let scene = node.scene as? GameScene else { fatalError("Bad Score")}
    let score = scene.score
    
    score.scorePlayer += (node.fishY?.weight) ?? 0
  }
  
  public override func willExit(to nextState: GKState) {
    sprite.removeFromParent()
    popup?.removeFromParent()
  }
  
}
