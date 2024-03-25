//
//  ViewController.swift
//  Counter
//
//  Created by Demain Petropavlov on 24.03.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak private var counterLabel: UILabel!
    
    @IBOutlet weak private var counterButton: UIButton!
    
    @IBOutlet weak private var refreshButton: UIButton!
    
    @IBOutlet weak private var counterMinusButton: UIButton!
    
    @IBOutlet weak private var historyTextView: UITextView!
    
    private var counter: Int = 0
    private var history = "История изменений:\n"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        historyTextView.text = history
        historyTextView.isEditable = false
        historyTextView.isScrollEnabled = true
    }
    
    private func changeLabel() {
        counterLabel.text = "Значение счетчика: \(counter)"
    }
    
    private func changeHistoryLabel(_ action: String) {
            let currentDate = Date()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
            let dateString = dateFormatter.string(from: currentDate)
            history += "\(dateString): \(action)\n"
            historyTextView.text = history
        }
    
    
    @IBAction private func plusOne(_ sender: Any) {
        counter += 1
        changeLabel()
        changeHistoryLabel("Значение изменено на +1")
    }
    
    @IBAction private func minusOne(_ sender: Any) {
        if counter > 0 {
            counter -= 1
            changeLabel()
            changeHistoryLabel("Значение изменено на -1")
        } else {
            changeHistoryLabel("Попытка уменьшить значение счетчика ниже 0")
        }
        
    }
    
    @IBAction private func refreshAll(_ sender: Any) {
        counter = 0
        changeLabel()
        changeHistoryLabel("Значение сброшено")
    }
}

