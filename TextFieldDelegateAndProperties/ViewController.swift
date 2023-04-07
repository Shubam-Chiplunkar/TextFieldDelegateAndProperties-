//
//  ViewController.swift
//  TextFieldDelegateAndProperties
//
//  Created by mayank ranka on 06/04/23.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var lblTop: UILabel!
    @IBOutlet weak var lblPhone: UILabel!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var butSubmit: UIButton!
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtUser: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
//        lblTop.layer.cornerRadius = 30
        mainView.layer.cornerRadius = 30
        txtUser.delegate = self
        txtEmail.delegate = self
        txtPhone.delegate = self
    }

  
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
       
//            if txtUser.text == "0" || txtUser.text == "1" || txtUser.text == "2" || txtUser.text == "3" || txtUser.text == "4" || txtUser.text == "5" || txtUser.text == "6" || txtUser.text == "7" || txtUser.text == "8" || txtUser.text == "9" {
//
//            return true
//            }
//            else
//            {
////             txtUser.text == "" {
//
        if textField == txtPhone{
                let allowedCharaters = "0123456789"
                let allowedCharacterSet = CharacterSet(charactersIn: allowedCharaters)
                let typeCharaterIn = CharacterSet(charactersIn: string)
                let number = allowedCharacterSet.isSuperset(of: typeCharaterIn)

            if (txtPhone.text != nil) == number  {
                if range.location > 9{
                    txtPhone.layer.borderWidth = 0.0
                    lblPhone.text = "Max 10 digits"
                    return false
                }
                else
                {
                    lblPhone.text = " "
                }
                
                txtPhone.layer.borderWidth = 0.0
                lblPhone.text = " "
                return number
            }
            else
            {
                txtPhone.layer.borderWidth = 3.0
                lblPhone.text = "Invalid number, Use only digits "
                txtPhone.layer.borderColor = .init(red: (250.0 / 255.0), green: (60.0 / 255.0), blue: (50.0 / 255.0), alpha: 1)
                return false
            }

        }
        
        else if textField == txtEmail{
//            "[a-z._%+-]+@[a-z.-]+\\.[a-z]{2,}"
            let emailRegex = "[a-z]{2,}"
            let updatedText = (textField.text as NSString?)?.replacingCharacters(in: range, with: string)
            let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
            let isValidEmail = emailTest.evaluate(with: updatedText)
            
            if isValidEmail {
                textField.layer.borderWidth = 0
                textField.layer.borderColor = nil
                return true
                
            } else {
                txtEmail.layer.borderWidth = 3.0
                txtEmail.layer.borderColor = UIColor(red: (250.0 / 255.0), green: (60.0 / 255.0), blue: (50.0 / 255.0), alpha: 1).cgColor
                return false
            }
            
//            return true
        }
        else
        {
            return false
        }
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("Text field should begin editing")
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("Text field did begin editing")
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        print("Text field did change")
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("Text field should end editing")
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("Text field did end editing")
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("Text field should clear editing")
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("Text field should return editing")
        return true
    }
    

}

