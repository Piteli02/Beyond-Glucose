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
            
            VStack{
                
                Text(controller.interactionStage.text)
                    .font(.title)
                    .foregroundColor(.black)
                    .padding()
                    .background(
                        Rectangle()
                        .foregroundColor(.yellow)
                        .cornerRadius(10)
                    )
       
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

