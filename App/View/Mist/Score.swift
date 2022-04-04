import Foundation
import SpriteKit

public class Score: SKLabelNode {
  // Action de controle de virtoria
  var game: GameControll
  
  var scorePlayer = 0 {
    didSet {
      text = "Player \(scorePlayer) KG  *  FishMan \(scoreFishMan) KG"
    }
    willSet {
      if newValue >= 99 {
        game.actionEndGame(.player)
      }
      
    }
  }
  
  var scoreFishMan = 0 {
    didSet {
      text = "Player \(scorePlayer) KG  *  FishMan \(scoreFishMan) KG"
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
    text = "Player 0 KG  *  FishMan 0 KG"
    horizontalAlignmentMode = .center
    zPosition = Zposition.score
    fontColor = ._0x0
    fontName = UIFont.makeFont()
    name = "Score"
  }
  
  func resetNode() {
    scorePlayer = 0
    scoreFishMan = 0
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
