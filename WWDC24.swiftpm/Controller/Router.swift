//
//  router.swift
//  WWDC24
//
//  Created by Caio Gomes Piteli on 23/01/24.
//

import Foundation
import SwiftUI

class router: ObservableObject {
    @Published var path: [String]
    
    init() {
        self.path = []
    }
    
    
    func resetViewStack() {
        path = []
    }
    
    func navigateTo(_ appRoute: String) {
            path.append(appRoute)
        
        }
    
    
}

