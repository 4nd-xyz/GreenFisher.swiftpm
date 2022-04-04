import Foundation
import GameplayKit

public class PlayerMoveDown: PlayerState {
  
 // MARK: GKState overrides
  private var action = SKAction.repeatForever(SKAction.animate(with: PlayerSpriteSheet.makeAnimation(origin: PlayerSpriteRect.down), timePerFrame: 0.1))
  private var texture = PlayerSpriteSheet.makeTexture(rect: PlayerSpriteRect.down)
  
  public override func didEnter(from previousState: GKState?) {
    //node.skSPrite.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    //node.skSPrite.size = CGSize(width: 48, height: 48)
    node.skSPrite.run(action)
  }
  
  public override func willExit(to nextState: GKState) {
    node.skSPrite.removeAllActions()
    node.skSPrite.texture = texture
    //node.skSPrite.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    //node.skSPrite.size = CGSize(width: 48, height: 48)
    node.swipeDiretion = .downArrow
    
  }
  
  public override func update(deltaTime seconds: TimeInterval) {
    node.position.y -= node.player.velocity
  }
  
  
}
