//
//  firstInteraction.swift
//  WWDC24
//
//  Created by Caio Gomes Piteli on 23/01/24.
//

import SwiftUI

struct FirstInteraction: View {
    @EnvironmentObject var router: router
    @ObservedObject var controller = FirstInteractionController()
    
    var body: some View {
        ZStack{
            // MARK: - Background view
            Background()
            
            // MARK: - Building view
            VStack {
                
                HStack {
                    
                    let handSanitizer = CustomizedImage(imageData: $controller.images[0], controller: controller)
                    let cotton = CustomizedImage(imageData: $controller.images[1], controller: controller)
                    
                    handSanitizer
                    cotton
                    
                }
                
            }
        }
    }
    
}
