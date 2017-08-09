//
//  SetUpViewController.swift
//  Archie.tw
//
//  Created by 家齊 on 2017/8/9.
//  Copyright © 2017年 張家齊. All rights reserved.
//

import UIKit

class SetUpViewController: UIViewController {

    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var addressTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    private func setUpView() {
        nameTextField.placeholder = "給值"
        passwordTextField.placeholder = "給值"
        addressTextField.placeholder = "給值"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
