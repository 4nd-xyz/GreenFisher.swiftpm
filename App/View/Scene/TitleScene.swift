//
//  TitleScene.swift
//
//
//  Created by Anderson on 07/04/22.
//

import SpriteKit

public final class TitleScene: SKScene {
  
  private var skSPrite: SKSpriteNode = {
    let textura = PlayerFishingSheet.makeFishingUp()
    textura.filteringMode = .nearest
    let sprite = SKSpriteNode(texture: textura)
    sprite.setScale(Scale.character)
    sprite.texture = textura
    sprite.zPosition = Zposition.charater
    return sprite
  }()
  
  private var skSPriteFisherman: SKSpriteNode = {
    let textura = FishermanSpriteSheet.makeFishing()
    textura.filteringMode = .nearest
    let sprite = SKSpriteNode(texture: textura)
    sprite.setScale(Scale.character)
    sprite.texture = textura
    sprite.zPosition = Zposition.charater
    return sprite
  }()
  
  
  private let ground = Ground()
  private let edge = Edge()
  private let watter = Watter()
  
  private lazy var continueLabel: SKLabelNode = {
    let str = "~ Touch screen"
    
    let label = SKLabelNode(text: str)
    label.fontName = UIFont.makeFont()
    label.fontSize = Screen.screenWidth * 0.035
    label.zPosition = Zposition.popUpInfo
    label.horizontalAlignmentMode = .center
    label.fontColor = ._0x0
    return label
  }()
  
  private lazy var gameOver: SKLabelNode = {
    let label = SKLabelNode(attributedText: .makeTitle())
    label.zPosition = Zposition.popUpInfo
    label.numberOfLines = 2
    label.verticalAlignmentMode = .top
    label.horizontalAlignmentMode = .center
    return label
  }()
  
  
  public override func sceneDidLoad() {
    scaleMode = .aspectFill
    anchorPoint = .zero
    
    addChild(ground)
    addChild(gameOver)
    addChild(skSPrite)
    addChild(edge)
    addChild(watter)
    addChild(skSPriteFisherman)
    addChild(continueLabel)
    
    
    ground.createMap()
    watter.createMap()
    edge.createMap()
    
    // Scenery
    ground.position = CGPoint(x: PixelSize.ground / 2, y: PixelSize.ground / 2)
    watter.position = CGPoint(x: frame.width * 0.25, y: frame.height * 0.2)
    edge.position = CGPoint(x: watter.position.x, y: watter.position.y)
    
    // Labels
    gameOver.position = CGPoint(x: frame.width / 2, y: frame.height)
    continueLabel.position = CGPoint(x: frame.width / 2, y: watter.position.y + (watter.calculateAccumulatedFrame().height / 2.5))
    
    // Caracter
    skSPrite.position =  CGPoint(x: frame.width / 2 + PixelSize.character, y: watter.position.y - PixelSize.size - 4)
    skSPriteFisherman.position = CGPoint(x: frame.width / 2 - PixelSize.character, y: watter.position.y)
    
  }
  
  public override func didMove(to view: SKView) {
    super.didMove(to: view)
    backgroundColor = .clear
    
  }
  
  public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    guard  let view = self.view as? MySKView else { fatalError("Bad view ") }
    view.presentMainSceneTransition()
  }
  
}
