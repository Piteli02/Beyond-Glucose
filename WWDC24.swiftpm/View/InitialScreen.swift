import SwiftUI
import UIKit

struct initialScreen: View {
    @EnvironmentObject var router: router
    @EnvironmentObject var customFont: customFonts
    
    
    var body: some View {
        NavigationStack(path: $router.path){
            
            ZStack{
                Color("coverBackgroundColor")
                
                Image("coverPattern")
                    .resizable()
                    .scaledToFill()
                    .opacity(0.8)
                    .blendMode(.multiply)
                
                GeometryReader{ geometry in
                    
                    let width = geometry.size.width
                    let height = geometry.size.height
                    
                    HStack{
                        //Cover black margin
                        Rectangle()
                            .frame(width: width/7.2, height: height)
                            .foregroundColor(Color("marginColor"))
                            .overlay(
                                Image("paperTexture")
                                    .resizable()
                                    .opacity(1)
                                    .blendMode(.multiply)
                            )
                        
                        Spacer()
                        
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
                                        .frame(width: width/3.2, height: height/12)
                                        
                                    Text("Start")
                                        .font(Font.custom("JustMeAgainDownHere", size: 60))
                                        .foregroundColor(.black)
                                    
                                }
                            }
                            
                            NavigationLink(value: "Credits"){
                                
                                ZStack{
                                    Image("coverButton")
                                        .resizable()
                                        .frame(width: width/3.2, height: height/12)
                                        
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
            .ignoresSafeArea()
            .navigationDestination(for: String.self){ value in
                switch value{
                case "Start":
                    FirstStorytellingView()
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
                case "Hipoglicemia":
                    Hipoglicemia(router: router)
                default:
                    Text("ERRO") //CORRIGIR CASO DE ALGUM ERRO QUE NÃO VÁ PARA TELA CORRETA
                }
            }
        }
    }
    
    
}
