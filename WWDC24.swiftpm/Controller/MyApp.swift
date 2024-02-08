import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            initialScreen()
                .environmentObject(router())
                .environmentObject(customFonts())
        }
    }
}
