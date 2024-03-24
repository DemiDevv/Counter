//
//  ViewController.swift
//  Counter
//
//  Created by Demain Petropavlov on 24.03.2024.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var counterLabel: UILabel!
    
    @IBOutlet weak var counterButton: UIButton!
    
    @IBOutlet weak var refreshButton: UIButton!
    
    @IBOutlet weak var counterMinusButton: UIButton!
    
    @IBOutlet weak var historyTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        historyTextView.text = history
        historyTextView.isEditable = false
        historyTextView.isScrollEnabled = true
    }

    func changeLabel() {
        counterLabel.text = "Значение счетчика: \(counter)"
    }
    func changeHistoryLabel(_ action: String) {
            let currentDate = Date()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
            let dateString = dateFormatter.string(from: currentDate)
            history += "\(dateString): \(action)\n"
            historyTextView.text = history
        }
    var counter: Int = 0
    var history = "История изменений:\n"

    
    @IBAction func plusOne(_ sender: Any) {
        counter += 1
        changeLabel()
        changeHistoryLabel("Значение изменено на +1")
    }
    
    @IBAction func minusOne(_ sender: Any) {
        if counter > 0 {
            counter -= 1
            changeLabel()
            changeHistoryLabel("Значение изменено на -1")
        } else {
            changeHistoryLabel("Попытка уменьшить значение счетчика ниже 0")
        }
        
    }
    
    @IBAction func refreshAll(_ sender: Any) {
        counter = 0
        changeLabel()
        changeHistoryLabel("Значение сброшено")
    }
}

