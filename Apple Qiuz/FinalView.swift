//  FinalView.swift
//  Apple Qiuz
//
//  Created by Aleksej Shapran on 04.04.23

import SwiftUI

struct FinalView : View {
    
    var score : Int
    
    let colors = [Color(.cyan), Color(.systemBlue.withAlphaComponent(0.5)), Color(.systemTeal.withAlphaComponent(0.3)),Color(.systemGray6.withAlphaComponent(0.4)), Color(.white)]
    
    @State var start = UnitPoint(x: 0, y: -2)
    @State var end = UnitPoint(x: 3, y: 1)
    
    var body: some View {
        
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: colors), startPoint: start, endPoint: end)
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center, spacing: 2) {
                
                Text("Your score: \(score)")
                    .lineSpacing(20)
                    .font(.title)
                    .padding(.horizontal, 20)
                Text("I hope you enjoyed remembering the history of the company!")
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
                Text(" Have a nice day!")
                    .font(.title)
                    .padding(.horizontal, 20)
                    
                    NavigationLink(destination: QuizContent()) {
                        Text("Try again")
                            .bold()
                            .frame(width: 300, height: 80)
                            .foregroundColor(.white)
                            .background(.blue.gradient)
                            .cornerRadius(35)
                    }
                    .padding(50)
            }
            
        }
    }
    
}
