//
//  ChartViewController.swift
//  InsideEuronext
//
//  Created by Vinicius Granja on 4/25/20.
//  Copyright © 2020 Vinicius Granja. All rights reserved.
//

import UIKit
import Charts

class ChartViewController: UIViewController {

    @IBOutlet weak var chartView: LineChartView!
    @IBOutlet weak var generateLayout: UIButton!
    
    @IBOutlet weak var scenario1: UILabel!
    @IBOutlet weak var scenario2: UILabel!
    @IBOutlet weak var scenario3: UILabel!
    @IBOutlet weak var scenario4: UILabel!
    @IBOutlet weak var scenario5: UILabel!
    
    
    let J_s: [Int] = [5,4,3,2,1]
    let p: Double = 2.5
    //Total Cashflow assuming it as revenue
    let R: [Int] = [10000, 20000, 30000, 40000]

    // Total number of tourists
    let X: [Int] = [1000, 2000, 3000, 4000]  // each time take only one value of X
    let m: Int = 150 // number of customers of a company
    let c: Int = 5
    let n_i: [Int] = [4,3,2,1] // Weight of month based on peak of tourism
    let P: Double = 0.7
    
    
    let c_in: [Int] = [100, 1000, 5000, 20000]  // Cash in
    let c_out: [Int] = [5000, 8000, 1000]   // cash out
    
    var B_sus: [Int] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let count = Int(arc4random_uniform(30))
//        randomValues(count)
        scenario1.text = "0%"
        scenario2.text = "0%"
        scenario3.text = "0%"
        scenario4.text = "0%"
        scenario5.text = "0%"

        // Do any additional setup after loading the view.
        generateLayout.applyButtonDesign()
        generateLayout.setTitle("Generate", for: .normal)
    }
    
    @IBAction func generate(_ sender: UIButton) {
        generateResults(list_C, cashInOut(0, 50000, list_C))
        scenario1.text = scenarioSurvival("scenario 1")
        scenario2.text = scenarioSurvival("scenario 2")
        scenario3.text = scenarioSurvival("scenario 3")
        scenario4.text = scenarioSurvival("scenario 4")
        scenario5.text = scenarioSurvival("scenario 5")
    }
    
    func randomValues(_ count: Int = 20) {
        let values = (0..<count).map { (i) -> ChartDataEntry in
            let val = Double(arc4random_uniform(UInt32(count)))
            return ChartDataEntry(x: Double(i), y : val)
        }

        let set1 = LineChartDataSet(entries: values, label: "Months")
        let data = LineChartData(dataSet: set1)

        self.chartView.data = data
    }
    
    
    func generateResults(_ months: [Int],_ cash: [Int]) {
        var yValues: [ChartDataEntry] = [ChartDataEntry]()

        for i in 0 ..< months.count {
            yValues.append(ChartDataEntry(x: Double(i + 1), y: Double(cash[i])))
        }
        
        let data = LineChartData()
        let dataSet = LineChartDataSet(entries: yValues, label: "Months")
        
        data.addDataSet(dataSet)
        self.chartView.data = data
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func sigmoidFunc(_ x: Double) -> Double {
      return 1 / (1 + exp(-x))
    }
    
    func get_B_sus(_ input: [Int], _ output: [Int]) {
        for i in c_in {
            for j in c_out {
                B_sus.append(i - j)
            }
        }
    }
    
    var p_p: [Double] = []

    func get_p_p() -> [Double] {
        for l in n_i {
            let z = Double(l) * P
            p_p.append(z * 0.2)
        }
        return p_p
    }
    
    
    let C_in: Int = 0
    let list_C: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
    let C: Int = 50000
    var dict: [String:Int] = [:]
    
    func cashInOut(_ C_in: Int = 0, _ C: Int = 50000, _ list_C: [Int]) -> [Int] {
        
        var ar: [Int] = []
        
        for c in list_C {
            
            let C_out = (10000*c)
            let result = C + C_in - C_out
            ar.append(result)
        }
        return ar
    }
    
    func bankruptMonth(cflow C: Int, moneyIn C_in: Int, moneyLost m_lost: Int, bankrupcy C_f: Int = 0) -> Int {
        return (C + C_in - C_f) / m_lost
    }

    var scenarios: [String:Int] = ["scenario 1": 1, "scenario 2": 2, "scenario 3": 3, "scenario 4": 4, "scenario 5": 5, "scenario 6": 6]

    //let endMonth = bankruptMonth(cflow: 50000, moneyIn: 0, moneyLost: 10000, bankrupcy: 0)

    func scenarioSurvival(_ scenario: String) -> String {
        let percent = (1.0 - (Double(scenarios[scenario]!) / Double(bankruptMonth(cflow: 50000, moneyIn: 0, moneyLost: 10000, bankrupcy: 0)))) * 100.0
        if percent >= 0.0 {
            return "\(Int(percent))%"
        } else {
            return "0%"
        }
    }
    

}
