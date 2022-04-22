import Foundation
import SpriteKit

protocol FishingDelegate: AnyObject {
  
  // Get the node
  func getNode() -> SKNode
  
  // Started fishing
  func startFish()
  
  // Called when the fish has hooked
  func bitFish(_ fish: Fish)
  
  // Condition to check if you caught the fish
  // func fishingCondition() -> Bool
  
  // Calling when caught fish
  // func getFish(_ fish: Fish)
  //
  // Chamdo quando não pegao peixe
  func notGetFish()
  
  // Check the character space
  // if you pressed the catch button
  // If you don't change the bitFish state
  // When you finish QuickTimeEnvent
  
  func endQuickTimeEvent()
  
}
