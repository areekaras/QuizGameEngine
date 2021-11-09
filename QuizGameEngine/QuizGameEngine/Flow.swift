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
}

class Flow {
    private let router: Router
    private var questions: [String]
    
    init(questions: [String], router: Router) {
        self.questions = questions
        self.router = router
    }
    
    func start() {
        if let firstQuestion = questions.first {
            router.routeTo(question: firstQuestion, answerCallback: routeNext(question: firstQuestion))
        }
    }
    
    private func routeNext(question: String) -> Router.AnswerCallback {
        return { [weak self] _ in
            guard let strongSelf = self else { return }
            
            if let currentQuestionIndex = strongSelf.questions.firstIndex(of: question) {
                if currentQuestionIndex + 1 < strongSelf.questions.count {
                    let nextQuestion = strongSelf.questions[currentQuestionIndex + 1]
                    strongSelf.router.routeTo(question: nextQuestion, answerCallback: strongSelf.routeNext(question: nextQuestion))
                }
            }
        }
    }
}
