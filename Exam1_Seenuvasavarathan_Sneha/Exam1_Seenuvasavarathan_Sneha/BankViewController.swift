//
//  BankViewController.swift
//  Exam1_Seenuvasavarathan_Sneha
//
//  Created by Sneha Seenuvasavarathan on 9/22/22.
//

import UIKit
protocol UpdateCredit {
    func updateCredit(credit: String);
}
class BankViewController: UIViewController {
    var delegate: UpdateCredit?
    var won = 0
    var credit = 0
    var spins = 0
    @IBOutlet weak var wonLabel: UILabel!
    @IBOutlet weak var creditLabel: UILabel!
    @IBOutlet weak var spinLabel: UILabel!
    

    @IBOutlet weak var addCredit: UITextField!
    override func viewDidLoad() {

        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func createAlert(title: String, msg: String) {
           let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
           alert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: { _ in
               self.dismiss(animated: true, completion: nil)
           }))
           self.present(alert, animated: true, completion: nil)
       }

    override func viewDidAppear(_ animated: Bool) {
        spinLabel.text = String(self.spins)
        wonLabel.text = String(self.won)
        creditLabel.text = String(self.credit)
    }
    
    @IBAction func addCreditButton(_ sender: Any) {
        var num = Int(addCredit.text!)
        if num == nil {
            createAlert(title: "Please enter valid number", msg: "Please add more credit at the bank tab")
        }
        else{
            self.credit = self.credit + num!
            creditLabel.text = String(self.credit)
            delegate?.updateCredit(credit: String(credit))
            dismiss(animated: true, completion: nil);
    }
    
}
}
