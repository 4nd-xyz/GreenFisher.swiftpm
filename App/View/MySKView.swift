import SpriteKit

public final class MySKView: SKView {
  private let frameView = CGRect(origin: .zero, size: Screen.screenSize)
  private lazy var sceneView = GameScene(size: frameView.size)
  private lazy var sceneGameOver = GameOver(size: frameView.size)
  private lazy var sceneWin = WinScene(size: frameView.size)
  private let transion = SKTransition.fade(withDuration: 1)
  
  public init() {
    super.init(frame: frameView)
    ignoresSiblingOrder = true
    isMultipleTouchEnabled = false
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  public func presentWin() {
    self.presentScene(sceneWin, transition: transion)
  }
  
   public func presentMainSceneTransition() {
    self.presentScene(sceneView, transition: transion)
  }
  
  
  public func presentMainScene() {
    self.presentScene(sceneView)
  }
  
  public func presentGameOver() {
    self.presentScene(sceneGameOver, transition: transion)
  }
  
}
