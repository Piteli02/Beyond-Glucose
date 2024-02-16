import SwiftUI
import UIKit
import AVFoundation

struct initialScreen: View {
    @EnvironmentObject var router: router
    @EnvironmentObject var customFont: customFonts
    @State private var audioPlayer: AVAudioPlayer?
    let url = Bundle.main.url(forResource: "backgroundMusic", withExtension: "mp3")!
    
    
    var body: some View {
      
        NavigationStack(path: $router.path){
            
            ZStack{
                //MARK: - Background
                Color("coverBackgroundColor")
                    .ignoresSafeArea()
                
                Image("coverPattern")
                    .resizable()
                    .scaledToFill()
                    .opacity(0.8)
                    .blendMode(.multiply)
                    .ignoresSafeArea()
                

                GeometryReader{ geometry in
                    
                    let width = geometry.size.width
                    let height = geometry.size.height
                    
                    HStack{
                        
                        //Black Margin
                        Rectangle()
                            .frame(width: width/8, height: height)
                            .foregroundColor(Color("marginColor"))
                            .overlay(
                                Image("paperTexture")
                                    .resizable()
                                    .opacity(1)
                                    .blendMode(.multiply)
                                    .ignoresSafeArea()
                            )
                        
                        Spacer()
                        
                        //MARK: - Buttons and title
                        VStack{
                            ZStack{
                                Image("coverTitleRectangle")
                                    .resizable()
                                    .frame(width: width/2, height: height/3.5)
                                
                                Text("Beyond glucose")
                                    .font(Font.custom("JustMeAgainDownHere", size: 75))
                                    .foregroundColor(.black)
                            }
                            
                            
                            NavigationLink(value: "Start"){
                                
                                ZStack{
                                    Image("coverButton")
                                        .resizable()
                                        .frame(width: width/3.2, height: height/13)
                                        
                                    Text("Start")
                                        .font(Font.custom("JustMeAgainDownHere", size: 60))
                                        .foregroundColor(.black)
                                    
                                }
                            }
                            
                            NavigationLink(value: "Credits"){
                                
                                ZStack{
                                    Image("coverButton")
                                        .resizable()
                                        .frame(width: width/3.2, height: height/13)
                                        
                                    Text("Credits")
                                        .font(Font.custom("JustMeAgainDownHere", size: 60))
                                        .foregroundColor(.black)
                                    
                                }
                            }
                        }
                        
                        Spacer()
                    }
                    
                }
            }
            .navigationDestination(for: String.self){ value in
                switch value{
                case "Start":
                    FirstStorytellingView()
                case "Credits":
                        Credits()
                case "WhatIsDiabetes":
                    WhatIsDiabetes()
                case "News":
                    News()
                case "DiabetesEssential":
                    DiabetesEssential()
                case "FirstInteraction":
                    FirstInteraction()
                        .environmentObject(FirstInteractionController())
                case "SecondInteraction":
                    SecondInteraction()
                        .environmentObject(SecondInteractionController())
                case "Hypoglycemia":
                    Hypoglycemia()
                case "Disclaimer":
                    Disclaimer()
                case "FinalScreen":
                    FinalScreen()
                default:
                    Text("ERRO") //CORRIGIR CASO DE ALGUM ERRO QUE NÃO VÁ PARA TELA CORRETA
                }
            }
            
            .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
                // Stop playing background music when app goes to background
                audioPlayer?.stop()
            }
            .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
                // Resume playing background music when app comes back to foreground
                audioPlayer?.play()
            }
            
        }.onAppear{
            audioPlayer = try? AVAudioPlayer(contentsOf: url)
            audioPlayer?.numberOfLoops = -1
            audioPlayer?.volume = 0.1
            audioPlayer?.play()
        }
    }
    
    
}
