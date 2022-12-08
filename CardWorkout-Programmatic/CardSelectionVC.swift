//
//  CardSelectionVC.swift
//  CardWorkout-Programmatic
//
//  Created by Aaditya Singh on 08/12/22.
//

import UIKit

class CardSelectionVC: UIViewController {
    
    let cardImageView  = UIImageView()
    let stopButton = CWButton(backgroundColor: .systemRed, title: "Stop")
    let retryButton = CWButton(backgroundColor: .systemGreen, title: "Retry")
    let rulesButton = CWButton(backgroundColor: .systemBlue, title: "Rules")
    var timer: Timer!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configure()
        timerGoesOff()
    }
    
    @objc func selectsRandomCard() {
        cardImageView.image = Deck.cardsArray.randomElement() ?? UIImage(named: "AS")
    }
    
    func timerGoesOff() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(selectsRandomCard), userInfo: nil, repeats: true)
    }
    
    func configure() {
        configureCardImageView()
        configureStopButton()
        configureRetryButton()
        configureRulesButton()
    }
    
    func configureCardImageView() {
        view.addSubview(cardImageView)
        cardImageView.translatesAutoresizingMaskIntoConstraints = false
        cardImageView.image = UIImage(named: "AS")
        NSLayoutConstraint.activate([
            cardImageView.widthAnchor.constraint(equalToConstant: 250),
            cardImageView.heightAnchor.constraint(equalToConstant: 350),
            cardImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -75)
            

        ])
    }
    
    
    func configureStopButton() {
       view.addSubview(stopButton)
        stopButton.addTarget(self, action: #selector(stopTimer), for: .touchUpInside)

        NSLayoutConstraint.activate([
            stopButton.widthAnchor.constraint(equalToConstant: 260),
            stopButton.heightAnchor.constraint(equalToConstant: 50),
            stopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stopButton.topAnchor.constraint(equalTo: cardImageView.bottomAnchor, constant: 30)
        ])
    }
    
    func configureRetryButton() {
        view.addSubview(retryButton)
        retryButton.addTarget(self, action: #selector(restartTimer), for: .touchUpInside)

        NSLayoutConstraint.activate([
            retryButton.widthAnchor.constraint(equalToConstant: 115),
            retryButton.heightAnchor.constraint(equalToConstant: 50),
            retryButton.leadingAnchor.constraint(equalTo: stopButton.leadingAnchor),
            retryButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20)
            
            
        ])
    }
    
    
    func configureRulesButton() {
        view.addSubview(rulesButton)
        rulesButton.addTarget(self, action: #selector(presentRulesVC), for: .touchUpInside)
        NSLayoutConstraint.activate([
            rulesButton.widthAnchor.constraint(equalToConstant: 115),
            rulesButton.heightAnchor.constraint(equalToConstant: 50),
            rulesButton.trailingAnchor.constraint(equalTo: stopButton.trailingAnchor),
            rulesButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20)

        ])
    }
    
    @objc func presentRulesVC() {
        present(RulesVC(), animated: true)
        
    }
    
    @objc func restartTimer() {
        timer.invalidate()
        timerGoesOff()
        
    }
    
    @objc func stopTimer() {
        timer.invalidate()
       
        
    }

}
