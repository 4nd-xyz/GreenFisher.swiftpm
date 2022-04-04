import Foundation
import CoreGraphics

class Player: Fishing {
  var fish: Fish?
  var delegate: FishingDelegate?
  let velocity = CGFloat(4.0)
}
