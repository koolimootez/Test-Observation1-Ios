//
//  SplashScreen.swift
//  Test-Observation1-Ios
//
//  Created by KOOLI MOOTEZ on 14/01/2025.
//

import SwiftUI

struct SplashScreen: View {
    var body: some View {
        
        ZStack{
            LinearGradient(
                gradient:Gradient(colors: [Color.blue.opacity(0.3),Color.purple.opacity(0.2)]),
                startPoint: .top,
                endPoint: .bottom
            ).ignoresSafeArea()
            VStack(spacing:100){
                Text("Comment vas-tu aujord'hui ?")
                    .font(.title)
                    .fontWeight(.regular)
                    .foregroundColor(.black)
                
                HStack(spacing:30){
                    VStack{
                        Image(systemName: "face.smiling.inverse")
                            .resizable()
                            .frame(width: 50,height: 50)
                            .foregroundColor(.green)
                        Text("Super")
                            .foregroundColor(.black)
                    }
                    VStack{
                        Image(systemName: "face.smiling.inverse")
                            .resizable()
                            .frame(width: 50,height: 50)
                            .foregroundColor(.green.opacity(0.7))
                        Text("Bien")
                            .foregroundColor(.black)
                    }
                    VStack{
                        Image(systemName: "face.smiling.inverse")
                            .resizable()
                            .frame(width: 50,height: 50)
                            .foregroundColor(.yellow)
                        Text("Neutre")
                            .foregroundColor(.black)
                        
                        
                    }
                    VStack{
                        Image(systemName: "face.smiling.inverse")
                            .resizable()
                            .frame(width: 50,height: 50)
                            .foregroundColor(.orange)
                        Text("Mauvais")
                            .foregroundColor(.black)
                            .preferredColorScheme(.light)
                    }
                    VStack{
                        Image(systemName: "face.smiling.inverse")
                            .resizable()
                            .frame(width: 50,height: 50)
                            .foregroundColor(.red)
                        Text("Horrible")
                            .foregroundColor(.black)
                    }
                    
                }
            }
            .padding()
        }
    }
    
}

#Preview {
    SplashScreen()
}
