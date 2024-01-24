//
//  ImagesInfo.swift
//  WWDC24
//
//  Created by Caio Gomes Piteli on 24/01/24.
//

import Foundation
import SwiftUI

struct ImageInfo: Identifiable {
    let id = UUID()
    let nameBeforeClick: String
    let nameAfterClick: String
    var isPressed: Bool = false
}
