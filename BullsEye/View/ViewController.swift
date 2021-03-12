//
//  ViewController.swift
//  BullsEye
//
//  Created by savvycom2021 on 3/12/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var roundLbl: UILabel!
    @IBOutlet weak var scoreLbl: UILabel!
    @IBOutlet weak var targetLbl: UILabel!
    @IBOutlet weak var slider: UISlider!
    var currentValue: Int = 0
    var targetValue = 0
    var score = 0
    var round = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        startNewRound()
        startNewGame()
    }

    func startNewRound(){
        round += 1
        targetValue = Int.random(in: 0...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
        
    }

    @IBAction func showAlert(_ sender: Any) {
//        var difference: Int
//        if currentValue > targetValue{
//            difference = currentValue - targetValue
//        }else if targetValue > currentValue{
//            difference = targetValue - currentValue
//        }else{
//            difference = 0
//        }
        
//         var difference = currentValue - targetValue
//         if difference < 0 {
//            difference = difference * -1
//         }
        // abs() đảm báo số luông dương
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
        
        let title: String
        if difference == 0 {
            title = "Mầy làm tốt lắm!!!"
            points += 100
        }else if difference < 5 {
            title = "Cũng được"
            if difference == 1{
                points += 50
            }
        }else if difference < 10 {
            title = "Gà vcl =)))"
        }else {
            title = "Toang rồi !!!"
        }
       
        
        
//        let mes = "Slider đang ở \(currentValue)" +
//            "\nMục đích của mày là \(targetValue) điểm" +
//            "\nKhoảng cách là \(difference) điểm "
        score += points
        let mes = "Điểm của mầy là \(points)"
        
        // show mess when click action
        let alert = UIAlertController(title: title, message: mes, preferredStyle: .alert)
        // name of action
        let action = UIAlertAction(title: "Okeee", style: .default, handler: {
                                    _ in self.startNewRound()})
        // add action
        alert.addAction(action)
        // run action
        present(alert, animated: true, completion: nil)
    }
    
    
    func updateLabels(){
        targetLbl.text = "\(targetValue)"
        scoreLbl.text = "\(score)"
        roundLbl.text = "\(round)"
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
    }
    
    @IBAction func startNewGame(){
        score = 0
        round = 0
        startNewRound()
    }
    @IBAction func startOver() {
     startNewGame()
    }
    
}

