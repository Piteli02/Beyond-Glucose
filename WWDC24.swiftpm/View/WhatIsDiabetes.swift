//
//  NewsScreen.swift
//  WWDC24
//
//  Created by Caio Gomes Piteli on 31/01/24.
//

import SwiftUI

struct WhatIsDiabetes: View {
    var body: some View {
        ZStack{
            Background()
            
            VStack{
                HStack{
                    Text("   What is Diabetes?")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Spacer()
                }.padding(.leading, 40)
                
                HStack{
                   Image("whatIsDiabetesText") //Change that, but how to?
                }.padding(.leading, 40)
                
                HStack{
                    Spacer()
                    CustomizedImageDiabetes(title: "Pancreas", imageAfterTap: "pancreas" , descriptionafter: "Organ responsible for producing insulin")
                    Spacer()
                    CustomizedImageDiabetes(title: "Insulin", imageAfterTap: "insulinAndSeringe", descriptionafter: "Helps transform sugar on the blood in energy")
                    Spacer()
                    CustomizedImageDiabetes(title: "Noncommunicable", imageAfterTap: "virus" , descriptionafter: "Other people won't get infected")
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


