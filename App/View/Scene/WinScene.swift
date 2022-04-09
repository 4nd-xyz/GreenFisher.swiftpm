//
//  WinScene.swift
//
//
//  Created by Anderson on 07/04/22.
//

import SpriteKit

public final class WinScene: SKScene {
  private let ground = Ground()
  private lazy var action = {
    SKAction.sequence([
      SKAction.wait(forDuration: 5),
      SKAction.run {
        guard  let view = self.view as? MySKView else { fatalError("Deu ruim na view ") }
        view.presentMainScene()
      }
    ])
  }()
  
  private var skSPrite: SKSpriteNode = {
    let textura = PlayerSpriteSheet.makeTexture(rect: PlayerSpriteRect.down)
    textura.filteringMode = .nearest
    let sprite = SKSpriteNode(texture: textura)
    sprite.setScale(Scale.character)
    sprite.texture = textura
    sprite.zPosition = Zposition.charater
    return sprite
  }()
  
  private lazy var popAngry: SKSpriteNode = {
    let texture = PopupSpriteSheet.makeHappy()
    texture.filteringMode = .nearest
    let sprite = SKSpriteNode(texture: texture)
    sprite.setScale(Scale.character)
    sprite.zPosition = Zposition.popUp
    return sprite
  }()
  
  private lazy var gameOver: SKLabelNode = {
    let str = """
       YOU WIN
     """
    
    let label = SKLabelNode(text: str)
    label.fontName = UIFont.makeFont()
    label.fontSize = 100
    label.zPosition = Zposition.popUpInfo
    label.numberOfLines = 2
    label.verticalAlignmentMode = .center
    label.fontColor = ._0x0
    
    return label
  }()
  
  private lazy var continueLabel: SKLabelNode = {
    let str = """
        Tap to screen to continue
    """
    
    let label = SKLabelNode(text: str)
    label.fontName = UIFont.makeFont()
    label.fontSize = 24
    label.zPosition = Zposition.popUpInfo
    label.horizontalAlignmentMode = .center
    label.fontColor = ._0x0
    return label
  }()
  
  
  public override func sceneDidLoad() {
    scaleMode = .aspectFill
    anchorPoint = .zero
    
    addChild(ground)
    addChild(gameOver)
    addChild(skSPrite)
    addChild(popAngry)
    addChild(continueLabel)
    ground.createMap()
    
  }
  
  public override func didMove(to view: SKView) {
    print("------> Mostrou a pela")
    super.didMove(to: view)
    
    backgroundColor = .clear
    
    ground.position = CGPoint(x: PixelSize.ground / 2, y: PixelSize.ground / 2)
    gameOver.position = CGPoint(x: Screen.screenWidth / 2, y:  (Screen.screenHeight / 3))
    skSPrite.position =  CGPoint(x: Screen.screenWidth / 2, y: Screen.screenHeight - (skSPrite.frame.height * 4))
    popAngry.position = CGPoint(x: skSPrite.position.x + (skSPrite.frame.width / 2), y: skSPrite.position.y + skSPrite.frame.height)
    
    continueLabel.position = CGPoint(x: Screen.screenWidth / 2, y: gameOver.position.y - gameOver.frame.height)
  }
  
  public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    guard  let view = self.view as? MySKView else { fatalError("Deu ruim na view ") }
    view.presentMainSceneTransition()
  }
}
