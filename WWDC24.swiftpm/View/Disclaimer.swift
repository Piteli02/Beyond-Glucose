//
//  Disclaimer.swift
//  Beyond glucose
//
//  Created by Caio Gomes Piteli on 14/02/24.
//

import SwiftUI

struct Disclaimer: View {
    var body: some View {
        GeometryReader{ geometry in
            ZStack{
                Background()
                
                VStack{
                    Spacer()
                    Image("disclaimer")
                        .resizable()
                        .frame(width: geometry.size.width / 3.2, height: geometry.size.height / 2.5)
                    
                    Text("     Do not replace professional medical advice")
                        .font(Font.custom("Delius-Regular", size: 34, relativeTo: .title))
                        .foregroundColor(.black)
                        .padding()
                    
                    Text("     It's important to note that this app is entirely educational. The aim of the app is to raise awareness about diabetes and promote inclusion and respect for people living with the condition. ")
                        .font(Font.custom("Delius-Regular", size: 25, relativeTo: .body))
                        .foregroundColor(.black)
                        .baselineOffset(12)
                        .padding(.horizontal, 35)
                    
                    Spacer()
                    
                    NavigationLink(value: "FinalScreen"){
                        
                        Image("continueButton")
                        
                    }.padding(.bottom, 50)
                    
                }
                
            }
        }
    }
}

#Preview {
    Disclaimer()
}
