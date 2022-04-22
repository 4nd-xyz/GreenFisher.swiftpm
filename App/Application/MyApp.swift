//
//  GameSeneView.swift
//  GreenFisher
//
//  Created by Anderson on 07/04/22.
//

import SwiftUI

@main
struct MyApp: App {
  var body: some Scene {
    WindowGroup {
      GameSeneView()
        .ignoresSafeArea(.all)
        .statusBar(hidden: true)
    }
  }
}
