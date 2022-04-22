//
//  UInt16+KeyCode.swift
//
//
//  Created by Anderson on 09/04/22.
//

import Foundation

extension UInt32 {
  static let space       : UInt32 = 0
  static let leftArrow   : UInt32 = BitMask.edgeLeft
  static let rightArrow  : UInt32 = BitMask.edgeRight
  static let downArrow   : UInt32 = BitMask.edgeDown
  static let upArrow     : UInt32 = BitMask.edgeUp
}
