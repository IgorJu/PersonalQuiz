//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 06.04.2023.
//

import UIKit

final class ResultViewController: UIViewController {
    
    @IBOutlet var definitionLabel: UILabel!
    @IBOutlet var emojiLabel: UILabel!
    @IBOutlet var animalLabel: UILabel!
    
    var choosenAnswers: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.items?.remove(at: 0)
        defineFrequentAnimal()
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    deinit {
        print("\(type(of: self)) has been deallocated")
    }
    
    private func updateLabels(with animal: Animal) {
        definitionLabel.text = animal.definition
        animalLabel.text = "Вы - \(animal.typeOfAnimal)"
        emojiLabel.text = "Вы - \(animal.rawValue)"
    }
    
    private func defineFrequentAnimal() {
        
        var animalCounterDict: [Animal: Int] = [:]
        
        for answer in choosenAnswers {
            animalCounterDict[answer.animal] = (animalCounterDict[answer.animal] ?? 0) + 1
        }
        
        let sortedAnimals = animalCounterDict.sorted { $0.value > $1.value }
        guard let oftenMeetingAnimal = sortedAnimals.first?.key else { return }
        
        updateLabels(with: oftenMeetingAnimal)
    }
}


    

