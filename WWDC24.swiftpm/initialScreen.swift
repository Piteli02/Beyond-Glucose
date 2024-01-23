import SwiftUI

struct initialScreen: View {
    @EnvironmentObject var router: router
    
    var body: some View {
        NavigationStack(path: $router.path){
            
            NavigationLink(value: "Interacao"){
                
                    Text("Ir para interação")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(20)
                
            }.navigationDestination(for: String.self){ value in
                switch value{
                case "Interacao":
                    firstInteraction()
                default:
                    Text("ERRO") //CORRIGIR CASO DE ALGUM ERRO QUE NÃO VÁ PARA TELA CORRETA
                }
            }
        }
        
    }
}
