//
//  InteractionErrorView2.swift
//  WWDC24
//
//  Created by Caio Gomes Piteli on 30/01/24.
//

import SwiftUI

struct InteractionErrorView2: View {
    @EnvironmentObject var controller: SecondInteractionController
    
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
