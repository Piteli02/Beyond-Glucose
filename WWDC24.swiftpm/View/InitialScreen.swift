import SwiftUI

struct initialScreen: View {
    @EnvironmentObject var router: router
    
    var body: some View {
        NavigationStack(path: $router.path){
            ZStack{
                Background()
            NavigationLink(value: "Start"){
                
                Text("Start")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.red)
                    .cornerRadius(20)
                
            }.navigationDestination(for: String.self){ value in
                switch value{
                case "Start":
                    FirstStorytellingView()
                case "WhatIsDiabetes":
                    WhatIsDiabetes()
                case "News":
                    News()
                case "DiabetesEssential":
                    DiabetesEssential()
                case "FirstInteraction":
                    FirstInteraction()
                        .environmentObject(FirstInteractionController())
                case "SecondInteraction":
                    SecondInteraction()
                        .environmentObject(SecondInteractionController())
                case "Hipoglicemia":
                    Hipoglicemia(router: router)
                default:
                    Text("ERRO") //CORRIGIR CASO DE ALGUM ERRO QUE NÃO VÁ PARA TELA CORRETA
                }
            }
        }
        }
        
    }
}
