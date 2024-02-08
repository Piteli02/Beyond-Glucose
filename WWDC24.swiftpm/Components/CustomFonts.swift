//
//  customFonts.swift
//  WWDC24
//
//  Created by Caio Gomes Piteli on 08/02/24.
//

import Foundation
import SwiftUI

class customFonts: ObservableObject {
    
    init() {
        //Loading custom fonts on the app
        let cfURL = Bundle.main.url(forResource: "Delius-Regular", withExtension: "ttf")! as CFURL
        CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil)
        let cfURL2 = Bundle.main.url(forResource: "JustMeAgainDownHere-Regular", withExtension: "ttf")! as CFURL
        CTFontManagerRegisterFontsForURL(cfURL2, CTFontManagerScope.process, nil)
    }
    
    
}


