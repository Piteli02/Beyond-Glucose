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
                        .offset(y: -12)
                        .padding()
                    
                    Text("     It's important to note that this app is entirely educational. The aim of the app is to raise awareness about diabetes and promote respect for people living with it.")
                        .font(Font.custom("Delius-Regular", size: 25, relativeTo: .body))
                        .foregroundColor(.black)
                        .baselineOffset(12)
                        .padding(.leading, 35)
                        .padding(.trailing, 20)
                        .offset(y: 18)
                    
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
