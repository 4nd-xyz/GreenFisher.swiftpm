//
//  BitMask.swift
//  GreenFisher
//
//  Created by Anderson on 07/04/22.
//

import Foundation

enum BitMask {
  
  // Player colision
  static let tree     : UInt32 = 0b10001 // 17
  static let watter   : UInt32 = 0b01101 // 13
  static let node     : UInt32 = 0b01001 // 9
  static let fisherMan: UInt32 = 0b00101 // 5
  static let player   : UInt32 = 0b00001 // 1
  
  // Edge Contacts
  static let edgeLeft     : UInt32 = 0b10010 // 18
  static let edgeRight    : UInt32 = 0b01110 // 14
  static let edgeDown     : UInt32 = 0b01010 // 10
  static let edgeUp       : UInt32 = 0b00110 // 6
  static let playerContact: UInt32 = 0b00010 // 2

}
