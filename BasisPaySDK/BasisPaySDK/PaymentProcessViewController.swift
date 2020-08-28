//
//  PaymentProcessViewController.swift
//  BasisPay-iOS-DemoApp
//
//  Created by Saravanan on 26/08/20.
//  Copyright © 2020 Saravanan. All rights reserved.
//

import UIKit
import BasisPay

class PaymentProcessViewController: UIViewController {
    
    var paymentGatewayViewController: PaymentGatewayController!
    var amount:String?
    var titleValue:String?
    var descriptionValue:String?
    @IBOutlet weak var viewContainer: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        paymentGatewayViewController = PaymentGatewayController()
        viewContainer.addSubview(paymentGatewayViewController.view)
        setDefaults()
        setInputDictionary()
        checkAndGetResponse()
    }
    
    //MARK: Default keys will be provided by the BasisPay support team
    // API key
    // Salt key
    // return url
    // Endpoint - just provide .Testing or .Live
    private func setDefaults() {
        paymentGatewayViewController.paymentDefaults = PaymentDefaults(apiKey: "", saltKey: "", returnUrl: "", endPoint: .Testing)
        paymentGatewayViewController.delegate = self
    }
    
    
    
    private func setInputDictionary() {
        guard let amountVal = amount,let titleVal = titleValue,let descriptionVal = descriptionValue else {
            return
        }
        
        let paymentRequestDictionary: NSDictionary = [
            "orderId" : "253698",
            "amount" : amountVal,
            "currency" : "INR",
            "description" : descriptionVal,
            "name" : titleVal,
            "email" : "qwerty@123gmail.com",
            "phone" : "5876986087",
            "addressLine1" : "address_line_1",
            "addressLine2" : "address_line_2",
            "city" : "city",
            "state" : "state",
            "country" : "country",
            "zipCode" : "zip_code",
            "udf1" : "Testing1",
            "udf2" : "Testing2",
            "udf3" : "Testing3",
            "udf4" : "Testing4",
            "udf5" : "Testing5"
        ]
        paymentGatewayViewController.setInputDictionary(inputDictionary: paymentRequestDictionary)
        
    }
    
    @objc func checkAndGetResponse() {
        if (paymentGatewayViewController.isResponseAvailable()) {
            let responseData = paymentGatewayViewController.getResponseData()
            print(responseData) }
        else {
            perform(#selector(checkAndGetResponse), with: nil, afterDelay: 2) }
    }
    
}
extension PaymentProcessViewController:PaymentGatewayDelegate {
    
    func onPaymentSucess(orderId: String, description: String) {
        self.navigationController?.popViewController(animated: true)
        let alertController = UIAlertController(title: "SUCCESS", message: "order Id \(orderId)", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        self.view.window?.rootViewController?.present(alertController, animated: true, completion: nil)
    }
    
    func onPaymentFailure(description: String) {
        self.navigationController?.popViewController(animated: true)
        let alertController = UIAlertController(title: "FAILURE", message: " message - \(description)", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        self.view.window?.rootViewController?.present(alertController, animated: true, completion: nil)
    }
    
    
}

