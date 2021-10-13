//
//  ColorViewViewController.swift
//  LeanneKrivaa-Lab3
//
//  Created by Leanne Krivaa on 10/8/21.
//

import UIKit

class ColorViewViewController: UIViewController {

    
    @IBOutlet weak var colorScreen: UIView!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var redSlider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()

        colorScreen.backgroundColor = ViewController.backColor
    }
    
    
    @IBAction func redChange(_ sender: Any) {
        changed()
    }
    @IBAction func greenChane(_ sender: Any) {
        changed()
    }
    @IBAction func blueChange(_ sender: Any) {
        changed()
    }
    @IBAction func alphaChanged(_ sender: Any) {
        changed()
    }
    
    func changed(){
        colorScreen.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha:1)
        ViewController.backColor = colorScreen.backgroundColor!
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
