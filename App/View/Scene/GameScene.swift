import SpriteKit

public final class GameScene: SKScene {
  private lazy var paredeEsquerda = makeParede()
  private lazy var paredeDireta = makeParede()
  private let edge = Edge()
  private let ground = Ground()
  private let tree = Tree()
  private let watter = Watter()
  private let playerNode = PlayerSKNode()
  private lazy var score = Score(action: {_ in })
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
    
    scaleMode = .aspectFit
    addChild(ground)
    addChild(tree)
    addChild(watter)
    addChild(edge)
    addChild(playerNode)
    addChild(gamePad)
    addChild(controllerSpace)
    addChild(score)
    addChild(paredeEsquerda)
    addChild(paredeDireta)
    
    // GamePad
    gamePad.zPosition = Zposition.controller
    gamePad.position = CGPoint(x: frame.width * 0.05, y: frame.height * 0.2)
    controllerSpace.zPosition = Zposition.controller
    
    controllerSpace.position = CGPoint(x: Screen.screenWidth - controllerSpace.calculateAccumulatedFrame().width, y: gamePad.position.y + controllerSpace.frame.height * 2)
    controllerSpace.path = .makeCirlce(radius: 30)
    
    // Cenario
    ground.position = CGPoint(x: PixelSize.ground / 2, y: PixelSize.ground / 2)
    tree.position = CGPoint(x: PixelSize.tree / 2, y: PixelSize.tree / 2)
    watter.position = CGPoint(x: frame.width * 0.26, y: frame.height * 0.3)
    edge.position = CGPoint(x: watter.position.x, y: watter.position.y)
    score.position =  CGPoint(x: frame.width / 2, y: frame.height * 0.8)
    
    // Character
    playerNode.position = CGPoint(x: Screen.screenWidth * 0.1, y: Screen.screenHeight / 2)
    
    // Cria cenario
    ground.createMap()
    tree.createMap()
    watter.createMap()
    edge.createMap()
    
    // Criar a parede
    paredeEsquerda.position = CGPoint(x: -paredeEsquerda.frame.width, y: 0)
    paredeDireta.position = CGPoint(x: Screen.screenWidth, y: 0)
    
  }
  
  public override func update(_ currentTime: TimeInterval) {
    playerNode.update(currentTime)
    
    // Colocar mecanica baseada em tem
    // para almentar adificuldade do bot de pesca
  }
  
  public override func didMove(to view: SKView) {
    print("didMove GameScene")
    super.didMove(to: view)
    backgroundColor = .clear
    
    // Resetar os estados
    playerNode.resetNode()
    
    // Resetar o placar
    score.resetNode()
    
    // Reset Color
    resetGamePad()
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
    
    // Colocar o corpo depois antes de setar a posição
    paredeNode.physicsBody = .init(edgeLoopFrom: paredeNode.frame)
    paredeNode.physicsBody?.categoryBitMask = BitMask.node
    return paredeNode
  }
  
  
}
