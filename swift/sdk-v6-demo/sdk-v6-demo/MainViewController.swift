//
//  MainViewController.swift
//  basic_app
//
//  Created by Liaz Kamper on 30/07/2020.
//  Copyright © 2020 OneLink. All rights reserved.
//

import UIKit
import AdSupport

class MainViewController: UIViewController {
    
    @IBOutlet weak var idfaOutput: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
            
    @IBAction func getIdfaButton(_ sender: UIButton) {
        let IdfaStr:String =        ASIdentifierManager.shared().advertisingIdentifier.uuidString
        if IdfaStr == "00000000-0000-0000-0000-000000000000" {
            idfaOutput.text = "No IDFA collection was allowed."
        } else {
            idfaOutput.text = IdfaStr
        }
    }
    
}
