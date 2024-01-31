//
//  Hipoglicemia.swift
//  WWDC24
//
//  Created by Caio Gomes Piteli on 31/01/24.
//

import SwiftUI

struct Hipoglicemia: View {
    @ObservedObject var router: router
    var body: some View {
        ZStack{
            Background()
            
            VStack{
                Spacer()
                HStack{
                    Spacer()
                    Text("Let's spread knowledge and education together to combat the various types of prejudice that exist.")
                        .font(.headline)
                        .fontWeight(.regular)
                    Spacer()
                }
                Spacer()
                
                Button(action: {
                    router.resetViewStack() // Arrumar isso
                       }) {
                           Image("continueButton")
                       }
                       .padding(.bottom, 50)

            }
        }
    }
}


