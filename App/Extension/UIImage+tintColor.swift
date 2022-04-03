//
//  UIImage+tintColor.swift
//  
//
//  Created by Anderson on 09/04/22.
//

import Foundation
import UIKit

// MARK: - UIImage extensions

public extension UIImage {
  
  func tint(with fillColor: UIColor) -> UIImage? {
    let image = withRenderingMode(.alwaysTemplate)
    UIGraphicsBeginImageContextWithOptions(size, false, scale)
    fillColor.set()
    image.draw(in: CGRect(origin: .zero, size: size))
    
    guard let imageColored = UIGraphicsGetImageFromCurrentImageContext() else {
      return nil
    }
    
    UIGraphicsEndImageContext()
    return imageColored
  }
}

