//
//  SecondInteractionController.swift
//  WWDC24
//
//  Created by Caio Gomes Piteli on 30/01/24.
//

import Foundation
//
//  CheckFirstInteractions.swift
//  WWDC24
//
//  Created by Caio Gomes Piteli on 23/01/24.
//

import Foundation
import SwiftUI

class SecondInteractionController: ObservableObject{
    
    @Published var images: [ImageInfo] = [
        .init(nameBeforeClick: "handSanitizer", nameAfterClick: "openHandSanitizer"),
        .init(nameBeforeClick: "cotton", nameAfterClick: "cotton"),
        .init(nameBeforeClick: "arm", nameAfterClick: "arm"),
        .init(nameBeforeClick: "seringe", nameAfterClick: "seringe"),
        .init(nameBeforeClick: "insulin", nameAfterClick: "insulin"),
    ]
    
    @Published var interactionStage: InteractionStage2 = .stage0
    @Published var pressedImages = 0
    @Published var presentErrorView = false
    @Published var continueToNextScreen = false
    
    func checkPress(image: ImageInfo) -> Void{
        
        checkcountPressed(image: image)
        countPressed()
        
        if pressedImages >= 2{
            if interactionStage == .stage0{
                validatePress(image1: 1, image2: 0, imageToChange: "wetCotton")
                
            } else if interactionStage == .stage1{
                if images[1].isPressed == true && images[2].isPressed == true{
                    
                    
                    images[2].nameAfterClick = "cleanArm"
                    images[2].nameBeforeClick = "cleanArm"
                    
                    resetPressed()
                    interactionStage = InteractionStage2(rawValue: interactionStage.rawValue + 1) ?? .stage4
                    let generator = UINotificationFeedbackGenerator()
                    generator.notificationOccurred(.success)
                    
                }else {
                    let generator = UINotificationFeedbackGenerator()
                    generator.notificationOccurred(.error)
                    presentErrorView = true
                    resetPressed()
                }
                
            } else if interactionStage == .stage2{
                validatePress(image1: 4, image2: 1, imageToChange: "cleanInsulin")
                
            }else if interactionStage == .stage3{
                validatePress(image1: 3, image2: 4, imageToChange: "fullSeringe")
            }
            else if interactionStage == .stage4{
                if images[3].isPressed == true && images[2].isPressed == true{
                    
                    images[3].nameAfterClick = "seringe"
                    images[3].nameBeforeClick = "seringe"
                    
                    resetPressed()
                    interactionStage = InteractionStage2(rawValue: interactionStage.rawValue + 1) ?? .stage4
                    let generator = UINotificationFeedbackGenerator()
                    generator.notificationOccurred(.success)
                    
                }else {
                    let generator = UINotificationFeedbackGenerator()
                    generator.notificationOccurred(.error)
                    presentErrorView = true
                    resetPressed()
                }
            }
            
            if interactionStage == .stage5 {
                continueToNextScreen = true
            }
            
        }
        
        func countPressed() -> Void{
            for i in images {
                if i.isPressed == true{
                    pressedImages = pressedImages + 1
                }
            }
            
        }
        
        func resetPressed() -> Void{
            var i = 0
            
            while i <=  4{
                images[i].isPressed = false
                i = i + 1
            }
            
            pressedImages = 0
        }
        
        func validatePress(image1: Int, image2: Int, imageToChange: String) -> Void{
            if images[image1].isPressed == true && images[image2].isPressed == true{
                
                images[image2].nameAfterClick = ""
                images[image2].nameBeforeClick = "" //arrumar um jeito de deixar isso melhor, para o xcode não reclamar que não achou o asset
                
                images[image1].nameAfterClick = imageToChange
                images[image1].nameBeforeClick = imageToChange
                
                resetPressed()
                interactionStage = InteractionStage2(rawValue: interactionStage.rawValue + 1) ?? .stage5
                let generator = UINotificationFeedbackGenerator()
                generator.notificationOccurred(.success)
                
            }else {
                presentErrorView = true
                let generator = UINotificationFeedbackGenerator()
                generator.notificationOccurred(.error)
                resetPressed()
            }
        }
        
        func checkcountPressed(image: ImageInfo) -> Void{
            if image.isPressed == false{
                pressedImages = pressedImages - 1
            }
            
        }
        
    }
    
}
