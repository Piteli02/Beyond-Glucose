//
//  SecondInteraction.swift
//  WWDC24
//
//  Created by Caio Gomes Piteli on 30/01/24.
//

import SwiftUI

struct SecondInteraction: View {
    @EnvironmentObject var router: router
    @EnvironmentObject var controller: SecondInteractionController
    @State var presentClue = false
    
    var body: some View {
        let handSanitizer = CustomizedImage2(imageData: $controller.images[0])
        let cotton = CustomizedImage2(imageData: $controller.images[1])
        let arm = CustomizedImage2(imageData: $controller.images[2])
        let seringe = CustomizedImage2(imageData: $controller.images[3])
        let insulin = CustomizedImage2(imageData: $controller.images[4])
        
        ZStack{
            Background()
            
            VStack{
                Button(action: {
                    presentClue.toggle()
                }) {
                    Text("CLUES")
                }
                
                HStack{
                    VStack{ 
                        handSanitizer
                        cotton
                    }.padding()
                    
                    
                    arm
                    
                    
                    VStack{
                        seringe
                            
                        insulin
                    }.padding()
    
                }
            }.allowsHitTesting(!controller.presentErrorView)
            
            if controller.presentErrorView {
                InteractionErrorView2()
            }
            if presentClue{
                CluesFirstInteraction(presentClues: $presentClue)
            }
        }
        
    }
}

