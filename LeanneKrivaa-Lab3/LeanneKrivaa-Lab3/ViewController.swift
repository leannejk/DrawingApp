//
//  ViewController.swift
//  LeanneKrivaa-Lab3
//
//  Created by Leanne Krivaa on 10/8/21.
//

import UIKit

class ViewController: UIViewController {
    
    var currentShape : Shape?
    var currentColor : UIColor?
    var tempShape : Shape?
    var shapeSize = CGFloat(20)
    static var backColor = UIColor(red: 0.8863, green: 0.8863, blue: 0.8863, alpha: 1.0)
    @IBOutlet weak var shapeBar: UISegmentedControl!
    @IBOutlet weak var colorBar: UISegmentedControl!
    @IBOutlet weak var stateBar: UISegmentedControl!
    @IBOutlet weak var shapeCanvas: DrawingView!
    @IBOutlet weak var sizeSlider: UISlider!
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(shapeCanvas)
        currentColor = UIColor(hue: 56/360, saturation: 100/100, brightness: 99/100, alpha: 1.0)
        shapeCanvas.backgroundColor = ViewController.backColor
        //makeapppie.com/2016/11/28/basic-tap-pinch-and-rotate-gestures:
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(pinchAction(sender:)))
        shapeCanvas.addGestureRecognizer(pinchGesture)
        let rotateGesture = UIRotationGestureRecognizer(target: self, action: #selector(rotateAction(sender:)))
        shapeCanvas.addGestureRecognizer(rotateGesture)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touchPoint = (touches.first)!.location(in: shapeCanvas) as CGPoint
        
        
        switch colorBar.selectedSegmentIndex {
        case 0:
            currentColor = UIColor(hue: 56/360, saturation: 100/100, brightness: 99/100, alpha: 1.0)
        case 1:
            currentColor = UIColor(hue: 42/360, saturation: 100/100, brightness: 95/100, alpha: 1.0)
        case 2:
            currentColor = UIColor(hue: 0/360, saturation: 100/100, brightness: 100/100, alpha: 1.0)
        case 3:
            currentColor = UIColor(hue: 288/360, saturation: 100/100, brightness: 89/100, alpha: 1.0)
        case 4:
            currentColor = UIColor(hue: 191/360, saturation: 100/100, brightness: 93/100, alpha: 1.0)
        case 5:
            currentColor = UIColor(hue: 131/360, saturation: 100/100, brightness: 95/100, alpha: 1.0)
        default:
            currentColor = UIColor(hue: 56/360, saturation: 100/100, brightness: 99/100, alpha: 1.0)
        }
        
        switch stateBar.selectedSegmentIndex{
        case 0:
            switch shapeBar.selectedSegmentIndex{
            case 0:
                currentShape =  Circle(origin: touchPoint, color: currentColor!, size: shapeSize)
            case 1:
                currentShape = Square(origin: touchPoint, color: currentColor!, size: shapeSize)
            case 2:
                currentShape = Triangle(origin: touchPoint, color: currentColor!, size: shapeSize)
            default:
                currentShape = Triangle(origin: touchPoint, color: currentColor!, size: shapeSize)
            }
            
            if let newShape = currentShape {
                shapeCanvas.items.append(newShape)
                sizeSlider.value = 1
            }
        case 1:
            currentShape = shapeCanvas?.itemAtLocation(touchPoint) as? Shape
        case 2:
            for (index,shape) in shapeCanvas.items.enumerated().reversed(){
                if(shape.contains(point: touchPoint)){
                    shapeCanvas.items.remove(at: index)
                    break
                }
            }
        default:
            fatalError("PROBLEM")
            
        }
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touchPoint = (touches.first)!.location(in: shapeCanvas) as CGPoint
        if currentShape != nil{
            if stateBar.selectedSegmentIndex == 1{
                currentShape?.origin = touchPoint
                shapeCanvas.setNeedsDisplay()
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {

    }
    
    
    
    @IBAction func clear(_ sender: Any) {
        currentShape = nil
        shapeCanvas.items = []
    }
    
    
    //creativ portion
    @IBAction func undo(_ sender: Any) {
        if !(shapeCanvas.items.isEmpty){
            shapeCanvas.items.removeLast()
        }
    }
    
    //creativ portion
    @IBAction func saveImage(_ sender: Any) {
        UIImageWriteToSavedPhotosAlbum(shapeCanvas.asImage(),nil,nil,nil)
    }
    
    @objc func pinchAction(sender:UIPinchGestureRecognizer){
        if stateBar.selectedSegmentIndex == 1{
            if sender.state == .changed{
                currentShape?.size *= sender.scale
                shapeCanvas.setNeedsDisplay()
                sender.scale = 1
            }
        }
    }
    
    @objc func rotateAction(sender: UIRotationGestureRecognizer){
        if stateBar.selectedSegmentIndex == 1{
            if sender.state == .changed{
                currentShape?.rotation = sender.rotation
                shapeCanvas.setNeedsDisplay()
            }
        }
        }
    
    //creativ portion
    @IBAction func sizeChanged(_ sender: Any) {
        shapeSize *= CGFloat (sizeSlider.value)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        shapeCanvas.backgroundColor = ViewController.backColor
    }
    
}


