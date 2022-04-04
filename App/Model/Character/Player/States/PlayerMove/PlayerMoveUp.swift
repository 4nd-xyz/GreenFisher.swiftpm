import Foundation
import GameplayKit

public class PlayerMoveUp: PlayerState {
  // MARK: GKState overrides
  private var action = SKAction.repeatForever(SKAction.animate(with: PlayerSpriteSheet.makeAnimation(origin: PlayerSpriteRect.up), timePerFrame: 0.1))
  private var texture = PlayerSpriteSheet.makeTexture(rect: PlayerSpriteRect.up)
  
  public override func didEnter(from previousState: GKState?) {
    node.skSPrite.run(action)
  }
  
  public override func willExit(to nextState: GKState) {
    node.skSPrite.removeAllActions()
    node.skSPrite.texture = texture
    node.swipeDiretion = .upArrow
  }
  
  public override func update(deltaTime seconds: TimeInterval) {
    node.position.y += node.player.velocity
  }
}
