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
        .init(nameBeforeClick: "cotton", nameAfterClick: "cotton"),
        .init(nameBeforeClick: "monitorOff", nameAfterClick: "monitorOn"),
        .init(nameBeforeClick: "glucoseStrip", nameAfterClick: "glucoseStrip"),
        .init(nameBeforeClick: "closedLancet", nameAfterClick: "openLancet"),
        .init(nameBeforeClick: "hand", nameAfterClick: "hand"),
    ]
        
    @Published var interactionStage: InteractionStage = .stage0
    @Published var pressedImages = 0
    @Published var presentErrorView = false
    @Published var continueToNextScreen = false
    @Published var activateSuccessSound = false
    @Published var errorsInARow = 0
    
    func checkPress(image: ImageInfo) -> Void{
        
        checkcountPressed(image: image)
        countPressed()
        
        if pressedImages >= 2{
            if interactionStage == .stage0{
                validatePress(image1: 5, image2: 0, imageToChange: "cleanHand")
                
            } else if interactionStage == .stage1{
                validatePress(image1: 2, image2: 3, imageToChange: "monitorStrip")
                
            } else if interactionStage == .stage2{
                validatePress(image1: 5, image2: 4, imageToChange: "bloodHand")
                
            }else if interactionStage == .stage3{
                if images[5].isPressed == true && images[2].isPressed == true{
                    
                    images[2].nameAfterClick = "monitorWithNumber"
                    images[2].nameBeforeClick = "monitorWithNumber"
                    
                    activateSuccessSound = true
                    errorsInARow = 0
                    resetPressed()
                    interactionStage = InteractionStage(rawValue: interactionStage.rawValue + 1) ?? .stage5
                    let generator = UINotificationFeedbackGenerator()
                    generator.notificationOccurred(.success)
                }else {
                    // MANDAR MENSAGEM PADRÃO DO ERRO DE ACORDO COM O ESTÁGIO E LIMPAR SELEÇÃO
                    print("Mandar mensagem de erro")
                    presentErrorView = true
                    errorsInARow = errorsInARow + 1
                    let generator = UINotificationFeedbackGenerator()
                    generator.notificationOccurred(.error)
                    resetPressed()
                }
                
            }else if interactionStage == .stage4{
                validatePress(image1: 5, image2: 1, imageToChange: "cleanHand")
            }
        }
        if interactionStage == .stage5{
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

        while i <=  5{
            images[i].isPressed = false
            i = i + 1
        }
        
        pressedImages = 0
    }
    
    func validatePress(image1: Int, image2: Int, imageToChange: String) -> Void{
        if images[image1].isPressed == true && images[image2].isPressed == true{
            
            images[image2].nameAfterClick = ""
            images[image2].nameBeforeClick = "" //find a better way to do this, so than Xcode won't complain the asset is missing
            
            images[image1].nameAfterClick = imageToChange
            images[image1].nameBeforeClick = imageToChange
            
            activateSuccessSound = true
            resetPressed()
            errorsInARow = 0
            interactionStage = InteractionStage(rawValue: interactionStage.rawValue + 1) ?? .stage5
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.success)
            
        }else {
            presentErrorView = true
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.error)
            resetPressed()
            errorsInARow = errorsInARow + 1

        }
    }
    
    func checkcountPressed(image: ImageInfo) -> Void{
        if image.isPressed == false{
            pressedImages = pressedImages - 1
        }
        
    }
    
}

