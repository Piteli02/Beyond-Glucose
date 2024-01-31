//
//  News.swift
//  WWDC24
//
//  Created by Caio Gomes Piteli on 31/01/24.
//

import SwiftUI

struct News: View {
    var body: some View {
        ZStack{
            Background()
            
            VStack{
                
                HStack{
                    Text("   Empathy and Diabetes")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Spacer()
                }.padding(.leading, 40)
                
                HStack{
                    Text("     Unfortunately, until today, there are absurd cases of prejudice against diabetics and we need to understand that the disease is not just about food restriction, but about educating others to generate more inclusion and respect...")
                        .font(.title2)
                        .fontWeight(.regular)
                        .lineSpacing(42)
                    Spacer()
                }.padding(.leading, 40)
                
                HStack{
                    Spacer()
                    Image("news1")
                        .frame(maxWidth: .infinity)
                                        .frame(maxHeight: .infinity)
                    Spacer()
                    Image("news2")
                        .frame(maxWidth: .infinity)
                                        .frame(maxHeight: .infinity)
                    Spacer()
                }
                
                HStack{
                    Spacer()
                    Image("news3")
                        .frame(maxWidth: .infinity)
                        .frame(maxHeight: .infinity)
                    Spacer()
                }
                
                Spacer()
                
                NavigationLink(value: "News"){
                    
                    Image("continueButton")
                    
                }.padding(.bottom, 50)
            }
        }
    }
}

#Preview {
    News()
}
