//
//  FirstScreenVC.swift
//  ProjectPractice2
//
//  Created by WEMA on 17/12/2023.
//

import UIKit

class FirstScreenVC: UIViewController {
    
    @IBOutlet var buttonsArray: [UIButton]!
    @IBOutlet var cardImageView: UIImageView!
    var cards: [UIImage] = Cards.allCards
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startTimer()
        for buttons in buttonsArray{
            buttons.layer.cornerRadius = 8
        }
        //stopButton.layer.cornerRadius = 8
        //restartButton.layer.cornerRadius = 8
        //rulesButton.layer.cornerRadius = 8
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer.invalidate()
    }
    
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(randomCards), userInfo: nil, repeats: true)
    }
    
    @objc func randomCards(){
        cardImageView.image = cards.randomElement()
    }

    @IBAction func stopButtonAction(_ sender: UIButton) {
        timer.invalidate()
    }
    
    @IBAction func restartButtonAction(_ sender: UIButton) {
        timer.invalidate()
        startTimer()
    }
}
