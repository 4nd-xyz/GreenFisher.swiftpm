import Foundation
import SpriteKit

protocol FishingDelegate: AnyObject {
  
  // Pega o node
  func getNode() -> SKNode
  
  // Comecou a pescar
  func startFish()
  
  // Chamado quando o peixe fisgou
  func bitFish(_ fish: Fish)
  
//  // Confição para verficar se pescou o peixe
//  func fishingCondition() -> Bool
  
//  // Chamando quando pegou o peixe
//  func getFish(_ fish: Fish)
//
  // Chamdo quando não pegao peixe
  func notGetFish()
  
  // Verificar o espado do personage
  // se apertou o botao pegou peixe
  // Caso não mudaro estado de bitFish
  
  // Quando termina QuickTimeEnvent
  func endQuickTimeEvent()
  
}
