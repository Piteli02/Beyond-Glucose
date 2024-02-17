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
        
        GeometryReader{ geometry in
        ZStack{
            // MARK: - Background view
            Background()
            
            // MARK: - Building view
            VStack {
                HStack{
                    Text("    Let's help on measuring glucose levels?")
                        .font(Font.custom("JustMeAgainDownHere", size: 48, relativeTo: .title))
                    
                    Spacer()
                    
                    Button(action: {
                        presentClue.toggle()
                    }) {
                        Image("tipButton")
                        
                    }.padding(.trailing, 35)
                    
                }.offset(y: 15)
                
                HStack{
                    Text("      Tap the object, then tap on the related one for the interaction to happen")
                        .font(Font.custom("Delius-Regular", size: 25, relativeTo: .body))
                        .foregroundColor(.black)
                        .offset(y: 5)
                        
                    Spacer()
                } .padding(.leading, 35)
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    VStack{
                        handSanitizer
                            .frame(width: geometry.size.width/8.7, height: geometry.size.height/3.2)
                            .padding()
                        cotton
                            .frame(width: geometry.size.width/8.6, height: geometry.size.height/7.7)
                            .padding()
                            .offset(x: -60)
                        
                        lancet
                            .frame(width: geometry.size.width/7.2, height: geometry.size.height/5.1)
                            .padding()
                            .offset(x: 60)
                    }
                    
                    Spacer()
                    
                    hand
                        .frame(width: geometry.size.width/3.5, height: geometry.size.height/1.5)
                        .padding()
                    
                    Spacer()
                    
                    VStack{
                        
                        monitor
                            .frame(width: geometry.size.width/5.1, height: geometry.size.height/3.3)
                            .padding()
                        strip
                            .frame(width: geometry.size.width/10.5, height: geometry.size.height/5.3)
                            .padding()
                    }
                    
                    Spacer()
                }
                
                HStack{
                    Spacer()
                    Text("Step: \(controller.interactionStage.rawValue)/5")
                        .font(Font.custom("JustMeAgainDownHere", size: 56, relativeTo: .largeTitle))
                    Spacer()
                }.offset(y: -50)

                
                Spacer()
            }
            .allowsHitTesting(!controller.presentErrorView)
            .allowsHitTesting(!presentClue)
            .allowsHitTesting(!controller.continueToNextScreen)
            
            if controller.presentErrorView {
                InteractionErrorView()
            }
            
            if presentClue{
                Tips(presentClues: $presentClue, title: "Steps to measure glucose level", steps: "    1. Clean your hands with Hand sanitizer\n    2. Put the glucose strip on the glucometer\n    3. Poke your finger with the Lancet\n    4. Put the blood drop on the strip\n    5. Clean your finger")
            }
            
            if controller.interactionStage == .stage5 {
                ContinueInteractionScreen(title: "Wow! Thanks a lot!", textBody: "Glucose levels:\n    Hypoglycemia - Below 70\n    Ideal - 70 to 100\n    Prediabetes - 100 to 125\n    Diabetes - 126 or higher\n\nLooks like the glucose levels are high, let's learn how the insulin application is made?", nextScreen: "SecondInteraction", illustration: "monitorWithNumber")
            }
            
        }
    }
    }
    
}
