import SwiftUI
//App it's only avaiable for iPad
@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            initialScreen()
                .environmentObject(router())
                .environmentObject(customFonts())
                .environmentObject(AudioManager())
        }
    }
}
