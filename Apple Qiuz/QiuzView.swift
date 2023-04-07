//  QiuzView.swift
//  Apple Qiuz
//
//  Created by Aleksej Shapran on 04.04.23

import SwiftUI

struct QuizContent : View {
    
    let colors = [Color(.systemBlue.withAlphaComponent(0.6)), Color(.systemTeal.withAlphaComponent(0.5)), Color(.systemGray6.withAlphaComponent(0.7)), Color(.white)]
    
    let timer = Timer.publish(every: 1, on: .main, in: .default).autoconnect()
    
    @State var start = UnitPoint(x: 0, y: -2)
    @State var end = UnitPoint(x: 3, y: 1)
    
    @State var counter : Int = 0
    @State var score = 0
    
    var body: some View {
        
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: colors), startPoint: start, endPoint: end)
                .edgesIgnoringSafeArea(.all)
                .animation(Animation.easeInOut(duration: 10).repeatForever(autoreverses: true).speed(1.2))
                .onReceive(timer, perform: { _ in
                    self.start = UnitPoint(x: 4, y: 1)
                    self.end = UnitPoint(x: 0, y: 2)
                    self.start = UnitPoint(x: -4, y: 20)
                    self.start = UnitPoint(x: 4, y: 0)
                })
            
            VStack(alignment: .center, spacing: 18) {
                
                if(self.counter < quiz.count) {
                    
                    Text(quiz[self.counter].text!)
                        .font(.title)
                        .fontWeight(.light)
                        .lineSpacing(3)
                        .multilineTextAlignment(.center)
                        .padding(.all, 20.0)
                    
                    // MARK: Answers
                    
                    Button(action: {self.buttonAction(answer: 0)}, label: {Text(quiz[self.counter].answer[0]).font(.system(size: 20)).frame(width: 362, height: 80).foregroundColor(.white).background(.blue.gradient).cornerRadius(18).padding(.all, 2)})
                    
                    Button(action: {self.buttonAction(answer: 1)} ,label: {Text(quiz[self.counter].answer[1]).font(.system(size: 20)).frame(width: 362, height: 80).foregroundColor(.white).background(.blue.gradient).cornerRadius(18).padding(.all, 2)})
                    
                    Button(action: {self.buttonAction(answer: 2)}, label: {Text(quiz[self.counter].answer[2]).font(.system(size: 20)).frame(width: 362, height: 80).foregroundColor(.white).background(.blue.gradient).cornerRadius(18).padding(.all, 2)})
                    
                }
                
                // after last question --> show final view with score
                
                else {
                    
                    FinalView(score : self.score)
                }
                
                NavigationLink(destination: ContentView()) {}
                    .navigationTitle("Think different")
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
    
    // MARK: action of the buttons | answer = answer array [0,1,2]
    
    func buttonAction( answer : Int) {
        
        // if answer is correct increment score
        
        if(quiz[self.counter].correct == answer){
            self.score = self.score + 1
        }
        
        // and we go to the new question
        
        self.counter = self.counter + 1
    }
    
    
}
