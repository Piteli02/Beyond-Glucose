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
                
                Text("Step: \(controller.interactionStage.rawValue)/5")
                    .font(Font.custom("JustMeAgainDownHere", size: 56, relativeTo: .largeTitle))
                    .padding(.bottom, 40)
                
            }.allowsHitTesting(!controller.presentErrorView)
                .allowsHitTesting(!presentClue)
                .allowsHitTesting(!controller.continueToNextScreen)
            
            
            if controller.presentErrorView {
                InteractionErrorView2()
            }
            if presentClue{
                CluesFirstInteraction(presentClues: $presentClue)
            }
            if controller.interactionStage == .stage5 {
                ContinueInteractionScreen(title: "Thank you for the help!", textBody: "You had just helped on controlling the glucose levels of the blood\n\nNow let's undestant what is Hypoglycemia crisis and the importance of education on combating prejudice?", nextScreen: "Hypoglycemia")
                
            }
        }
        
    }
    
}
