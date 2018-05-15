//
//  ViewController.swift
//  User Defaults-App
//
//  Created by fahri on 14.05.18.
//  Copyright © 2018 fahri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let defaults = UserDefaults.standard
    var defaultValue = ["MyName" : ""]
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var userInput: UITextField!
    
    @IBAction func saveButton(_ sender: UIButton) {
        
        name.text = userInput.text
        
        if (name.text?.isEmpty)! || name.text == nil{
            name.text = ""
        }
        
        if let text = name.text {
            
            defaults.set(text, forKey: "MyName")
            defaults.synchronize()
        }
        
    }
    
    @IBAction func deleteButton(_ sender: UIButton) {
        
        name.text = ""
        defaults.set(name.text, forKey: "MyName")
        defaults.synchronize()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        defaults.register(defaults: defaultValue)
        name.text = defaults.string(forKey: "MyName")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

