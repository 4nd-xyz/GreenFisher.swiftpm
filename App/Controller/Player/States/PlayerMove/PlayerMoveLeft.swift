//
//  PlayerMoveLeft.swift
//
//
//  Created by Anderson on 08/04/22.
//


import Foundation
import GameplayKit

public class PlayerMoveLeft: PlayerState {
  
 // MARK: GKState overrides
  private var action = SKAction.repeatForever(SKAction.animate(with: PlayerSpriteSheet.makeAnimation(origin: PlayerSpriteRect.light), timePerFrame: 0.1))
  private var texture = PlayerSpriteSheet.makeTexture(rect: PlayerSpriteRect.light)
  
  public override func didEnter(from previousState: GKState?) {
    node.skSPrite.run(action)
    node.swipeDiretion = .leftArrow
  }
  
  public override func willExit(to nextState: GKState) {
    node.skSPrite.removeAllActions()
    node.skSPrite.texture = texture
  }
  
  public override func update(deltaTime seconds: TimeInterval) {
    node.position.x -= node.player.velocity
  }
}
