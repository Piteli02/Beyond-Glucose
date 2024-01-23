//
//  firstInteraction.swift
//  WWDC24
//
//  Created by Caio Gomes Piteli on 23/01/24.
//

import SwiftUI

struct firstInteraction: View {
    @EnvironmentObject var router: router
    
    @State var handSanitizerPressed = false
    
    var body: some View {
        
        VStack {
        
            HStack {
                customizedImage(imageBeforeClick: "handSanitizer", imageAfterClick: "openHandSanitizer", imageOn: "handSanitizer", pressed: $handSanitizerPressed)
                    .shadow(color: handSanitizerPressed ? .green : .clear, radius: 130)
            }
        }.background(Image("backgroundImage"))
    }
    
}
