//
//  WinScene.swift
//
//
//  Created by Anderson on 07/04/22.
//

import SpriteKit

public final class WinScene: SKScene {
  private let ground = Ground()
  
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
    let label = SKLabelNode(attributedText: .makeWin())
    label.zPosition = Zposition.popUpInfo
    label.numberOfLines = 2
    label.verticalAlignmentMode = .bottom
    return label
  }()
  
  private lazy var continueLabel: SKLabelNode = {
    let str = """
        Tap to screen to restart
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
    
    ground.position = CGPoint(x: PixelSize.ground / 2, y: PixelSize.ground / 2)
    gameOver.position = CGPoint(x: frame.width / 2, y:  skSPrite.position.y - gameOver.frame.height * 1.2)
    
    ground.createMap()
    
  }
  
  public override func didMove(to view: SKView) {
    super.didMove(to: view)
    
    backgroundColor = .clear
    
    skSPrite.position =  CGPoint(x: frame.width / 2, y: frame.height - (skSPrite.frame.height * 3))
    popAngry.position = CGPoint(x: skSPrite.position.x + (skSPrite.frame.width / 2), y: skSPrite.position.y + skSPrite.frame.height)
    continueLabel.position = CGPoint(x: Screen.screenWidth / 2, y: gameOver.position.y - (continueLabel.frame.height * 2.0))
  }
  
  public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    guard  let view = self.view as? MySKView else { fatalError("Bad view ") }
    view.presentMainSceneTransition()
  }
}
