//
//  firstInteraction.swift
//  WWDC24
//
//  Created by Caio Gomes Piteli on 23/01/24.
//

import SwiftUI

struct FirstInteraction: View {
    @EnvironmentObject var router: router
    @EnvironmentObject var controller: FirstInteractionController
    
    var body: some View {
        
        let handSanitizer = CustomizedImage(imageData: $controller.images[0])
        let cotton = CustomizedImage(imageData: $controller.images[1])
        let monitor = CustomizedImage(imageData: $controller.images[2])
        let strip = CustomizedImage(imageData: $controller.images[3])
        let lancet = CustomizedImage(imageData: $controller.images[4])
        let hand = CustomizedImage(imageData: $controller.images[5])
        
        
        
        
        ZStack{
            // MARK: - Background view
            Background()
            
            // MARK: - Building view
            VStack {
                
                HStack {
                    
                    handSanitizer
                    cotton
                    lancet
                    hand
                    monitor
                    strip
                    
                }
                
            }
            
            if controller.presentErrorView {
                InteractionErrorView(interactionStage: .stage0)
            }
        }
    }
    
}
