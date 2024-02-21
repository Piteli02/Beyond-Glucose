//
//  SwiftUIView.swift
//  
//
//  Created by Caio Gomes Piteli on 19/02/24.
//

import SwiftUI

struct FocusedNews: View {
    @Binding var activeView: Bool
    @State var image: String
    
    var body: some View {
        GeometryReader{ geometry in
        ZStack{
            Color.black.opacity(0.3).ignoresSafeArea()
            
            
            VStack(alignment: .leading){
                
                HStack{
                    Spacer()
                    if image == "news1"{
                        Image(image)
                            .resizable()
                            .frame(width: geometry.size.width / 1.2, height: geometry.size.height / 1.8)
                            .padding(.top, 50)
                    } else if image == "news2"{
                        Image(image)
                            .resizable()
                            .frame(width: geometry.size.width / 1.1, height: geometry.size.height / 2.1 )
                            .padding(.top, 50)
                    }else{
                        Image(image)
                            .resizable()
                            .frame(width: geometry.size.width / 1.2, height: geometry.size.height / 2.1)
                            .padding(.top, 50)
                    }
                    
                    Spacer()
                }
                .padding()
                
                HStack {
                    Spacer()
                    Button(action: {
                        activeView = false
                    }) {
                        Image("okButton")
                            .padding(.bottom, 20)
                    }
                    Spacer()
                }.padding(.bottom, 50)
                
            }.background(
                Rectangle()
                    .foregroundColor(Color("popUpColor"))
                    .cornerRadius(20)
                    .overlay(
                        Image("paperTexture")
                            .resizable()
                            .opacity(0.2)
                            .blendMode(.multiply)
                            .ignoresSafeArea()
                    )
                
            ).frame(maxWidth: UIScreen.main.bounds.width - 200)
        }
    }
    }
    
}
