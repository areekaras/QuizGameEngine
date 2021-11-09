//
//  Flow.swift
//  QuizGameEngine
//
//  Created by Shibili Areekara on 06/11/21.
//

import Foundation

protocol Router {
    typealias AnswerCallback = (String) -> Void
    func routeTo(question:String, answerCallback: @escaping AnswerCallback)
    func routeTo(result: [String: String])
}

class Flow {
    private let router: Router
    private var questions: [String]
    
    private var result: [String: String] = [:]
    
    init(questions: [String], router: Router) {
        self.questions = questions
        self.router = router
    }
    
    func start() {
        if let firstQuestion = questions.first {
            router.routeTo(question: firstQuestion, answerCallback: routeNext(question: firstQuestion))
        } else {
            router.routeTo(result: result)
        }
    }
    
    private func routeNext(question: String) -> Router.AnswerCallback {
        return { [weak self] answer in
            guard let strongSelf = self else { return }
            
            if let currentQuestionIndex = strongSelf.questions.firstIndex(of: question) {
                strongSelf.result[question] = answer
                
                if currentQuestionIndex + 1 < strongSelf.questions.count {
                    let nextQuestion = strongSelf.questions[currentQuestionIndex + 1]
                    strongSelf.router.routeTo(question: nextQuestion, answerCallback: strongSelf.routeNext(question: nextQuestion))
                } else {
                    strongSelf.router.routeTo(result: strongSelf.result)
                }
            }
        }
    }
}
