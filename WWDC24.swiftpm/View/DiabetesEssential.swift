//
//  DiabetesEssential.swift
//  WWDC24
//
//  Created by Caio Gomes Piteli on 31/01/24.
//

import SwiftUI

struct DiabetesEssential: View {
    var body: some View {
        ZStack{
            Background()
            
            VStack{
                HStack{
                    Text("   What is essential for a person with Diabetes")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Spacer()
                }.padding(.leading, 40)
                
                Image("diabeticsEssentials")
                
                Spacer()
                
                NavigationLink(value: "FirstInteraction"){
                    
                    Image("continueButton")
                    
                }.padding(.bottom, 50)
            }
        }
    }
}

#Preview {
    DiabetesEssential()
}
