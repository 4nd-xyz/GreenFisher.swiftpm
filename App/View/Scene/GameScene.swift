import SpriteKit

public final class GameScene: SKScene {
  private lazy var paredeEsquerda = makeParede()
  private lazy var paredeDireta = makeParede()
  private let edge = Edge()
  private let ground = Ground()
  private let tree = Tree()
  private let watter = Watter()
  private let playerNode = PlayerSKNode()
  private let fishermanNode = FishermanSKNode()
  private(set) lazy var score = Score(action: endGame)
  
  private lazy var gamePad: GamePad = {
    return GamePad(
      actionButtonBegan:  playerNode.actionButtonBegan,
      actionButtonEnded: playerNode.actionButtonEnded
    )
  }()
  
  private lazy var controllerSpace: GamepadSpace = {
    return GamepadSpace(
      actionButtonBegan:  playerNode.actionButtonBegan,
      actionButtonEnded: playerNode.actionButtonEnded
    )
  }()
  
  public override func sceneDidLoad() {
    super.sceneDidLoad()
    
    scaleMode = .aspectFill
    addChild(ground)
    addChild(tree)
    addChild(watter)
    addChild(edge)
    addChild(playerNode)
    addChild(gamePad)
    addChild(fishermanNode)
    addChild(controllerSpace)
    addChild(score)
    addChild(paredeEsquerda)
    addChild(paredeDireta)
    
    // make cenario
    ground.createMap()
    tree.createMap()
    watter.createMap()
    edge.createMap()
    
    // Position a parede
    paredeEsquerda.position = CGPoint(x: -paredeEsquerda.frame.width, y: 0)
    paredeDireta.position = CGPoint(x: Screen.screenWidth, y: 0)
    
    // Position GamePad
    gamePad.zPosition = Zposition.controller
    gamePad.position = CGPoint(x: frame.width * 0.05, y: frame.height * 0.2)
    controllerSpace.zPosition = Zposition.controller
    
    let spaceFrame = controllerSpace.calculateAccumulatedFrame().width * 2
    controllerSpace.position = CGPoint(x: Screen.screenWidth - spaceFrame, y: gamePad.position.y + controllerSpace.frame.height * 2)
    controllerSpace.path = .makeCirlce(radius: 30)
    
    // Position Scenario
    ground.position = CGPoint(x: PixelSize.ground / 2, y: PixelSize.ground / 2)
    tree.position = CGPoint(x: PixelSize.tree / 2, y: PixelSize.tree / 2)
    watter.position = CGPoint(x: frame.width * 0.26, y: frame.height * 0.3)
    edge.position = CGPoint(x: watter.position.x, y: watter.position.y)
    score.position =  CGPoint(x: frame.width / 2, y: frame.height - (PixelSize.ground / 2))
    
    // Position Character
    fishermanNode.position =  CGPoint(x: frame.width / 2 + PixelSize.character, y: watter.position.y + (PixelSize.character / 4))
    playerNode.position = CGPoint(x: frame.width / 2 - PixelSize.character, y: watter.position.y + (PixelSize.character / 8))
    
  }
  
  public override func didMove(to view: SKView) {
    super.didMove(to: view)
    backgroundColor = .clear
    
    // Reset states
    playerNode.resetNode()
    fishermanNode.resetNode()
    
    // Reset the score
    score.resetNode()
    
    // Reset Color
    resetGamePad()
  }
  
  public override func update(_ currentTime: TimeInterval) {
    playerNode.update(currentTime)
  }
  
  private func resetGamePad() {
    gamePad.down.background.fillColor = .darkGray
    gamePad.up.background.fillColor = .darkGray
    gamePad.left.background.fillColor = .darkGray
    gamePad.right.background.fillColor = .darkGray
    controllerSpace.background.fillColor = .darkGray
  }
  
  private func makeParede() -> SKSpriteNode {
    let paredeNode = SKSpriteNode(color: .clear, size: CGSize(width: Screen.screenWidth * 0.05, height: Screen.screenHeight))
    paredeNode.anchorPoint = .zero
    
    // Place the body after before setting the position
    paredeNode.physicsBody = .init(edgeLoopFrom: paredeNode.frame)
    paredeNode.physicsBody?.categoryBitMask = BitMask.node
    return paredeNode
  }
  
  func endGame(winner: Winner) {
    //to the bot
    playerNode.stateMachine.enter(PlayerIdle.self)
    fishermanNode.stateMachine.enter(FishermanStop.self)
    
    // Waiting time
    guard let view = self.view as? MySKView else { fatalError("--> Bad view") }
    (winner == .player) ? view.presentWin() : view.presentGameOver()
    
  }
}
