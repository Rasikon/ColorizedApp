//
//  MainViewController.swift
//  HW 2
//
//  Created by Rasikon on 06.09.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import UIKit

protocol SliderViewControllerDelegate {
    func changeSaveScreen(red: Float, green: Float, blue: Float)
}

class MainViewController: UIViewController {
    
    @IBOutlet var mainView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondVC = segue.destination as! SliderViewController
        if let mainBackgroundColor = mainView.backgroundColor {
            let colorRGB = colorToRGB(uiColor: mainBackgroundColor)
            secondVC.redMainViewLabel = Float(colorRGB.red)
            secondVC.blueMainViewLabel = Float(colorRGB.blue)
            secondVC.greenMainViewLabel = Float(colorRGB.green)
            secondVC.delegate = self
        }
    }
}

extension MainViewController {
    func colorToRGB (uiColor: UIColor) -> CIColor {
        CIColor(color: uiColor)
    }
}

extension MainViewController: SliderViewControllerDelegate {
    func changeSaveScreen(red: Float, green: Float, blue: Float) {
        mainView.backgroundColor = UIColor(displayP3Red: CGFloat(red),
                                       green: CGFloat(green),
                                       blue: CGFloat(blue),
                                       alpha: 1)
    }
}
