//
//  File.swift
//  
//
//  Created by Caio Gomes Piteli on 31/01/24.
//

import Foundation
import SwiftUI

class DateControl: ObservableObject {
    let todaysDate = Date()
    let dateFormatter = DateFormatter()
    
   
    
    func formattedDate() -> String{
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let todaysFormatedDate = dateFormatter.string(from: todaysDate)
        return todaysFormatedDate
    }

}
