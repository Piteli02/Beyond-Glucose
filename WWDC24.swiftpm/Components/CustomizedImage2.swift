//
//  CustomizedImage2.swift
//  WWDC24
//
//  Created by Caio Gomes Piteli on 30/01/24.
//

import SwiftUI

struct CustomizedImage2: View {
    @Binding var imageData: ImageInfo
    @EnvironmentObject var controller: SecondInteractionController
    

    var body: some View {
        Image(imageData.isPressed ? imageData.nameAfterClick : imageData.nameBeforeClick)
            .shadow(color: imageData.isPressed ? Color("highlightColor"): .clear, radius: 0, x: 6, y: 6)
            
        
            .onTapGesture {
                imageData.isPressed.toggle()
                controller.checkPress(image: imageData)
            }
        
    }
}
