//
//  DebugSprite.swift
//
//
//  Created by Anderson on 07/04/22.
//

import Foundation
import SpriteKit

extension SKShapeNode {
  
  static func makeLine(_ texture: CGSize) -> SKShapeNode {
    let shape = SKShapeNode(rectOf: texture)
    shape.zPosition = .greatestFiniteMagnitude
    shape.lineWidth = 1
    shape.strokeColor  = .red
    return shape
  }
}
