import SwiftUI
import UIKit

struct FinalScreen: View {
    @EnvironmentObject var router: router
    
    var body: some View {
        
        ZStack{
            //MARK: - Background
            Color("coverBackgroundColor")
                .ignoresSafeArea()
            
            Image("coverPattern")
                .resizable()
                .scaledToFill()
                .opacity(0.8)
                .blendMode(.multiply)
                .ignoresSafeArea()
            
            
            GeometryReader{ geometry in
                
                let width = geometry.size.width
                let height = geometry.size.height
                
                HStack{
                    
                    Spacer()
                    //MARK: - Buttons and title
                    VStack{
                        ZStack{
                            Image("coverTitleRectangle")
                                .resizable()
                                .frame(width: width/2, height: height/3.5)
                            
                            Text("Thanks for the\n attention")
                                .font(Font.custom("JustMeAgainDownHere", size: 75))
                                .foregroundColor(.black)
                                .multilineTextAlignment(.center)
                        }
                        
                        Button {
                            router.resetViewStack()
                        } label: {
                            ZStack{
                                Image("coverButton")
                                    .resizable()
                                    .frame(width: width/3.2, height: height/13)
                                
                                Text("Restart")
                                    .font(Font.custom("JustMeAgainDownHere", size: 60))
                                    .foregroundColor(.black)
                                
                            }
                        }

                        NavigationLink(value: "Credits"){
                            
                            ZStack{
                                Image("coverButton")
                                    .resizable()
                                    .frame(width: width/3.2, height: height/13)
                                
                                Text("Credits")
                                    .font(Font.custom("JustMeAgainDownHere", size: 60))
                                    .foregroundColor(.black)
                                
                            }
                        }
                    }
                    
                    Spacer()
                    //Black Margin
                    Rectangle()
                        .frame(width: width/8, height: height)
                        .foregroundColor(Color("marginColor"))
                        .overlay(
                            Image("paperTexture")
                                .resizable()
                                .opacity(1)
                                .blendMode(.multiply)
                                .ignoresSafeArea()
                        )
                    
                    
                }
                
            }
        }
        
    }
}




