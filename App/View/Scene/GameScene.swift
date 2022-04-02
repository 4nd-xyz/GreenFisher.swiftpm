import SpriteKit

public final class GameScene: SKScene {
  private lazy var paredeEsquerda = makeParede()
  private lazy var paredeDireta = makeParede()
  private let edge = Edge()
  private let ground = Ground()
  private let tree = Tree()
  private let watter = Watter()
  
  public override func sceneDidLoad() {
    super.sceneDidLoad()
    
    scaleMode = .aspectFit
    addChild(ground)
    addChild(tree)
    addChild(watter)
    addChild(edge)
    addChild(paredeEsquerda)
    addChild(paredeDireta)
    
    // Cenario
    ground.position = CGPoint(x: PixelSize.ground / 2, y: PixelSize.ground / 2)
    tree.position = CGPoint(x: PixelSize.tree / 2, y: PixelSize.tree / 2)
    watter.position = CGPoint(x: frame.width * 0.26, y: frame.height * 0.3)
    edge.position = CGPoint(x: watter.position.x, y: watter.position.y)
    
    // Character
    
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
    // Colocar mecanica baseada em tem
    // para almentar adificuldade do bot de pesca
  }
  
  public override func didMove(to view: SKView) {
    print("didMove GameScene")
    super.didMove(to: view)
    backgroundColor = .clear
    
    // Resetar os estados
   

    // Reset Color
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
