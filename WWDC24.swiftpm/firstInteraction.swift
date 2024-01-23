//
//  firstInteraction.swift
//  WWDC24
//
//  Created by Caio Gomes Piteli on 23/01/24.
//

import SwiftUI

struct firstInteraction: View {
    @EnvironmentObject var router: router
    
    @State private var finalImageOffset: CGSize = .zero
    @State private var imageOffset: CGSize = .zero
    @State private var lanceta = "lancet"
    
    
    var body: some View {
        
        // MARK: - Image being draggable
        VStack {
            Spacer()
            HStack {
                Image(lanceta)
                    .shadow(radius: 2)
                    .offset(imageOffset)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                imageOffset = CGSize(width: finalImageOffset.width + value.translation.width,
                                                     height: finalImageOffset.height + value.translation.height)
                            }
                            .onEnded { value in
                                finalImageOffset = imageOffset
                            }
                    )
                // Animation for tapping on the object
                    .onTapGesture {
                        if lanceta == "lancetpressed"{
                            lanceta = "lancet"
                        }else{
                            lanceta = "lancetpressed"
                        }
                        
                    }
                
            }
        }
        //MARK: - Finish draggable image
    }
    
}
