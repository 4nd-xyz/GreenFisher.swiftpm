//
//  File.swift
//  
//
//  Created by Anderson on 22/04/22.
//

import Foundation
import UIKit


class BuilderNSAttributedString {
  private let attrString = NSMutableAttributedString()
  private var range: NSRange {
    NSRange(location: 0, length: attrString.string.count)
  }
  
  func setString(string: String) -> BuilderNSAttributedString {
    attrString.setAttributedString(.init(string: string))
    let paragraphStyle = NSMutableParagraphStyle()
    paragraphStyle.alignment = .center
    attrString.addAttribute(.paragraphStyle, value: paragraphStyle, range: range)
    return self
  }
  
  func setFont(font: UIFont) -> BuilderNSAttributedString {
    attrString.addAttribute(.font, value: font, range: range)
    return self
  }
  func setColor(color: UIColor) -> BuilderNSAttributedString {
    attrString.addAttribute(.foregroundColor, value: color, range: range)
    return self
  }
  
  func getAttributedString() -> NSAttributedString { attrString }
}


extension NSAttributedString {
  
  static func makeGameOver() -> NSAttributedString {
    BuilderNSAttributedString()
      .setString(string: "GAMER\nOVER")
      .setColor(color:  UIColor._0x1!)
      .setFont(font: UIFont(name: UIFont.makeFont(), size: Screen.screenWidth * 0.1)!)
      .getAttributedString()
  }
  
  static func makeTitle() -> NSAttributedString {
    BuilderNSAttributedString()
      .setString(string: "GREEN\nFISHING")
      .setColor(color:  UIColor._0x0!)
      .setFont(font: UIFont(name: UIFont.makeFont(), size: Screen.screenWidth * 0.1)!)
      .getAttributedString()
  }
  
  static func makeWin() -> NSAttributedString {
    BuilderNSAttributedString()
      .setString(string: "YOU\nWIN")
      .setColor(color:  UIColor._0x0!)
      .setFont(font: UIFont(name: UIFont.makeFont(), size: Screen.screenWidth * 0.1)!)
      .getAttributedString()
  }
  
}
