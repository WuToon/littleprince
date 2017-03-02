//
//  CommonViewController.swift
//  ThtLittlePrince
//
//  Created by sks on 17/2/26.
//  Copyright © 2017年 chen. All rights reserved.
//

import UIKit

class CommonViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dict = [ NSForegroundColorAttributeName: UIColor.white]
        self.navigationController?.navigationBar.titleTextAttributes = dict;
        
        let item = UIBarButtonItem(title:"", style:.plain ,target:nil, action:nil)
        self.navigationItem.backBarButtonItem = item;
        
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0/255.0, green: 136/255.0, blue: 205/255.0, alpha: 1.0)
    }
    
    func showAlertView(_ message: String){
        
        let alertController = UIAlertController(title: "提示", message: message, preferredStyle: .alert)
        
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
            // ...
        }
        alertController.addAction(OKAction)
        
        self.present(alertController, animated: true) {
            // ...
        }
    }
    
    func viewController(_ storyboard: String, named: String) -> UIViewController? {
        let sb = UIStoryboard(name: storyboard, bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: named)
        return vc
    }
}
