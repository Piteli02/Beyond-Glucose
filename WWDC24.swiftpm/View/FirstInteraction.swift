//
//  firstInteraction.swift
//  WWDC24
//
//  Created by Caio Gomes Piteli on 23/01/24.
//

import SwiftUI
import AVFoundation

struct FirstInteraction: View {
    @EnvironmentObject var controller: FirstInteractionController
    @EnvironmentObject var audioManager: AudioManager

    
    @State var presentClue = false
    @State var presentInstructions = true

    
    @State var audioPlayerSuccess: AVAudioPlayer?
    let urlSuccess = Bundle.main.url(forResource: "successBip", withExtension: "mp3")!
    
    @State var audioPlayerFailure: AVAudioPlayer?
    let urlFailure = Bundle.main.url(forResource: "failureBip", withExtension: "mp3")!
  
    
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
                        .foregroundStyle(Color.black)

                    
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
                        .foregroundStyle(Color.black)

                    Spacer()
                }.offset(y: -50)

                
                Spacer()
            }
            .allowsHitTesting(!controller.presentErrorView)
            .allowsHitTesting(!presentClue)
            .allowsHitTesting(!controller.continueToNextScreen)
            
            if controller.presentErrorView && controller.errorsInARow < 3 {
                InteractionErrorView()
                    .onAppear{
                        if audioManager.audioOn{
                            audioPlayerFailure?.play()
                        }
                    }
            }
            
            if controller.errorsInARow == 3{
                skipSuggestion(title: "Keep trying?", instructions: "These are the steps you should follow:\n    1. Clean your hands with Hand sanitizer\n    2. Put the glucose strip on the glucometer\n    3. Poke your finger with the Lancet\n    4. Put the blood drop on the strip\n    5. Clean your finger\n\nYou want to keep tring or go to the next screen?", errorsInARow: $controller.errorsInARow, nextScreen: "SecondInteraction")
                    .onAppear{
                        audioPlayerFailure?.play()
                        controller.presentErrorView =  false
                        
                }
            }
            
            if controller.activateSuccessSound{
                Text("") //CLEAN CODE THIS, i couldn't make the audio be played on the controller so i used this ugly solution due to time constraints
                    .onAppear{
                        if audioManager.audioOn{
                            audioPlayerSuccess?.play()
                        }
                        controller.activateSuccessSound = false
                    }
            }
            
            if presentClue{
                Tips(presentClues: $presentClue, title: "Steps to measure glucose level", steps: "    1. Clean your hands with Hand sanitizer\n    2. Put the glucose strip on the glucometer\n    3. Poke your finger with the Lancet\n    4. Put the blood drop on the strip\n    5. Clean your finger")
            }
            
            if presentInstructions{
                instructions(presentingScreen: $presentInstructions, title: "Measure glucose levels", instructions: "     To check glucose levels, you gotta get a drop of blood from the finger using the lancet and put it on the strip in the glucometer, then it tells you the measurement results. \n\n    But before all that, there are a few steps you gotta do first. Let's learn?")
            }
            
            
            if controller.interactionStage == .stage5 {
                ContinueInteractionScreen(title: "Wow! Thanks a lot!", textBody: "Glucose levels:\n    Hypoglycemia - Below 70\n    Ideal - 70 to 100\n    Prediabetes - 100 to 125\n    Diabetes - 126 or higher\n\nLooks like the glucose levels are high, let's learn how the insulin application is made?", nextScreen: "SecondInteraction", illustration: "monitorWithNumber")
            }
            
        }.task{
            audioPlayerSuccess = try? AVAudioPlayer(contentsOf: urlSuccess)
            audioPlayerFailure = try? AVAudioPlayer(contentsOf: urlFailure)
            audioPlayerSuccess?.volume = 0.1
            audioPlayerFailure?.volume = 0.3

        }
    }
    }
    
}
