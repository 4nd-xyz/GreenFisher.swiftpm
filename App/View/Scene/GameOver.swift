//
//  GameOver.swift
//  
//
//  Created by Anderson on 07/04/22.
//

import SpriteKit

public final class GameOver: SKScene {
  
  private lazy var actionPlayer = SKAction.group([
    SKAction.moveTo(x: frame.width + PixelSize.character, duration: 5),
    SKAction.repeatForever(
      SKAction.animate(with:
       PlayerSpriteSheet.makeAnimation(origin: PlayerSpriteRect.right),
       timePerFrame: 0.1
      )
    ),
  ])
  
  private var skSPrite: SKSpriteNode = {
    let textura = PlayerSpriteSheet.makeTexture(rect: PlayerSpriteRect.right)
    textura.filteringMode = .nearest
    let sprite = SKSpriteNode(texture: textura)
    sprite.setScale(Scale.character)
    sprite.texture = textura
    sprite.zPosition = Zposition.charater
    return sprite
  }()
  
  private let ground = Ground()
  
  private lazy var popAngry: SKSpriteNode = {
    let texture = PopupSpriteSheet.makeAngry()
    texture.filteringMode = .nearest
    let sprite = SKSpriteNode(texture: texture)
    sprite.zPosition = Zposition.popUpInfo
    return sprite
  }()
  
  private lazy var continueLabel: SKLabelNode = {
    let str = "Tap to screen restart"
    let label = SKLabelNode(text: str)
    label.fontName = UIFont.makeFont()
    label.fontSize = 24
    label.zPosition = Zposition.popUpInfo
    label.horizontalAlignmentMode = .center
    label.fontColor = ._0x0
    return label
  }()
  
  private lazy var gameOver: SKLabelNode = {
    let label = SKLabelNode(attributedText: .makeGameOver())
    label.numberOfLines = 2
    label.zPosition = Zposition.popUpInfo
    label.horizontalAlignmentMode = .center
    return label
  }()
  
  
  public override func sceneDidLoad() {
    scaleMode = .aspectFill
    anchorPoint = .zero
    
    addChild(ground)
    addChild(gameOver)
    addChild(skSPrite)
    skSPrite.addChild(popAngry)
    addChild(continueLabel)
    
    ground.position = CGPoint(x: PixelSize.ground / 2, y: PixelSize.ground / 2)
    gameOver.position = CGPoint(x: frame.width / 2, y:  frame.height / 2)
    
    ground.createMap()
  }
  
  public override func didMove(to view: SKView) {
    super.didMove(to: view)
    
    backgroundColor = .clear
    
    skSPrite.position =  CGPoint(x: frame.width / 2, y: gameOver.position.y - (skSPrite.frame.height * 3))
    popAngry.position = CGPoint(x: popAngry.frame.width * 0.2, y: popAngry.frame.height)
    continueLabel.position = CGPoint(x: frame.width / 2, y: skSPrite.position.y - (continueLabel.frame.height * 4))
    skSPrite.run(actionPlayer)
    
  }
  
  public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    skSPrite.removeAllActions()
    guard let view = self.view as? MySKView else { fatalError("Bad view") }
    view.presentMainSceneTransition()
  }
  
}

