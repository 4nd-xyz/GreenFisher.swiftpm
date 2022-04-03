import Foundation
import GameplayKit
import SpriteKit

protocol Fish: Random {
  var timeHook: Double { get }
  var name: String { get set }
  var texture:  SKTexture { get set }
  var weight: Int { get }
  var length: Int { get }
}
