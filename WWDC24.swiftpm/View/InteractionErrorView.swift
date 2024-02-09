//
//  InteractionErrorView.swift
//  WWDC24
//
//  Created by Caio Gomes Piteli on 29/01/24.
//

import SwiftUI

struct InteractionErrorView: View {
    @EnvironmentObject var controller: FirstInteractionController
    
    var body: some View {
        ZStack{
            Color.black.opacity(0.3).ignoresSafeArea()

            
            VStack(alignment: .leading){
                
                Text("Oops...")
                    .font(Font.custom("JustMeAgainDownHere", size: 56, relativeTo: .largeTitle))
                    .foregroundStyle(.black)
                    .padding(.leading, 40)
                    .padding(.top, 20)
                
                Text(controller.interactionStage.text)
                    .font(Font.custom("Delius-Regular", size: 25, relativeTo: .title2))
                    .foregroundStyle(.black)
                    .padding(.horizontal, 40)
                    .padding(.bottom, 20)
                
                HStack {
                    Spacer()
                    Button(action: {
                        controller.presentErrorView.toggle()
                    }) {
                        Image("okButton")
                            .padding(.bottom, 20)
                    }
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
                
            ).frame(maxWidth: UIScreen.main.bounds.width - 200)
        }
    }
}


