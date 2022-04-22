import Foundation
import SpriteKit

public class Score: SKNode {
  // virtoria control action
  var game: GameControll
  
  private lazy var background: SKShapeNode  = {
  let shape = SKShapeNode(rectOf: CGSize(width: Screen.screenWidth, height: PixelSize.size * Scale.ground))
    shape.fillColor = UIColor._0x1!
    shape.zPosition = Zposition.score - 1
    shape.strokeColor = .clear
    return shape
  }()
  
  private lazy var label: SKLabelNode = {
    let label = SKLabelNode(text: "Player 0 LB  *  Friend 0 LB")
    label.horizontalAlignmentMode = .center
    label.verticalAlignmentMode = .center
    label.zPosition = Zposition.score
    label.fontColor = UIColor._0x3
    label.fontName = UIFont.makeFont()
    label.name = "Score"
    return label
  }()
  
  var scorePlayer = 0 {
    didSet {
      label.text = "Player \(scorePlayer) LB  *  Friend \(scoreFishMan) LB"
    }
    willSet {
      if newValue >= 99 {
        game.actionEndGame(.player)
      }
      
    }
  }
  
  var scoreFishMan = 0 {
    didSet {
      label.text = "Player \(scorePlayer) LB  *  Friend \(scoreFishMan) LB"
    }
    willSet {
      if newValue >= 99 {
        game.actionEndGame(.fisher)
      }
    }
  }
  
  init(action: @escaping (Winner)->Void) {
    game = GameControll(actionEndGame: action)
    super.init()
    
    addChild(background)
    addChild(label)
  }
  
  
  func resetNode() {
    scorePlayer = 0
    scoreFishMan = 0
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
