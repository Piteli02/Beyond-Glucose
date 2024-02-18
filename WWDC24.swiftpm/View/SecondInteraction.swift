//
//  SecondInteraction.swift
//  WWDC24
//
//  Created by Caio Gomes Piteli on 30/01/24.
//

import SwiftUI
import AVFoundation

struct SecondInteraction: View {
    @EnvironmentObject var controller: SecondInteractionController
    @State var presentClue = false
    
    @State var audioPlayerSuccess: AVAudioPlayer?
    let urlSuccess = Bundle.main.url(forResource: "successBip", withExtension: "mp3")!
    
    @State var audioPlayerFailure: AVAudioPlayer?
    let urlFailure = Bundle.main.url(forResource: "failureBip", withExtension: "mp3")!
    
    var body: some View {
        
        let handSanitizer = CustomizedImage2(imageData: $controller.images[0])
        let cotton = CustomizedImage2(imageData: $controller.images[1])
        let arm = CustomizedImage2(imageData: $controller.images[2])
        let seringe = CustomizedImage2(imageData: $controller.images[3])
        let insulin = CustomizedImage2(imageData: $controller.images[4])
        GeometryReader{ geometry in
            ZStack{
                Background()
                
                VStack{
                    
                    HStack{
                        Text("    Let's apply insulin?")
                            .font(Font.custom("JustMeAgainDownHere", size: 48, relativeTo: .title))
                        
                        Spacer()
                        
                        Button(action: {
                            presentClue.toggle()
                        }) {
                            Image("tipButton")
                            
                        }.padding(.trailing, 35)
                        
                    }

                    HStack{
                        VStack{
                            
                            handSanitizer
                                .frame(width: geometry.size.width/8.5, height: geometry.size.height/3)
                                .padding()
                            
                            cotton
                                .frame(width: geometry.size.width/8.4, height: geometry.size.height/7.5)
                                .padding()
                            
                        }.padding()
                        
                        
                        arm
                            .frame(width: geometry.size.width/2.5, height: geometry.size.height/2)
                            .padding()
                        
                        VStack{
                            
                            seringe
                                .frame(width: geometry.size.width/4.9, height: geometry.size.height/3.1)
                                .padding()

                            insulin
                                .frame(width: geometry.size.width/12.5, height: geometry.size.height/4.8)
                                .padding()

                            
                        }.padding()
                        
                        
                    }
                    Spacer()
                    
                    Text("Step: \(controller.interactionStage.rawValue)/5")
                        .font(Font.custom("JustMeAgainDownHere", size: 56, relativeTo: .largeTitle))
                        .padding(.bottom, 40)
                    
                }.allowsHitTesting(!controller.presentErrorView)
                    .allowsHitTesting(!presentClue)
                    .allowsHitTesting(!controller.continueToNextScreen)
                
                if controller.activateSuccessSound{
                    Text("") //CLEAN CODE THIS, i couldn't make the audio be played on the controller so i used this ugly solution due to time constraints
                        .onAppear{
                            audioPlayerSuccess?.play()
                            controller.activateSuccessSound = false
                        }
                }
                
                if controller.presentErrorView {
                    InteractionErrorView2()
                        .onAppear{
                            audioPlayerFailure?.volume = 0.3
                            audioPlayerFailure?.play()
                        }
                }
                if presentClue{
                    Tips(presentClues: $presentClue, title: "Steps for applying insulin:", steps: "    1. Put hand sanitizer on the cotton\n    2. Pass the cotton on the arm\n    3. Pass the cotton on the insulin bottle\n    4. Fill the seringe with insulin\n    5. Apply the seringe on the arm")
                }
                if controller.interactionStage == .stage5 {
                    ContinueInteractionScreen(title: "Thank you for the help!", textBody: "You had just helped on controlling the glucose levels of the blood\n\nNow let's undestant what is Hypoglycemia crisis and the importance of education on combating prejudice?", nextScreen: "Hypoglycemia")
                    
                }
            }
        }.task{
            audioPlayerSuccess = try? AVAudioPlayer(contentsOf: urlSuccess)
            audioPlayerFailure = try? AVAudioPlayer(contentsOf: urlFailure)
        }
    }
    
}
