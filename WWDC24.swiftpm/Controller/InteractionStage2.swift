//
//  InteractionStage2.swift
//  WWDC24
//
//  Created by Caio Gomes Piteli on 30/01/24.
//

import Foundation
import SwiftUI

enum InteractionStage2: Int{
    case stage0 = 0
    case stage1 = 1
    case stage2 = 2
    case stage3 = 3
    case stage4 = 4
    case stage5 = 5
    
    var text: String {
        switch self {
        case .stage0:
          return "First of all, arms, hands and insulin have to be higienized. Let's put some sanitizer on the cotton and use it later."
        case .stage1:
          return "Now lets higienize the arm!"
        case .stage2:
          return "What about higienizing the insulin bottle"
        case .stage3:
          return "The seringe is without insulin"
        case .stage4:
            return "Glucose levels have to be controlled, apply insulin on the arm!"
        case .stage5:
            return "Congratulations! Now, we learned how to measure glucose levels of the blood!"
         
        }
      }
    
    }
