import Foundation
import GameplayKit

protocol Fishing: AnyObject, Random {
  
  // MARK: - BitFishing
  
  // Probalidade do peixe moder a isca
  var bitChance: Int { get }
  
  // Probalide fazer o gancho no peixe
  //var hookChance
  
  // Tempo da pesca
  var timeFishing: Double { get }
  
  // Outro numero aletorio para compara com
  // bitChance se menor que pesca se não Fesca
  var bitValue: Int { get }
  
  // Cancelar se player aperter um botao errado
  var fish: Fish? { get set }
  
  // MARK: - QuickTimeEvent
  
  // Colocar o peixe
  // Tempo aletorio usando (Paseado no peixe)
  //var timeHook: Int { get }
  
  // MARK: - Fishing
  var delegate: FishingDelegate? { get set }
  
  // Funcao chamada para pesca
  func fishing()
  
  // Cria o peixe
  func makeFish() -> Fish
  // Função para a chamar caso verifica se pescou
  // Outro numero aletorio para comparar com
  // hookChance se menor pesca se não pesca
  // Caso aperte o botao mostra no quicktime
  
}

extension Fishing {
  
  var bitChance: Int {
    // 30 %  max de change do peixe não fiscar
    randomInteger(low: 70, high: 100)
  }
  
  var bitValue: Int {
    randomInteger(low: 0, high: 100)
  }
  
  var timeFishing: Double {
    Double(randomInteger(low: 4, high: 6))
  }
  
  func fishing() {
    
    let node = delegate?.getNode()
    delegate?.startFish()
    print("Comecou a pescar--->")
    
    // Action time fish
    let actionFish = SKAction.sequence([
      SKAction.wait(forDuration: timeFishing),
      SKAction.run { bitFish(node: node) }
    ])
    
    // Roda a acao de pesca
    node?.run(actionFish)
    
    // Verifica se o peixe fiscou
    func bitFish(node: SKNode?) {
      
      // Caso o peixe fisgou
      if bitValue <= bitChance {
        
        
        self.fish = makeFish()
        guard let fish = self.fish else { fatalError("Deu ruim na pesca")}
        delegate?.bitFish(fish)

        print("bitFish --->")

        // Peixe pego
        let actionHusk = SKAction.sequence([
          // Tempo de espera do Quik time event paseado peixe
          SKAction.wait(forDuration: Double(fish.timeHook)),
          // Verificar espado e mudar para não pescou caso em bitFishState
          SKAction.run {
            self.delegate?.endQuickTimeEvent()
            print("QuickTimeEvent --->")
          }
        ])
        
        node?.run(actionHusk)
        
      } else { // Caso não pegar o peixe mudar o status
        print("No bitFish --->")
        delegate?.notGetFish()
      }
      
    }
  }
  
  // Gera o peixe baseado em uma probalidade
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
      fatalError("Deu ruim no peixe")
    }
  }
  
}
