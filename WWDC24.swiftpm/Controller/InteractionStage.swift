//
//  InteractionStage.swift
//  WWDC24
//
//  Created by Caio Gomes Piteli on 29/01/24.
//

import Foundation
import SwiftUI

enum InteractionStage: Int{
    case stage0 = 0
    case stage1 = 1
    case stage2 = 2
    case stage3 = 3
    case stage4 = 4
    case stage5 = 5
    
    var text: String {
        switch self {
        case .stage0:
          return "First of all, we need clean hands! Make sure they are clean before doing something else"
        case .stage1:
          return "Before doing anything else, the strip may be on the glucose reader, right?"
        case .stage2:
          return "The finger is ready to be poked!"
        case .stage3:
          return "Before cleaning the finger, we need to put the blood drop on the reader."
        case .stage4:
          return "Now, we just ned to clean the blood drop!"
        case .stage5:
          return "Congratulations! Now, we learned how to measure glucose levels of the blood!"
        }
      }
    
    }
