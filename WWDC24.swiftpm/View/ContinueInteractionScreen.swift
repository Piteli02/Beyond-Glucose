//
//  ContinueInteractionScreen.swift
//
//
//  Created by Caio Gomes Piteli on 13/02/24.
//

import SwiftUI

struct ContinueInteractionScreen: View {
    @EnvironmentObject var controller: FirstInteractionController
    @State var title: String
    @State var textBody: String
    @State var nextScreen: String
    @State var illustration: String
    
    var body: some View {
        GeometryReader{ geometry in
        ZStack{
            Color.black.opacity(0.3).ignoresSafeArea()
            
            
            VStack(alignment: .leading){
                
                HStack{
                    VStack(alignment: .leading){
                        Text(title)
                            .font(Font.custom("JustMeAgainDownHere", size: 56, relativeTo: .largeTitle))
                            .foregroundStyle(.black)
                            .padding(.leading, 40)
                            .padding(.top, 20)
                        
                        Text(textBody)
                            .font(Font.custom("Delius-Regular", size: 25, relativeTo: .body))
                            .foregroundStyle(.black)
                            .padding(.horizontal, 40)
                            .padding(.bottom, 20)
                    }
                    
                    Image(illustration)
                        .resizable()
                        .frame(width: geometry.size.width / 5.9, height: geometry.size.height / 2.6)
                        .offset(y: 30)
                        //.padding(.top, 60)
                    
                }
                
                HStack {
                    
                    Spacer()
                    
                    NavigationLink(value: nextScreen){
                        
                        ZStack{
                            Image("let'sButton")
                        }
                        
                    }.padding(.bottom, 20)
                    
                    Spacer()
                }
                
            }.background(
                Rectangle()
                    .foregroundColor(Color("popUpColor"))
                    .cornerRadius(20)
                    .overlay(
                        Image("paperTexture")
                            .resizable()
                            .opacity(0.2)
                            .blendMode(.multiply)
                            .ignoresSafeArea()
                    )
                
            )
            .frame(maxWidth: UIScreen.main.bounds.width - 200)
            
        }
    }
    }
}
