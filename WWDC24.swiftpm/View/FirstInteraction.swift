//
//  firstInteraction.swift
//  WWDC24
//
//  Created by Caio Gomes Piteli on 23/01/24.
//

import SwiftUI

struct FirstInteraction: View {
    @EnvironmentObject var router: router
    
    @State var images: [ImageInfo] = [
        .init(nameBeforeClick: "handSanitizer", nameAfterClick: "openHandSanitizer"),
        .init(nameBeforeClick: "cotton", nameAfterClick: "cotton")
    ]
   
    
    var body: some View {
        VStack {
        
            HStack {
                
                let handSanitizer = CustomizedImage(imageData: $images[0])
                let cotton = CustomizedImage(imageData: $images[1])
                
                handSanitizer
                cotton
                
                if cotton.imageData.isPressed && handSanitizer.imageData.isPressed{
                    Text("Animation should happen, objects shouldn't have a shadow anymore. If aren't the right imaages, they dhould not have a shadow anymore")
                }

                
                               
            }
            
        }.background(Image("backgroundImage"))
        
    }
    
}
