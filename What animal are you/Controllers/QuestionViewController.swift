//
//  QuestionViewController.swift
//  What animal are you
//
//  Created by Магомед on 15.12.2018.
//  Copyright © 2018 Vokhstag. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet var singleButtons: [UIButton]!
    
    
    @IBOutlet weak var multiplayStackView: UIStackView!
    @IBOutlet var multiplayLabel: [UIStackView]!
    @IBOutlet var multiplayLabels: [UILabel]!
    
    
    
    @IBOutlet weak var rangedStackView: UIStackView!
    @IBOutlet var rangetLabel: [UILabel]!
    @IBOutlet weak var rangedButton: UIButton!
    
    
    @IBOutlet weak var questionLabel: UILabel!
    
    
    @IBOutlet weak var progressView: UIProgressView!
    
    //MARK: - пользовательские переменные
    var questions: [Question] = [
        Question(question: "Что вы предпочитаете?", type: .single, answers: [
            Answer(text: "Мясо", animal: .dog),
            Answer(text: "Рыбу", animal: .cat),
            Answer(text: "Морковку", animal: .rabbit),
            Answer(text: "Капусту", animal: .turtle),
            ]),
        Question(question: "Какие виды деятельности любите?", type: .multiple, answers: [
            Answer(text: "Плавать", animal: .turtle),
            Answer(text: "Спать", animal: .cat),
            Answer(text: "Прыгать", animal: .rabbit),
            Answer(text: "Грызть тапки", animal: .dog),
            ]),
        Question(question: "Как вы относитесь к поездкам?", type: .ranged, answers: [
            Answer(text: "Ненавижу", animal: .cat),
            Answer(text: "Они меня нервируют", animal: .rabbit),
            Answer(text: "На замечаю", animal: .turtle),
            Answer(text: "Обожаю", animal: .dog),
            ]),
        ]
    
    var questionIndex = 0
    
    var answersChosen = [Answer]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI ()

    }
    
    //MARK: - пользовательские функции
    func updateUI () {
        singleStackView.isHidden = true
        multiplayStackView.isHidden = true
        rangedStackView.isHidden = true
        
        navigationItem.title = " Вопрос №\(questionIndex + 1)"
        
        let question = questions[questionIndex]
        questionLabel.text = question.question
        
        let progress = Float(questionIndex)/Float(questions.count)
        progressView.progress = progress
        
        switch question.type {
        case .single:
            updateSingleStack ()
        case .multiple:
            updateMultiplayStack()
        case .ranged:
            updateRangedStack()
        }
    }
    func updateSingleStack () {
        singleStackView.isHidden = false
        let answers = questions[questionIndex].answers
        for index in 0..<singleButtons.count {
            singleButtons[index].setTitle(answers[index].text, for: .normal)
        }
    }
    
    func updateMultiplayStack () {
        multiplayStackView.isHidden = false
        let answers = questions[questionIndex].answers
        for index in 0..<multiplayLabel.count {
            multiplayLabels[index].text = answers[index].text
        }
    }
    
    func updateRangedStack () {
        rangedStackView.isHidden = false
        let answers = questions[questionIndex].answers
        rangetLabel.first?.text = answers.first?.text
        rangetLabel.last?.text = answers.last?.text
    }
    
    func nextQuestion () {
      //  if questionIndex < questions.count {
        questionIndex += 1
        updateUI()
      //  }
    }
    // MARK: -@IBAction
    
    @IBAction func singleButtonPressed(_ sender: UIButton) {
        let answers = questions[questionIndex].answers
        let index = singleButtons.index(of: sender)
        answersChosen.append(answers[index!])
        nextQuestion()
    }
    
    @IBAction func multiplayButtonPressed(_ sender: UIButton) {
        let answers = questions[questionIndex].answers
        
        for index in 0..<min(multiplayLabels.count, answers.count) {
            let stackView = multiplayLabel[index].superview!
            let multiplaySwitch = stackView.subviews.last as! UISwitch
            if multiplaySwitch.isOn {
                answersChosen.append(answers[index])
            }
        }
        nextQuestion()
    }
    
    @IBAction func RangedButtonPressed(_ sender: UIButton) {
        let answers = questions[questionIndex].answers
        rangetLabel.first?.text = answers.first?.text
        rangetLabel.last?.text = answers.last?.text
        nextQuestion()
    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        

    }

}
