//
//  ViewController.swift
//  HW 4
//
//  Created by Наталья Миронова on 26.11.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var redLightLabel: UILabel!
    @IBOutlet var greenLightLabel: UILabel!
    @IBOutlet var blueLightLabel: UILabel!

    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redLightSlider: UISlider!
    @IBOutlet var greenLightSlider: UISlider!
    @IBOutlet var blueLightSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redLightLabel.text = String(format: "%.2f", redLightSlider.value)
        greenLightLabel.text = String(format: "%.2f", greenLightSlider.value)
        blueLightLabel.text = String(format: "%.2f",blueLightSlider.value)
    }
    
    func colorChange() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redLightSlider.value),
            green: CGFloat(greenLightSlider.value),
            blue: CGFloat(blueLightSlider.value),
            alpha: 1
        )
    }

    @IBAction func redLightSliderAction() {
        redLightLabel.text = String(format: "%.2f", redLightSlider.value)
        colorChange()
    }
    
    @IBAction func greenLightSliderAction() {
        greenLightLabel.text = String(format: "%.2f", greenLightSlider.value)
    }
    
    @IBAction func blueLightSliderAction() {
        blueLightLabel.text = String(format: "%.2f",blueLightSlider.value)
    }
}

