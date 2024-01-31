//
//  SecondInteraction.swift
//  WWDC24
//
//  Created by Caio Gomes Piteli on 30/01/24.
//

import SwiftUI

struct SecondInteraction: View {
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
                
                HStack{
                    Text("   Let's apply insulin?")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Spacer()
                }.padding(.leading, 40)
                
                HStack{
                    Spacer()
                    Button(action: {
                        presentClue.toggle()
                    }) {
                        Text("CLUES")
                    }
                    .padding(.trailing, 50)
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
                Spacer()
                
                if controller.continueDisabled {
                    
                    Button(action: {
                        print("Acabe a experiencia primeiro") // Arrumar isso
                    }) {
                        Image("continueButtonDisabled")
                        
                    }
                    .padding(.bottom, 50)
                    
                }else{
                    NavigationLink(value: "Hipoglicemia"){
                        
                        Image("continueButton")
                        
                    }.padding(.bottom, 50)
                        .disabled(controller.continueDisabled)
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
