import Foundation
import GameplayKit

protocol Fishing: AnyObject, Random {
  
  // MARK: - BitFishing
  
  // Probability of fish moderates the bait
  var bitChance: Int { get }
  
  // Probalide to hook the fish
  //var hookChance
  
  // fishing time
  var timeFishing: Double { get }
  
  // Another random number to compare with
  // bitChance if less than fish if not Fesca
  var bitValue: Int { get }
  
  // Cancel if player presses a wrong button
  var fish: Fish? { get set }
  
  // MARK: - QuickTimeEvent
  
  // Place the fish
  // Random time using (Based on fish)
  //var timeHook: Int { get }
  
  // MARK: - Fishing
  var delegate: FishingDelegate? { get set }
  
  // Function called for fishing
  func fishing()
  
  // Create the fish
  func makeFish() -> Fish
  // Function to call it if it checks if it's caught
  // Another random number to compare with
  // hookChance if less fish if no fish
  // If you press the button, it shows in quicktime
  
}

extension Fishing {
  
  var bitChance: Int {
    // 30 % max change from fish not fish
    randomInteger(low: 70, high: 100)
  }
  
  var bitValue: Int {
    randomInteger(low: 0, high: 100)
  }
  
  var timeFishing: Double {
    Double(randomInteger(low: 4, high: 8))
  }
  
  func fishing() {
    
    let node = delegate?.getNode()
    delegate?.startFish()
    
    
    // Action time fish
    let actionFish = SKAction.sequence([
      SKAction.wait(forDuration: timeFishing),
      SKAction.run { bitFish(node: node) }
    ])
    
    // Run the fishing action
    node?.run(actionFish)
    
    // Check if the fish caught
    func bitFish(node: SKNode?) {
      
      // In case the fish caught
      if bitValue <= bitChance {
        
        
        self.fish = makeFish()
        guard let fish = self.fish else { fatalError("It was bad at fishing")}
        delegate?.bitFish(fish)

        // fish caught
        let actionHusk = SKAction.sequence([
          // Quick time event waiting time based on fish
          SKAction.wait(forDuration: Double(fish.timeHook)),
          // Check spade and change to not fished case in bitFishState
          SKAction.run {
            self.delegate?.endQuickTimeEvent()
            
          }
        ])
        
        node?.run(actionHusk)
        
      } else { // If you don't catch the fish, change the status
        delegate?.notGetFish()
      }
      
    }
  }
  
  // Generate the fish based on a probability
  func makeFish() -> Fish {
    let ramdom = randomInteger(low: 0, high: 100)
    
    switch ramdom  {
      // Traira 50%
    case 0...50:
      return Betrayed()
      // Pintato 25%
    case 51...75:
      return Painted()
      // Dourado 25%
    case 76...100:
      return Golden()
    default:
      fatalError("The fish went bad")
    }
  }
  
}
