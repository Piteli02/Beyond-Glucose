//
//  CustomizedImageDiabetes.swift
//  WWDC24
//
//  Created by Caio Gomes Piteli on 31/01/24.
//

import SwiftUI

struct CustomizedImageDiabetes: View {
    @State var title: String
    @State var imageAfterTap: String
    @State var imageBeforetap: String
    @State var descriptionafter: String
    @State var tapped = false
    
    
    var body: some View {
        GeometryReader{ geometry in
            
        VStack(alignment: .center) {
            Text(tapped ? title : title)
                .font(Font.custom("JustMeAgainDownHere", size: 48, relativeTo: .title))
                .offset(y: 35)
            
            Image(tapped ? imageAfterTap : imageBeforetap)
                .frame(width: geometry.size.width/7.8, height: geometry.size.height / 5.6)
                .onTapGesture {
                    tapped = true
                }
            
            Text(tapped ? descriptionafter : "Tap to learn more")
                .font(Font.custom("Delius-Regular", size: 25, relativeTo: .body))
                .frame(width: geometry.size.width-200/3)
                .multilineTextAlignment(.center)
                .padding(.top, 20)
        }
    }
    }

}
