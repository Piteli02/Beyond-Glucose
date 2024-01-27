//
//  Background.swift
//  WWDC24
//
//  Created by Caio Gomes Piteli on 27/01/24.
//

import SwiftUI

struct Background: View {
    var body: some View {
        
        ZStack {
            
            // Background color
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            
            
            // Backgrounds Lines
            ZStack{
                HStack{
                    // Vertical line
                    Rectangle()
                        .frame(width: 1.5, height: UIScreen.main.bounds.height)
                        .foregroundColor(.red)
                        .opacity(0.25)
                        .padding(.top, 25)
                    Spacer()
                }.padding(30)
                
                //Horizontal lines
                VStack{
                    ForEach(0..<150, id: \.self) { _ in
                        HStack {
                            Rectangle()
                                .frame(width: UIScreen.main.bounds.width, height: 1.5)
                                .foregroundColor(.blue)
                                .opacity(0.35)
                                .padding(.top, 25)
                        }
                    }
                }
            }
        }
    }
}

