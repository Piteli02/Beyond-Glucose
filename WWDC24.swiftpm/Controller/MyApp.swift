import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
//            FirstInteraction()
//                    .environmentObject(router())
//                    .environmentObject(FirstInteractionController())
            SecondInteraction()
                .environmentObject(router())
                .environmentObject(SecondInteractionController())
        }
    }
}
