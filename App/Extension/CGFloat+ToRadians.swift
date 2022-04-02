import Foundation
import CoreGraphics

// Converte o valor em graus para coodernadas polares
extension CGFloat {
  func degreesToRadians() -> CGFloat {
    return self * CGFloat.pi / 180
  }
}

