//
//  customizedImage.swift
//  WWDC24
//
//  Created by Caio Gomes Piteli on 23/01/24.
//

import SwiftUI

struct CustomizedImage: View {
    @Binding var imageData: ImageInfo
    @EnvironmentObject var controller: FirstInteractionController
    
    
    var body: some View {
        Image(imageData.isPressed ? imageData.nameAfterClick : imageData.nameBeforeClick)
            .shadow(color: imageData.isPressed ? Color("highlightColor"): .clear, radius: 0, x: 6, y: 6)


        
            .onTapGesture {
                imageData.isPressed.toggle()
                controller.checkPress(image: imageData)
            }
        
    }
}






//MARK: - Making image draggable
//    @State private var finalImageOffset: CGSize = .zero
//    @State private var imageOffset: CGSize = .zero
//            .offset(imageOffset)
//            .gesture(
//                DragGesture()
//                    .onChanged { value in
//                        imageOffset = CGSize(width: finalImageOffset.width + value.translation.width,
//                                             height: finalImageOffset.height + value.translation.height)
//                    }
//                    .onEnded { value in
//                        finalImageOffset = imageOffset
//                    }
//            )
