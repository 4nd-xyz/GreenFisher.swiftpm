//
//  CustomFont.swift
//  
//
//  Created by Anderson on 07/04/22.
//

import SpriteKit

extension UIFont {

  static func makeFont() -> String {
    let pathFont = "EarlyGameBoy"
    let fontURL = Bundle.main.url(forResource: pathFont, withExtension: "ttf")
    guard let fontURL = fontURL else { fatalError("Bad url") }
    CTFontManagerRegisterFontsForURL(fontURL as CFURL, CTFontManagerScope.process, nil)
    return "Early GameBoy"
  }
  
}
