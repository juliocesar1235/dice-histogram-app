//
//  ViewController.swift
//  MiniReto1
//
//  Created by Julio Gutierrez Briones on 9/6/20.
//  Copyright © 2020 Julio César Gutiérrez Briones. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UIViewController {
    
    @IBOutlet weak var dice1: UIImageView!
    @IBOutlet weak var dice2: UIImageView!
    
    @IBOutlet var counters: [UILabel]!
    @IBOutlet var pbars: [UIProgressView]!
    
    
    var diceFace1 = 0
    var diceFace2 = 0
    var counter = [0,0,0,0,0,0,0,0,0,0,0]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func rollDices(_ sender: UIButton) {
        diceFace1 = Int.random(in: 1...6)
        diceFace2 = Int.random(in: 1...6)
        dice1.image = UIImage(named: "dado"+String(diceFace1))
        dice2.image = UIImage(named: "dado"+String(diceFace2))
        histogram(diceFace1 + diceFace2)
        
    }
    
    func histogram(_ sum: Int){
        let index = sum - 2
        counter[index] += 1
        counters[index].text = String(counter[index])
        pbars[index].setProgress(Float(counter[index])/50, animated: true)
        if counter[index] == 1{
            let colorBar = randomColor()
            counters[index].textColor = colorBar
            pbars[index].progressTintColor = colorBar
        }
    }
    
    func randomColor() -> UIColor{
        let red = CGFloat(drand48())
        let green = CGFloat(drand48())
        let blue = CGFloat(drand48())
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }

}

