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
    @State var descriptionafter: String
    @State var tapped = false
    
    
    var body: some View {
        VStack{
            Text(tapped ? title : "")
                .font(.headline)
                .fontWeight(.regular)
                .frame(width: 200)
                .multilineTextAlignment(.center)
                
            
            Image(tapped ? imageAfterTap : "whatIsDiabetesBeforeImage")
                .onTapGesture {
                    tapped = true
                }
            
            Text(tapped ? descriptionafter : "")
                .font(.headline)
                .fontWeight(.regular)
                .frame(width: 200)
                .multilineTextAlignment(.center)
        }
    }

}
