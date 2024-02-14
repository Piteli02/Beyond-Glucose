//
//  NewsScreen.swift
//  WWDC24
//
//  Created by Caio Gomes Piteli on 31/01/24.
//

import SwiftUI

struct WhatIsDiabetes: View {
    var body: some View {
        GeometryReader{ geometry in
            ZStack{
                Background()
                
                VStack{
                    
                    HStack{
                        Text("    What is Diabetes?")
                            .font(Font.custom("JustMeAgainDownHere", size: 48, relativeTo: .title))
                        
                        Spacer()
                        
                    }
                    
                    HStack{
                        Text("     Is a noncommunicable disease that happens when the pancreas does not produce enough insulin or, if the body cannot use insulin the way it should.")
                            .font(Font.custom("Delius-Regular", size: 25, relativeTo: .body))
                            .foregroundColor(.black)
                            .baselineOffset(12)
                        Spacer()
                    } .padding(.leading, 35)

                    
                    HStack{
                        
                        Spacer()
                        CustomizedImageDiabetes(title: "Pancreas", imageAfterTap: "pancreas", imageBeforetap: "pancreasBefore" , descriptionafter: "Organ responsible for producing insulin")
                        Spacer()
                        CustomizedImageDiabetes(title: "   Insulin", imageAfterTap: "insulinAndSeringe", imageBeforetap: "insulinBefore", descriptionafter: "Helps transform sugar on the blood in energy")
                        Spacer()
                        CustomizedImageDiabetes(title: "Noncommunicable", imageAfterTap: "virus", imageBeforetap: "virusBefore" , descriptionafter: "Other people won't get infected")
                        Spacer()
                    }
                    
                    
                    Spacer()
                    
                    NavigationLink(value: "DiabetesEssential"){
                        
                        Image("continueButton")
                        
                    }.padding(.bottom, 50)
                    
                    
                }
            }
        }
    }
}


