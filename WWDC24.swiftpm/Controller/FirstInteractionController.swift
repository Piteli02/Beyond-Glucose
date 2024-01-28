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
    
    @Published var interactionStage = 0
    @Published var pressedImages = 0
    
    func checkPress() -> Void{
        
        countPressed()
        
        if pressedImages >= 2{
            if interactionStage == 0{
                validatePress(image1: 5, image2: 0, imageToChange: "cleanHand")
                
            } else if interactionStage == 1{
                validatePress(image1: 2, image2: 3, imageToChange: "monitorStrip")
                
            } else if interactionStage == 2{
                validatePress(image1: 5, image2: 4, imageToChange: "bloodHand")
            }
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
            images[image2].nameBeforeClick = "" //arrumar um jeito de deixar isso melhor, para o xcode não reclamar que não achou o asset
            
            images[image1].nameAfterClick = imageToChange
            images[image1].nameBeforeClick = imageToChange
            
            resetPressed()
            interactionStage = interactionStage + 1
            
        }else {
            // MANDAR MENSAGEM PADRÃO DO PRIMEIRO ESTÁGIO CASO ERROU E LIMPAR SELEÇÃO
            print("Mandar mensagem de erro")
            resetPressed()
        }
    }
}

