//
//  DetailViewController.swift
//  CurrencyExchange
//
//  Created by S2H on 2018. 6. 7..
//  Copyright © 2018년 S2H. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var cur_nmLabel: UILabel!
    @IBOutlet weak var cur_unitLabel: UILabel!
    @IBOutlet weak var deal_bas_rLabel: UILabel!
    @IBOutlet weak var inputTextFiled: UITextField!
    
     var currency : CurrencyData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cur_nmLabel.text = currency?.cur_nm
        cur_unitLabel.text = currency?.cur_unit
        deal_bas_rLabel.text = currency?.deal_bas_r

        
    }


    @IBAction func exchangeButton(_ sender: UIButton) {
        
        let inputData = inputTextFiled.text
        let rate = deal_bas_rLabel.text
        
        deal_bas_rLabel.text = String(Double(inputData!)! * Double(rate!)!)
        
    }
    
   
    @IBAction func resetButton(_ sender: UIButton) {
        
        deal_bas_rLabel.text = currency?.deal_bas_r
        inputTextFiled.text = ""
    }
    
}
