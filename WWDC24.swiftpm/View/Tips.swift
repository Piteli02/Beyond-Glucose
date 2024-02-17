//
//  Tips.swift
//  WWDC24
//
//  Created by Caio Gomes Piteli on 30/01/24.
//

import SwiftUI

struct Tips: View {
    @Binding var presentClues: Bool
    @State var title: String
    @State var steps: String
    
    
    var body: some View {
        ZStack{
            Color.black.opacity(0.3).ignoresSafeArea()

            
            VStack(alignment: .leading){
                
                Text(title)
                    .font(Font.custom("JustMeAgainDownHere", size: 56, relativeTo: .largeTitle))
                    .foregroundStyle(.black)
                    .padding(.leading, 40)
                    .padding(.top, 20)
                
                Text(steps)
                    .font(Font.custom("Delius-Regular", size: 25, relativeTo: .body))
                    .foregroundStyle(.black)
                    .padding(.horizontal, 40)
                    .padding(.bottom, 20)
                
                HStack {
                    Spacer()
                    Button(action: {
                        presentClues = false
                    }) {
                        Image("okButton")
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
