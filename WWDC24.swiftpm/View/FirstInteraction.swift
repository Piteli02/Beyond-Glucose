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
                    Text("    Let's help on measuring glucose levels?")
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
                
                Text("Step: \(controller.interactionStage.rawValue)/5")
                    .font(Font.custom("JustMeAgainDownHere", size: 56, relativeTo: .largeTitle))
                    .padding(.bottom, 40)
                
            }
            .allowsHitTesting(!controller.presentErrorView)
            .allowsHitTesting(!presentClue)
            .allowsHitTesting(!controller.continueToNextScreen)
        
            if controller.presentErrorView {
                InteractionErrorView()
            }
            
            if presentClue{
                CluesFirstInteraction(presentClues: $presentClue)
            }
            
            if controller.interactionStage == .stage5 {
                ContinueInteractionScreen(title: "Wow! Thanks a lot!", textBody: "Glucose levels:\n    Hypoglycemia - Below 70\n    Ideal - 70 to 100\n    Prediabetes - 100 to 125\n    Diabetes - 126 or higher\n\nLooks like the glucose levels are high, let's learn how the insulin application is made?", nextScreen: "SecondInteraction")
                
            }
            
        }
    }
    
}
