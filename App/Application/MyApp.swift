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
