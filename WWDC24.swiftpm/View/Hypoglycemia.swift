//
//  Hipoglicemia.swift
//  WWDC24
//
//  Created by Caio Gomes Piteli on 31/01/24.
//

import SwiftUI
import AVFoundation

struct Hypoglycemia: View {
    @State var candyImage = "candy"
    @State private var audioPlayer: AVAudioPlayer?
    let url = Bundle.main.url(forResource: "biteSound", withExtension: "mp3")!
    @EnvironmentObject var audioManager: AudioManager


    
    var body: some View {
        GeometryReader{ geometry in
            ZStack{
                Background()
                
                VStack{
                    
                    HStack{
                        Text("    Hypoglycemia")
                            .font(Font.custom("JustMeAgainDownHere", size: 48, relativeTo: .title))
                            .foregroundStyle(Color.black)

                        
                        Spacer()
                        
                    }
                    
                    HStack{
                        Text("     This is a condition where the levels of sugar (glucose) on the blood hit a critical low level (below70).")
                            .font(Font.custom("Delius-Regular", size: 25, relativeTo: .body))
                            .foregroundColor(.black)
                            .baselineOffset(12)
                        Spacer()
                        
                    } .padding(.leading, 35)
                        
                    Spacer()
                    
                    HStack{
                        Spacer()
                        Image("hypoglycemiaSymptoms")
                            .resizable()
                            .frame(width: geometry.size.width / 3.8, height: geometry.size.height / 2.2)
                            .offset(y: -60)
                        
                        Spacer()
                        
                        ZStack{
                            Image("whatToDoHypoglycemia")
                                .resizable()
                                .frame(width: geometry.size.width / 2.4, height: geometry.size.height / 2.4)
                                .offset(y: 20)
                            
                            Image(candyImage)
                                .offset(y: 115)
                                .offset(x: 90)
                                .onTapGesture {
                                    if candyImage == "candy"{
                                        audioPlayer?.volume = 0.5
                                        if audioManager.audioOn{
                                            audioPlayer?.play()
                                        }
                                    }
                                    candyImage = "biteCandy"
                                    
                                 
                                }
                                
                        }
                        Spacer()
                    }
                    Spacer()

                    
                    NavigationLink(value: "News"){
                        
                        Image("continueButton")
                        
                    }.padding(.bottom, 50)
                    
                }
            }
        }.task{
            audioPlayer = try? AVAudioPlayer(contentsOf: url)
        }
    }
}
