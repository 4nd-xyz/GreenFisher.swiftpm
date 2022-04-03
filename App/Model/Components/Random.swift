import Foundation
import GameplayKit

protocol Random {
  func randomInteger (low :Int, high: Int) -> Int
}

extension Random {
  func randomInteger (low :Int, high: Int) -> Int {
    let distribution = GKRandomDistribution(lowestValue: low, highestValue: high)
    return distribution.nextInt()
  }
  
  // Numeros aletorios baseados em uma media
  func normalDistribution(low :Int, high: Int) -> Int {
    let distribution = GKGaussianDistribution(lowestValue: low, highestValue: high)
    return distribution.nextInt()
  }
  
  // 100 / 1000 = 0.1    0.1 ... 1
  func randomFloat(low :Int, high: Int) -> Float {
    let distribution = GKRandomDistribution(lowestValue: low, highestValue: high)
    return distribution.nextUniform()
  }
}

