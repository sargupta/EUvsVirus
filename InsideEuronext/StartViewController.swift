//
//  StartViewController.swift
//  InsideEuronext
//
//  Created by Vinicius Granja on 4/25/20.
//  Copyright © 2020 Vinicius Granja. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startButton.applyButtonDesign()
        
        headerLabel.text = "Inside Euronext"
        bodyLabel.text = "We give our clients financial perspectives to different scenarios, preparing them for possible shortfalls."
        startButton.setTitle("Start Now", for: .normal)
        // Do any additional setup after loading the view.
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

extension UILabel {
    func myBorders(_ alert: String) {
        self.text = alert
        self.layer.cornerRadius = 6
        self.layer.borderWidth = 3
        self.layer.borderColor = UIColor.black.cgColor
    }
}

extension UIButton {
    func applyButtonDesign() {
        //self.setTitle("Start Now", for: .normal)
        self.setTitleColor(UIColor.white, for: .normal)
        self.backgroundColor = UIColor.blue
        self.layer.cornerRadius = 15
    }
}
