//
//  SpriteNode+UIImage.swift
//  
//
//  Created by Anderson on 09/04/22.
//

import SpriteKit

extension SKSpriteNode {
  static func makeSystemImage(systemName: String, size: CGFloat, color: UIColor) -> SKSpriteNode {
    
    // Criar a configuracao do systemimage
    let font = UIFont.systemFont(ofSize: CGFloat(size))
    let config = UIImage.SymbolConfiguration(font: font)
    
    // Mudar a cor da image
    guard let image = UIImage(systemName: systemName, withConfiguration: config)?.tint(with: color) else {
      fatalError("Deu ruim image")
    }
    
    // Cria a sprite
    let texture = SKTexture(image: image)
    let sprite = SKSpriteNode(texture: texture)
    return sprite
  }
  
}
