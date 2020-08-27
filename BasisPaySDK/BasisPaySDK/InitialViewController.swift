//
//  InitialViewController.swift
//  BasisPay_PaymentGatewayUI
//
//  Created by Saravanan on 25/08/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {

    @IBOutlet weak var bottomSheetView: UIView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var amountButton: UIButton!
    @IBOutlet weak var payNowButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        payNowButton.layer.cornerRadius = payNowButton.frame.size.height / 2
        amountButton.layer.cornerRadius = amountButton.frame.size.height / 2
        bottomSheetView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        bottomSheetView.layer.cornerRadius = bottomSheetView.frame.size.height / 8
        self.navigationController?.title = "Integaration kit"
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let target = segue.destination as? PaymentProcessViewController {
            target.amount = amountButton.titleLabel?.text
            target.titleValue = titleLabel.text
            target.descriptionValue = descriptionLabel.text
        }
    }
    @IBAction func payNowButtonClicked(_ sender: Any) {
        
        self.performSegue(withIdentifier: "paymentScreen", sender: nil)
        
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
