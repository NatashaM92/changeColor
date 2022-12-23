//
//  MainViewController.swift
//  HW 4
//
//  Created by Наталья Миронова on 22.12.2022.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setNewColor(color: UIColor)
}

class MainViewController: UIViewController {
    
    @IBOutlet var mainView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.backgroundColor = .gray
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.mainColor = mainView.backgroundColor
        settingsVC.delegate = self
    }
}

extension MainViewController: SettingsViewControllerDelegate {
    func setNewColor(color: UIColor) {
        mainView.backgroundColor = color
    }
}
