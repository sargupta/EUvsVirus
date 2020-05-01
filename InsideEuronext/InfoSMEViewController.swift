//
//  InfoSMEViewController.swift
//  InsideEuronext
//
//  Created by Vinicius Granja on 4/25/20.
//  Copyright © 2020 Vinicius Granja. All rights reserved.
//

import UIKit

class InfoSMEViewController: UIViewController {
    
    @IBOutlet weak var startSimulationLayout: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startSimulationLayout.applyButtonDesign()
        startSimulationLayout.setTitle("Start Simulation", for: .normal)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func startSimulation(_ sender: UIButton) {
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
