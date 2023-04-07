//  ContentView.swift
//  Apple Qiuz
//
//  Created by Aleksej Shapran on 04.04.23

import SwiftUI

struct ContentView: View {
    
    let colors = [Color(.cyan), Color(.systemBlue.withAlphaComponent(0.8)), Color(.systemTeal.withAlphaComponent(0.5)), Color(.white)]
    
    @State var start = UnitPoint(x: 0, y: -2)
    @State var end = UnitPoint(x: 3, y: 1)
    
    var body: some View {
    
        NavigationView {
            
            ZStack {
                
                LinearGradient(gradient: Gradient(colors: colors), startPoint: start, endPoint: end)
                            .edgesIgnoringSafeArea(.all)
    
                VStack(alignment: .leading, spacing: 5) {
                    
                    Text("""
Hello! I am inspired by the history of Apple, and I am crazy about the products that the company creates. I started learning the Swift programming language with great enthusiasm and I really hope that you will pass this little historical test with me.
""")
                    .fontWeight(.light)
                    .lineSpacing(4)
                    .multilineTextAlignment(.leading)
                    .font(.title)
                    .padding([.leading, .bottom, .trailing], 20)
                    
                    Text("Ready to history lesson?")
                        .font(.title)
                        .fontWeight(.regular)
                        .multilineTextAlignment(.leading)
                        .padding([.top, .bottom], 30.0)
                        .padding(.leading, 20)
                        
                        
                    
                    NavigationLink(destination: QuizContent()) {
                        Text("Sure")
                            .font(.title)
                            .fontWeight(.light)
                            .multilineTextAlignment(.center)
                            .padding(.all, 20.0)
                            .frame(width: 150, height: 70)
                            .foregroundColor(.white)
                            .background(.blue.gradient)
                            .cornerRadius(20)
                    }
                    .padding(.leading, 20.0)
                }
                .navigationBarTitle("Greeting",displayMode: .large)
            }
        }
    }
    
    struct Home_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
