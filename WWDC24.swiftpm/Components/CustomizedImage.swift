//
//  customizedImage.swift
//  WWDC24
//
//  Created by Caio Gomes Piteli on 23/01/24.
//

import SwiftUI

struct CustomizedImage: View {
    @Binding var imageData: ImageInfo
    @ObservedObject var controller: FirstInteractionController
    

    var body: some View {
        Image(imageData.isPressed ? imageData.nameAfterClick : imageData.nameBeforeClick)
            .shadow(color: imageData.isPressed ? .red : .clear,  radius: 130)
        
            .onTapGesture {
                //imageData.isPressed.toggle()
                controller.checkPress()
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
