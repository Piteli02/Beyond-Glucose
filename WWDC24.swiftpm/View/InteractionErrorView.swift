//
//  InteractionErrorView.swift
//  WWDC24
//
//  Created by Caio Gomes Piteli on 29/01/24.
//

import SwiftUI

struct InteractionErrorView: View {
    @EnvironmentObject var controller: FirstInteractionController
    @State var interactionStage: InteractionStage
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.yellow)
                .frame(width: 100, height: 100)
                .cornerRadius(10)
            
            VStack{
                
                Text(interactionStage.text)
                    .font(.title)
                    .foregroundColor(.black)
                    .padding()
                
                Button(action: {
                    controller.presentErrorView.toggle()
                }) {
                    Text("OK")
                        .foregroundColor(.red)
                        .fontWeight(.bold)
                }
            }
        }
    }
}

