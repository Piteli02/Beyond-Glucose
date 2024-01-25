//
//  CheckFirstInteractions.swift
//  WWDC24
//
//  Created by Caio Gomes Piteli on 23/01/24.
//

import Foundation
import SwiftUI

class FirstInteractionController: ObservableObject{
    @Published var images: [ImageInfo] = [
        .init(nameBeforeClick: "handSanitizer", nameAfterClick: "openHandSanitizer"),
        .init(nameBeforeClick: "cotton", nameAfterClick: "cotton")
    ]
    
    func checkPress() -> Void{
        images[0].isPressed.toggle()
    }
}
