import SpriteKit

public final class MySKView: SKView {
  private let frameView = CGRect(origin: .zero, size: Screen.screenSize)
  private lazy var sceneView = GameScene(size: frameView.size)

  public init() {
    super.init(frame: frameView)
    ignoresSiblingOrder = true
    showsDrawCount = true
    showsPhysics = true
    showsFields = true
    showsQuadCount = true
    showsFPS = true
    isMultipleTouchEnabled = false
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  public func presentMainScene() {
    self.presentScene(sceneView)
  }
  
}
