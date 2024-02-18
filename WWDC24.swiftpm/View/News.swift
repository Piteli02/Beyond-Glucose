//
//  News.swift
//  WWDC24
//
//  Created by Caio Gomes Piteli on 31/01/24.
//

import SwiftUI

struct News: View {
    var body: some View {
        GeometryReader{ geometry in
        ZStack{
            Background()
            
            VStack{
                
                HStack{
                    Text("    Empathy and Diabetes")
                        .font(Font.custom("JustMeAgainDownHere", size: 48, relativeTo: .title))
                    
                    Spacer()
                    
                }
                
                HStack{
                    Text("     Unfortunately, all around the world there are absurd cases of prejudice against diabetics and its indispensable treatment, so it's necessary to  educate, in order to generate more inclusion and respect...")
                        .font(Font.custom("Delius-Regular", size: 25, relativeTo: .body))
                        .foregroundColor(.black)
                        .baselineOffset(12)
                    Spacer()
                } .padding(.leading, 35)
                    .padding(.trailing, 20)

                
                HStack{
                    Spacer()
                    
                    Image("news1")
                        .frame(width: geometry.size.width / 3.1, height: geometry.size.height / 3)
                        .padding()
                        
                    
                    Spacer()
                    
                    Image("news2")
                        .frame(width: geometry.size.width / 2.8, height: geometry.size.height / 4.2)
                        .padding()
                
                    
                    Spacer()
                }
                
                HStack{
                    Spacer()
                    
                    Image("news3")
                        .frame(width: geometry.size.width / 2.7, height: geometry.size.height / 4.5)
                        .padding()
                     
                    Spacer()
                }
                
                Spacer()
                
                NavigationLink(value: "Disclaimer"){
                    
                    Image("continueButton")
                    
                }.padding(.bottom, 50)
            }
        }
    }
    }
}

