//
//  firstInteraction.swift
//  WWDC24
//
//  Created by Caio Gomes Piteli on 23/01/24.
//

import SwiftUI

struct FirstInteraction: View {
    @EnvironmentObject var controller: FirstInteractionController
    @State var presentClue = false
    
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
                HStack{
                    Text("   Let's meause the glucose levels of the blood?")
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
                    }.padding(.trailing, 50)
                    
                }
                
                HStack {
                    
                    handSanitizer
                    cotton
                    lancet
                    hand
                    monitor
                    strip
                    
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
                    NavigationLink(value: "SecondInteraction"){
                        
                        Image("continueButton")
                        
                    }.padding(.bottom, 50)
                        .disabled(controller.continueDisabled)
                }
                
            }.allowsHitTesting(!controller.presentErrorView)
            
            if controller.presentErrorView {
                InteractionErrorView()
            }
            
            if presentClue{
                CluesFirstInteraction(presentClues: $presentClue)
            }
            
        }
    }
    
}
