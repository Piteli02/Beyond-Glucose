//
//  SwiftUIView.swift
//  
//
//  Created by Caio Gomes Piteli on 20/02/24.
//

import SwiftUI

struct instructions: View {
    @Binding var presentingScreen: Bool
    @State var title: String
    @State var instructions: String
    
    
    var body: some View {
        ZStack{
            Color.black.opacity(0.3).ignoresSafeArea()

            
            VStack(alignment: .leading){
                
                Text(title)
                    .font(Font.custom("JustMeAgainDownHere", size: 56, relativeTo: .largeTitle))
                    .foregroundStyle(.black)
                    .padding(.leading, 40)
                    .padding(.top, 20)
                
                Text(instructions)
                    .font(Font.custom("Delius-Regular", size: 25, relativeTo: .body))
                    .foregroundStyle(.black)
                    .padding(.horizontal, 40)
                    .padding(.bottom, 20)
                
                HStack {
                    Spacer()
                    Button(action: {
                        presentingScreen = false
                    }) {
                        Image("let'sButton")
                            .padding(.bottom, 20)
                    }
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
                
            ).frame(maxWidth: UIScreen.main.bounds.width - 200)
        }
    }
}
