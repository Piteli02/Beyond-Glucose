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
    
    var body: some View {
        ZStack{
            Color.black.opacity(0.3).ignoresSafeArea()
            
            
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
                    .foregroundColor(Color("InteractionErrorColor"))
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
