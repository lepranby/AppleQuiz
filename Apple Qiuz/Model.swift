//  Model.swift
//  Apple Qiuz
//
//  Created by Aleksej Shapran on 04.04.23

import Foundation


//structure of single quiz
struct QuizModel  {
    var text : String?
    var answer : [String]
    //specify what is the correct answer
    var correct : Int?
}

//NOTE : answer is an array , array start from 0, not from 1
   //if correct is the first answer , set --> correct = 0
   // if correct is the second answer , set --> correct = 1
   //...

//final quiz is an array of quizmodel
var quiz : [QuizModel] = [

    QuizModel(text: "What is the truth in the words of Steve Jobs about the name of Apple?", answer: ["It sounded fun, upbeat and scary","It would get us ahead of Atari in the phone book","There is nothing more beautiful than apples"], correct: 1),
    
    QuizModel(text: "Whose quote is this: “Woz designed a great machine, but it would be sitting in hobby shops today were it not for Steve Jobs.”?", answer: ["Rob Janoff","Regis McKenna","Tim Cook"], correct: 1),
    
    QuizModel(text: "App Store opening date as an iTunes update?", answer: ["July 10, 2008","July 11, 2008","January 24, 2009"],correct: 0),
    
    QuizModel(text: "One of the first Apple Computer employees responsible for marketing the Apple Macintosh computer in 1984 was…", answer: ["Bill Atkinson","Steve Wozniak","Guy Kawasaki"], correct: 2),
    
    QuizModel(text: "Ronald Wayne had a 10% share but sold it on April 12, 1976 for…", answer: ["$666,67","$700","$800"],correct: 2),
    
    QuizModel(text: "Steve Jobs met 21-year-old Steve Wozniak when he was…", answer: ["21 y.o.","19 y.o.","16 y.o."],correct: 2),
    
    QuizModel(text: "Apple II became the longest-running Apple computer. It could be purchased for…", answer: ["6 years","11 years","12 years"],correct: 1),
    
    QuizModel(text: "The first image on the Macintosh was a Disney character. Which one?", answer: ["Scrooge McDuck","Mickey Mouse","Baloo"],correct: 0),
    
    QuizModel(text: "How many elements from the periodic table are used in the production of the latest iPhones?", answer: ["71","75","78"],correct: 1),
    
    QuizModel(text: "What happens if, on a first generation iPod, you go to the About menu and hold down the center button for three seconds?", answer: ["I’ll receive detailed information.","I’ll see a picture of an apple.","I can play Breakout."],correct: 2)
    
]



func SaveScore(quiz : String , score : Int){
    UserDefaults.standard.set(score, forKey: quiz)
}

func LoadScore (quiz : String) -> Int{
    return UserDefaults.standard.integer(forKey: quiz)
}
