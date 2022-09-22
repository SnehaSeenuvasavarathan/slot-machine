//
//  ViewController.swift
//  Exam1_Seenuvasavarathan_Sneha
//
//  Created by Sneha Seenuvasavarathan on 9/22/22.
//

import UIKit

class ViewController: UIViewController, UpdateCredit {
    var slotImages: [UIImage] = [#imageLiteral(resourceName: "7"), #imageLiteral(resourceName: "6"), #imageLiteral(resourceName: "9"), #imageLiteral(resourceName: "1"), #imageLiteral(resourceName: "5"), #imageLiteral(resourceName: "3"), #imageLiteral(resourceName: "2"), #imageLiteral(resourceName: "8"), #imageLiteral(resourceName: "4")]
    var slotIdx1 = 0
    var slotIdx2 = 0
    var slotIdx3 = 0
    var credit = 100
    var bet = 1
    var won = 0
    var spins = 0
    @IBOutlet weak var creditLabel: UILabel!
    @IBOutlet weak var betLabel: UILabel!
    
    
    @IBOutlet weak var image1: UIImageView!
    
    @IBOutlet weak var image2: UIImageView!
    
    @IBOutlet weak var image3: UIImageView!
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

   
    @IBAction func spinAction(_ sender: Any) {
        if self.credit<self.bet{
            createAlert(title: "Not enough credit!", msg: "Please add more credit at the bank tab")
            self.bet = 1
            betLabel.text = "Bet:  "+String(self.bet)
        }
        else{
        let randomInt = Int.random(in: 0..<8)
        self.slotIdx1 = randomInt
        self.slotIdx2 = Int.random(in: 0..<8)
        self.slotIdx3 = Int.random(in: 0..<8)
        image1.image = slotImages[slotIdx1] as! UIImage
        image2.image = slotImages[slotIdx2] as! UIImage
        image3.image = slotImages[slotIdx3] as! UIImage
        if slotIdx1 == slotIdx2 && slotIdx2 == slotIdx3{
            self.credit = self.credit + 10*bet;
            self.won = self.won + 10*bet
            self.bet = 1
            
        }
            else if slotIdx1 == slotIdx2 || slotIdx2 == slotIdx3 || slotIdx1 == slotIdx3{
                self.credit = self.credit - self.bet;
                self.bet = 1;
                
            }
            creditLabel.text = "Credit:  "+String(self.credit)
            betLabel.text = "Bet:  "+String(self.bet)
            self.spins = self.spins+1;
        }
    }
    
    
    @IBAction func betButton(_ sender: Any) {
        if self.bet>=1000{
            bet = 1
        }
        else{
        self.bet*=2
        betLabel.text = "Bet:  "+String(self.bet)
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        let startTab = self.tabBarController?.children[1] as! BankViewController
        startTab.credit = self.credit
        startTab.won =  self.won
        startTab.spins = self.spins
        
    }
    
    func updateCredit(credit: String) {
        self.credit = Int(credit)!
        creditLabel.text = "Credit:  "+credit
    }
    
}

