//
//  SwiftUIView.swift
//  
//
//  Created by Caio Gomes Piteli on 31/01/24.
//

import Foundation
import SwiftUI
import UIKit

struct FirstStorytellingView: View {
    @ObservedObject var dateControl = DateControl()

    
    var body: some View {
        
        GeometryReader{ geometry in
        ZStack{
            Background()
            
            VStack{
                HStack{
                    
                    Spacer()
                    
                    Text("Caio Piteli")
                        .font(Font.custom("JustMeAgainDownHere", size: 48, relativeTo: .title))
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    Text("\(dateControl.formattedDate())")
                        .font(Font.custom("JustMeAgainDownHere", size: 48, relativeTo: .title))
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                }
                HStack{
                    
                    Spacer()
                    
                    Text("Bebedouro - São Paulo - 6th Grade")
                        .font(Font.custom("JustMeAgainDownHere", size: 48, relativeTo: .title))
                        .foregroundColor(.black)
                        .offset(y: 15)
                    
                    Spacer()
                    
                }
                HStack{
                    
                    Text("    Class summary:")
                        .font(Font.custom("JustMeAgainDownHere", size: 48, relativeTo: .title))
                        .foregroundColor(.black)
                        .offset(y: -10)
                    
                    Spacer()
                    
                }
                
                HStack{
                    Text("     Today we are going to dive into understanding Diabetes and how education is key on confronting the prejudice that individuals with Diabetes face.")
                        .font(Font.custom("Delius-Regular", size: 25, relativeTo: .body))
                        .foregroundColor(.black)
                        .offset(y: -12)
                        .baselineOffset(12)
                    
                    
                    Spacer()
                    
                }.padding(.leading, 35)
                    .padding(.trailing, 20)

                
                ZStack{
                    Image("dataIllustration")
                        .resizable()
                        .frame(width: geometry.size.width - 200, height: geometry.size.height/3)
                    
                    Text("In 2021 there were 537 million people living with Diabetes. Almost the population of the USA and Brazil combined.")
                        .font(Font.custom("Delius-Regular", size: 25, relativeTo: .body))
                        .baselineOffset(12)
                        .frame(width: geometry.size.width/3)
                        .padding(.leading, geometry.size.width/2.4)

                }
                Spacer()
                
                NavigationLink(value: "WhatIsDiabetes"){
                    
                    Image("continueButton")
                    
                }.padding(.bottom, 50)
            }        
        }
    }
    }
}

#Preview {
    FirstStorytellingView(dateControl: DateControl())
}
