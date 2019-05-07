//
//  ViewController.swift
//  CoreAnimation
//
//  Created by Diego Crozare on 01/05/19.
//  Copyright © 2019 Diego Crozare. All rights reserved.
//

import UIKit

class TextFieldModify: UITextField, Animations {}
class ViewCustom: UIView, Animations {}

class ViewController: UIViewController {

    @IBOutlet weak var userTextField: TextFieldModify!
    @IBOutlet weak var passwordTextField: TextFieldModify!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var view1: ViewCustom!
    @IBOutlet weak var view2: ViewCustom!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func shakeButton(_ sender: UIButton) {
        userTextField.shake()
        passwordTextField.shake()
    }
    
    @IBAction func rotationButton(_ sender: Any) {
        view1.rotate360Degrees()
    }
    
    @IBAction func opacityButton(_ sender: Any) {
        //view2.opacityElement()
        view1.groupAnimation()
    }
    
    @IBAction func scaleButton(_ sender: Any) {
        view1.scaleElement()
        
    }
    
    @IBAction func transitionButton(_ sender: Any) {
        view1.runTransition()
    }
    
    @IBAction func groupAnimationButton(_ sender: Any) {
        view1.groupAnimation()
    }
}
