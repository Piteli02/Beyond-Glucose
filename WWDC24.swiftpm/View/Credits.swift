//
//  Credits.swift
//  Beyond glucose
//
//  Created by Caio Gomes Piteli on 13/02/24.
//

import SwiftUI

struct Credits: View {
    var body: some View {
        GeometryReader{ geometry in
            ZStack{
                Background()
            VStack{
                Image("creditsPhoto")
                    .resizable()
                    .frame(width: geometry.size.width/1.7, height: geometry.size.height/2.5)
                    .padding(.bottom, 40)
                
                Text("    Hey! My name is Caio Piteli, brazilian grandson of people with Diabetes type 2, AKA, inspiration of this project. Special thanks to my grandfather and grandmother!\n    I believe that information is the key to combating prejudice and misinformation, so I hope that this project helps on creating awareness about Diabetes and the importance of knowledge in order to avoid prejudices.")
                    .font(Font.custom("Delius-Regular", size: 25, relativeTo: .body))
                    .foregroundColor(.black)
                    .baselineOffset(12)
                    .padding(.horizontal, 35)
                    .offset(y: 10)
                
                Spacer()
            }
        }
        }
    }
}

#Preview {
    Credits()
}
