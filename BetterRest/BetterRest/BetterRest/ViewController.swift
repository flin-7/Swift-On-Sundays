//
//  ViewController.swift
//  BetterRest
//
//  Created by Felix Lin on 5/3/20.
//  Copyright © 2020 Felix Lin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var wakeUpTime: UIDatePicker!
    var sleepAmountStepper: UIStepper!
    var sleepAmountLabel: UILabel!
    var coffeeAmoutStepper: UIStepper!
    var coffeeAmountLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        sleepAmountChanged()
        coffeeAmountChanged()
        title = "Better Rest"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Calculate", style: .plain, target: self, action: #selector(calculateBedtime))
    }

    override func loadView() {
        view = UIView()
        view.backgroundColor = .systemBackground
        
        let mainStackView = UIStackView()
        mainStackView.axis = .vertical
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20),
            mainStackView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor)
        ])
        
        let wakeUpTitle = UILabel()
        wakeUpTitle.font = UIFont.preferredFont(forTextStyle: .headline)
        wakeUpTitle.numberOfLines = 0
        wakeUpTitle.text = "When do you want to wake up?"
        mainStackView.addArrangedSubview(wakeUpTitle)
        
        wakeUpTime = UIDatePicker()
        wakeUpTime.datePickerMode = .time
        wakeUpTime.minuteInterval = 15
        mainStackView.addArrangedSubview(wakeUpTime)
        
        var components = Calendar.current.dateComponents([.hour, .minute], from: Date())
        components.hour = 8
        components.minute = 0
        wakeUpTime.date = Calendar.current.date(from: components) ?? Date()
        
        let sleepTitle = UILabel()
        sleepTitle.font = UIFont.preferredFont(forTextStyle: .headline)
        sleepTitle.numberOfLines = 0
        sleepTitle.text = "What's the minimum amout of sleep you need?"
        mainStackView.addArrangedSubview(sleepTitle)
        
        sleepAmountStepper = UIStepper()
        sleepAmountStepper.stepValue = 0.25
        sleepAmountStepper.value = 8
        sleepAmountStepper.minimumValue = 4
        sleepAmountStepper.maximumValue = 12
        sleepAmountStepper.addTarget(self, action: #selector(sleepAmountChanged), for: .valueChanged)
        
        sleepAmountLabel = UILabel()
        sleepAmountLabel.font = UIFont.preferredFont(forTextStyle: .body)
        
        let sleepStackView = UIStackView()
        sleepStackView.spacing = 20
        sleepStackView.addArrangedSubview(sleepAmountStepper)
        sleepStackView.addArrangedSubview(sleepAmountLabel)
        mainStackView.addArrangedSubview(sleepStackView)
        
        let coffeeTitle = UILabel()
        coffeeTitle.font = UIFont.preferredFont(forTextStyle: .headline)
        coffeeTitle.numberOfLines = 0
        coffeeTitle.text = "How much coffee do you drink each day?"
        mainStackView.addArrangedSubview(coffeeTitle)
        
        coffeeAmoutStepper = UIStepper()
        coffeeAmoutStepper.minimumValue = 1
        coffeeAmoutStepper.maximumValue = 20
        coffeeAmoutStepper.addTarget(self, action: #selector(coffeeAmountChanged), for: .valueChanged)
        
        coffeeAmountLabel = UILabel()
        coffeeAmountLabel.font = UIFont.preferredFont(forTextStyle: .body)
        
        let coffeeStackView = UIStackView()
        coffeeStackView.spacing = 20
        coffeeStackView.addArrangedSubview(coffeeAmoutStepper)
        coffeeStackView.addArrangedSubview(coffeeAmountLabel)
        mainStackView.addArrangedSubview(coffeeStackView)
        
        mainStackView.setCustomSpacing(10, after: sleepTitle)
        mainStackView.setCustomSpacing(20, after: sleepStackView)
        mainStackView.setCustomSpacing(10, after: coffeeTitle)
    }
    
    @objc func sleepAmountChanged() {
        sleepAmountLabel.text = String(format: "%g hours", sleepAmountStepper.value)
    }
    
    @objc func coffeeAmountChanged() {
        if coffeeAmoutStepper.value == 1 {
            coffeeAmountLabel.text = "1 cup"
        } else {
            coffeeAmountLabel.text = "\(Int(coffeeAmoutStepper.value)) cups"
        }
    }
    
    @objc func calculateBedtime() {
        let model = SleepCalculator()
        let title: String
        let message: String
        
        do {
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUpTime.date)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(coffee: coffeeAmoutStepper.value, estimatedSleep: sleepAmountStepper.value, wake: Double(hour + minute))
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            let wakeDate = wakeUpTime.date - prediction.actualSleep
            message = formatter.string(from: wakeDate)
            title = "Your ideal bedtime is..."
        } catch {
            title = "Error"
            message = "Sorry, there was a problem calculating your bedtime."
        }
        
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
}

