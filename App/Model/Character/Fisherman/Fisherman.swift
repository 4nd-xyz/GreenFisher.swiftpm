import Foundation

class Fisherman: Fishing {
  
  var timeFishing: Double {
    Double(randomInteger(low: 3, high: 5))
  }
  
  // Tempo de pesca gerado pelo pescador para pegar o peixe
  var valueFishing: Double {
    // 100 / 500 = 0.2  0.2...1
    Double(randomFloat(low: 1, high: 10))
  }
  
  // Tempo de espera para pesca novamente
//  var waitTimeFishing: Double {
//    Double(Random.randomInteger(low: 0, high: 5))
//  }
  
  var fish: Fish?
  var delegate: FishingDelegate?
  
}
