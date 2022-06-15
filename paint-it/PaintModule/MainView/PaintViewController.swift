//
//  ViewController.swift
//  paint-it
//
//  Created by IlyaCool on 20.04.22.
//

import UIKit

class PaintViewController: UIViewController {
    
    let pickerContent: [String] = ShapeFactory.instance.getNames()
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var drawPanel: DrawPanel!
    
    var choosedShape: String! {
        didSet {
            drawPanel.shapeToDraw = choosedShape
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupPicker()
        
        choosedShape = pickerContent[pickerView.selectedRow(inComponent: 0)]
        
        drawPanel.clipsToBounds = true
    }
    
}

extension PaintViewController {
    func setupPicker() {
        pickerView?.dataSource = self
        pickerView?.delegate = self
    }
}

extension PaintViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerContent[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        choosedShape = pickerContent[row]
    }
}

extension PaintViewController: UIPickerViewDataSource {
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerContent.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
}
