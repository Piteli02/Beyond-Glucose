//
//  Background.swift
//  WWDC24
//
//  Created by Caio Gomes Piteli on 27/01/24.
//

import SwiftUI

struct Background: View {
    
    var body: some View {
        GeometryReader{ geometry in
            
            ZStack {
                
                // Background color
                Color("BackgroundColor")
                    .edgesIgnoringSafeArea(.all)
                    .layoutPriority(3)
                
                ZStack{
                    
                    HStack{
                        // Vertical line
                        Rectangle()
                            .frame(width: 1.5, height: geometry.size.height + 100) // This "+100" is because the vertical whas respecting safeArea and I couldn't make it ignore
                            .foregroundColor(.red)
                            .opacity(0.35)
                        Spacer()
                    }
                    .padding(30)
                    .layoutPriority(1)
                    
                    //Horizontal lines
                    VStack{
                        ForEach(0..<150, id: \.self) { _ in
                            HStack {
                                
                                    
                                    Rectangle()
                                        .frame(width: geometry.size.width, height: 1.5)
                                        .foregroundColor(.blue)
                                        .opacity(0.35)
                                        .padding(.top, 35)
                                
                                
                            }
                            
                        }
                    }.layoutPriority(2)
                    
                }
            }
        }
    }
}


