//
//  CluesFirstInteraction.swift
//  WWDC24
//
//  Created by Caio Gomes Piteli on 30/01/24.
//

import SwiftUI

struct CluesFirstInteraction: View {
    @Binding var presentClues: Bool
    
    var body: some View {
        Text("TEste")
        
        Button(action: {
            presentClues = false
        }) {
            Text("OK")
        }
    }
}
