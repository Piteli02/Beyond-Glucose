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
          return "First of all, we need to be with our hands clean! Make sure they are clean before doing something else"
        case .stage1:
          return "estagio 1"
        case .stage2:
          return "estagio 2"
        case .stage3:
          return "estagio 3"
        case .stage4:
          return "estagio 4"
        case .stage5:
          return "estagio 5"
        }
      }
    
    }
