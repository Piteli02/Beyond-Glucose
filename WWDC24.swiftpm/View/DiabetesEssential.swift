//
//  DiabetesEssential.swift
//  WWDC24
//
//  Created by Caio Gomes Piteli on 31/01/24.
//

import SwiftUI

struct DiabetesEssential: View {
    var body: some View {
        GeometryReader{ geometry in
            
        ZStack{
            
            Background()
            
            VStack{
                
                HStack{
                    
                    Text("   What is essential for a person with diabetes?")
                        .font(Font.custom("JustMeAgainDownHere", size: 48, relativeTo: .title))
                        .foregroundStyle(Color.black)

                    Spacer()
                    
                }
                
               VStack{
                
                    HStack{
                        Spacer()
                        Image("syringeLabel")
                            .resizable()
                            .frame(width: geometry.size.width/4.1, height: geometry.size.height/3.4)
                            .padding()
                        
                        Image("insulinLabel")
                            .frame(width: geometry.size.width/12.7, height: geometry.size.height/3.7)
                            .padding()

                        Image("handSanitizerLabel")
                            .padding(.leading, 60)
                            .frame(width: geometry.size.width/5.5, height: geometry.size.height/2.6)
                            .padding(.vertical, 20)

                        Image("monitorLabel")
                            .frame(width: geometry.size.width/3.8, height: geometry.size.height/3.2)
                            .padding()

                        Spacer()
                        
                    }
                   
                    HStack{
                        Spacer()
                        
                        Image("candyLabel")
                            .padding()
                            .offset(y: -20)
                            .frame(width: geometry.size.width/3.6, height: geometry.size.height/6.7)

                        Image("cottonLabel")
                            .padding()
                            .offset(y: 10)
                            .frame(width: geometry.size.width/8, height: geometry.size.height/5.4)

                        
                        Image("lancetLabel")
                            .padding()
                            .frame(width: geometry.size.width/5.8, height: geometry.size.height/4.8)

                        
                        Image("stripLabel")
                            .padding()
                            .offset(y: -15)
                            .frame(width: geometry.size.width/3.9, height: geometry.size.height/4.2)

                        Spacer()
                    }
                                
                   
               }.offset(y: -35)
                
                Spacer()
                
                NavigationLink(value: "FirstInteraction"){
                    
                    Image("continueButton")
                    
                }.padding(.bottom, 50)
                
                }
            }
        }
    }
}
