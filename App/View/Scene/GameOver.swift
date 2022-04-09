//
//  File.swift
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
                       timePerFrame: 0.1)
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
    sprite.setScale(Scale.character)
    sprite.zPosition = Zposition.popUpInfo
    return sprite
  }()
  
  private lazy var continueLabel: SKLabelNode = {
    let str = "  Tap to screen continue"
    
    let label = SKLabelNode(text: str)
    label.fontName = UIFont.makeFont()
    label.fontSize = 24
    label.zPosition = Zposition.popUpInfo
    label.horizontalAlignmentMode = .center
    label.fontColor = ._0x0
    return label
  }()
  
  private lazy var gameOver: SKLabelNode = {
    let str = """
        GAMER
         OVER
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
  
  
  public override func sceneDidLoad() {
    scaleMode = .aspectFill
    anchorPoint = .zero
    
    addChild(ground)
    addChild(gameOver)
    addChild(skSPrite)
    addChild(popAngry)
    addChild(continueLabel)
    
    ground.position = CGPoint(x: PixelSize.ground / 2, y: PixelSize.ground / 2)
    gameOver.position = CGPoint(x: Screen.screenWidth / 2, y:  (Screen.screenHeight -  gameOver.frame.height))
    
    ground.createMap()
  }
  
  public override func didMove(to view: SKView) {
    super.didMove(to: view)
    
    backgroundColor = .clear
    
    skSPrite.position =  CGPoint(x: Screen.screenWidth / 2, y: gameOver.position.y - (skSPrite.frame.height * 4))
    popAngry.position = CGPoint(x: skSPrite.position.x + (skSPrite.frame.width / 2), y: skSPrite.position.y + skSPrite.frame.height)
    continueLabel.position = CGPoint(x: Screen.screenWidth / 2, y: skSPrite.position.y - (continueLabel.frame.height * 4))

    skSPrite.run(actionPlayer)
    popAngry.run(SKAction.moveTo(x: frame.width + popAngry.frame.width, duration: 5))
    
  }
  
  public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    print("Deu ruim no python")
    skSPrite.removeAllActions()
    popAngry.removeAllActions()
    guard  let view = self.view as? MySKView else { fatalError("Deu ruim na view ") }
    view.presentMainSceneTransition()
  }
  
}

