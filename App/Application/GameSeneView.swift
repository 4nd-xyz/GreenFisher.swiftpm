//
//  GameSeneView.swift
//  wwdc2022
//
//  Created by Anderson on 07/04/22.
//

import SwiftUI
import SpriteKit

struct GameSeneView: UIViewRepresentable {
  
  func makeUIView(context: UIViewRepresentableContext<GameSeneView>) -> SKView {
    let view = MySKView()
    view.presentMainScene()
    return view
  }
  
  func updateUIView(_ uiView: SKView, context: Context) { }
}
