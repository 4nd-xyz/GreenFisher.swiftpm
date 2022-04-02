//
//  PixelSize.swift
//  
//
//  Created by Anderson on 07/04/22.
//

import Foundation

enum PixelSize {
  
  static let size = 16.0
  static var        edge: Double { PixelSize.size * Scale.edge }
  static var      ground: Double { PixelSize.size * Scale.ground }
  static var        tree: Double { PixelSize.size * Scale.tree }
  static var      watter: Double { PixelSize.size * Scale.watter }
  static var   character: Double { PixelSize.size * Scale.character }

}
