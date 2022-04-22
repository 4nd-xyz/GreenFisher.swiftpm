import Foundation
import CoreGraphics

// Converts the value in degrees to polar coordinates
extension CGFloat {
  func degreesToRadians() -> CGFloat {
    return self * CGFloat.pi / 180
  }
}

