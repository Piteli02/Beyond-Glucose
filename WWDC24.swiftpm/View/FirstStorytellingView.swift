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

        
        ZStack{
            Background()
            
            VStack{
                HStack{
                    Spacer()
                    Text("Caio Piteli")
                        .font(.largeTitle)
                        .fontWeight(.medium)
                    Spacer()
                    Text("\(dateControl.formattedDate())")
                        .font(.largeTitle)
                        .fontWeight(.medium)
                    Spacer()
                    
                }
                HStack{
                    Spacer()
                    Text("Bebedouro - São Paulo - 6th Grade")
                        .font(.title)
                        .fontWeight(.semibold)
                    Spacer()
                }
                HStack{
                    Text("    Class summary:")
                        .font(.title)
                        .fontWeight(.semibold)
                    Spacer()
                    
                }
                .padding(.top, 28)
                .padding(.leading, 40)
                .padding(.bottom, 28)
                HStack{
                    Text("     Understand about diabetes, symptoms, care and importance of support. Essential notes for understanding and supporting classmates with diabetes. A moment of learning and empathy in the classroom.")
                        .font(.title2)
                        .fontWeight(.regular)
                        .lineSpacing(42)
                    Spacer()
                }.padding(.leading, 40)
                
                Spacer()
                
                NavigationLink(value: "WhatIsDiabetes"){
                    
                    Image("continueButton")
                    
                }.padding(.bottom, 50)
            }        }
    }
}

#Preview {
    FirstStorytellingView(dateControl: DateControl())
}
