//
//  customizedImage.swift
//  WWDC24
//
//  Created by Caio Gomes Piteli on 23/01/24.
//

import SwiftUI

struct CustomizedImage: View {
    @State var imageBeforeClick: String
    @State var imageAfterClick: String
    @State var imageOn: String
    @Binding var pressed: Bool
    
//    @State private var finalImageOffset: CGSize = .zero
//    @State private var imageOffset: CGSize = .zero
    
    var body: some View {
        Image(imageOn)
        
        //Making it draggable
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
        
            // Animation for tapping on the object
            .onTapGesture {
                if imageOn == imageBeforeClick{
                    imageOn = imageAfterClick
                }else{
                    imageOn = imageBeforeClick
                }
                
                if pressed == true{
                    pressed = false
                }else{
                    pressed = true
                }
                
            }
    }
}
