//
//  GamePadBase.swift
//  
//
//  Created by Anderson on 07/04/22.
//

import Foundation
import SpriteKit

class GamePadBase: SKShapeNode {
  let actionButtonBegan: ((Controller) -> Void)
  let actionButtonEnded: ((Controller) -> Void)
  let background = SKShapeNode()
  
  init(actionButtonBegan:@escaping ((Controller) -> Void),
       actionButtonEnded: @escaping ((Controller) -> Void)) {
    self.actionButtonBegan = actionButtonBegan
    self.actionButtonEnded = actionButtonEnded
    
    super.init()
    background.path = .makeCirlce(radius: 35)
    background.alpha = 0.4
    background.fillColor = .darkGray
    background.strokeColor = .clear
    
    self.isUserInteractionEnabled = true
    self.strokeColor = .lightGray
    self.fillColor = .clear
    addChild(background)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) { background.fillColor = .blue }
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) { background.fillColor = .darkGray }
  
}

extension CGPath {
  static func makeCirlce(radius: CGFloat) -> CGPath {
    UIBezierPath(
      arcCenter: .zero,
      radius: radius,
      startAngle: 0.0,
      endAngle: .pi * 2,
      clockwise: true
    ).cgPath
  }
  
  static func makeRec(width: CGFloat, height: CGFloat, round: Int, roundCorner: UIRectCorner) ->CGPath {
    UIBezierPath(
      roundedRect:.init(origin: .zero,
      size: .init(width: width, height: height)),
      byRoundingCorners: roundCorner,
      cornerRadii: .init(width: round, height: round)
    ).cgPath
  }
  
  static func makeTriangule(width: CGFloat, height: CGFloat, radius: CGFloat) -> CGPath {
    let point1 = CGPoint(x: (-width) / 2, y: height / 2)
    let point2 = CGPoint(x: 0, y: (-height) / 2)
    let point3 = CGPoint(x: width / 2, y: height / 2)
    
    let path = CGMutablePath()
    path.move(to: CGPoint(x: 0, y: (height) / 2))
    path.addArc(tangent1End: point1, tangent2End: point2, radius: radius)
    path.addArc(tangent1End: point2, tangent2End: point3, radius: radius)
    path.addArc(tangent1End: point3, tangent2End: point1, radius: radius)
    path.closeSubpath()
    return path
  }
}

