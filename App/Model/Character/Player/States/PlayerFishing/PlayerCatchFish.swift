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
    // Mudar Textua de pesca
    print("didEnter -> State  PlayerCatchFish")
    
    // Remove acao de pesca
    node.nodeFish.removeAllActions()
    
    // cria popup feliz
    sprite.position = .zero
    node.addChild(sprite)
    sprite.position = CGPoint(x: node.skSPrite.position.x, y: node.skSPrite.position.y + sprite.size.height)
    
    // Cria popup peixe
    guard let fish =  node.fishY else {
      fatalError("Deu ruim no peixe :/")
    }
    
    let popup = PopupFish(fish: fish)
    self.popup = popup
    guard let scena = node.scene else { fatalError("Deu  ruim na scena") }
    scena.addChild(popup)
    popup.position = CGPoint(x: Screen.screenWidth / 2, y: Screen.screenHeight / 2)
    
    // Atualiza o score
    guard let score = node.scene?.childNode(withName: "Score") as? Score else { fatalError("Deu ruim no score")}
    score.scorePlayer += (node.fishY?.weight) ?? 0
  }
  
  public override func willExit(to nextState: GKState) {
    print("willExit -> State  PlayerCatchFish")
    sprite.removeFromParent()
    popup?.removeFromParent()
  }
  
}
