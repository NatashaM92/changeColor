//
//  ViewController.swift
//  HW 4
//
//  Created by Наталья Миронова on 26.11.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    var mainColor: UIColor!
    var delegate: SettingsViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.backgroundColor = mainColor //передаем текущий цвет
        getColor() // передает текущий цвет в слайдеры
        
        // передает текущий цвет из слайдеров в лейблы (изначально)
        redLabel.text = String(format: "%.2f", redSlider.value)
        greenLabel.text = String(format: "%.2f", greenSlider.value)
        blueLabel.text = String(format: "%.2f",blueSlider.value)
        
        // передает текущий цвет из слайдеров в текстовые поля (изначально)
        redTextField.text = String(format: "%.2f", redSlider.value)
        greenTextField.text = String(format: "%.2f", greenSlider.value)
        blueTextField.text = String(format: "%.2f",blueSlider.value)
        
        //скругляем углы
        colorView.layer.cornerRadius = 10
        
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
    }
    
    //    скрытие клавиатуры после выхода из текстового поля
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        redTextField.endEditing(true)
        greenTextField.endEditing(true)
        blueTextField.endEditing(true)
    }
    
    // в зависимости от значения слайдера передаем значение в лейбл и текстовое поле и вызываем метод передачи цвета
    @IBAction func colorChangeSlider(_ sender: UISlider) {
        colorChange()
        switch sender {
        case redSlider:
            redLabel.text = String(format: "%.2f", redSlider.value)
            redTextField.text = String(format: "%.2f", redSlider.value)
        case greenSlider:
            greenLabel.text = String(format: "%.2f", greenSlider.value)
            greenTextField.text = String(format: "%.2f", greenSlider.value)
        default:
            blueLabel.text = String(format: "%.2f",blueSlider.value)
            blueTextField.text = String(format: "%.2f",blueSlider.value)
        }
    }
    
    //возврат по кнопке c захватом текущего цвета
    @IBAction func doneButtonPressed() {
        delegate.setNewColor(color: colorView.backgroundColor ?? .white)
        dismiss(animated: true)
    }
    
    // передает цвет в окошко в зависимости от постановки слайдеров
    private func colorChange() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
    private func getColor() {
        let ciColor = CIColor(color: mainColor)
        redSlider.value = Float(ciColor.red)
        greenSlider.value = Float(ciColor.green)
        blueSlider.value = Float(ciColor.blue)
    }
}

extension SettingsViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else { return }
        switch textField {
        case redTextField: redSlider.value = Float(text) ?? 0.0
            redLabel.text = String(format: "%.2f", redSlider.value)
        case greenTextField: greenSlider.value = Float(text) ?? 0.0
            greenLabel.text = String(format: "%.2f", greenSlider.value)
        default: blueSlider.value = Float(text) ?? 0.0
            blueLabel.text = String(format: "%.2f",blueSlider.value)
        }
        colorChange()
    }
}
