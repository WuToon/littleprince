//
//  ContentsViewController.swift
//  ThtLittlePrince
//
//  Created by sks on 17/2/26.
//  Copyright © 2017年 chen. All rights reserved.
//

import UIKit

class ContentsViewController: CommonViewController {

    @IBOutlet weak var webView: UIWebView!
    var indexOfChapter: Int = 0{
        willSet{
            updateWebView(index: newValue)
            self.title = titles[newValue]
        }
    }
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var previousButton: UIButton!
    
    let titles = ["第一章","第二章","第三章",
                  "第四章","第五章","第六章",
                  "第七章","第八章","第九章",
                  "第十章","第十一章","第十二章",
                  "第十三章","第十四章","第十五章",
                  "第十六章","第十七章","第十八章",
                  "第十九章","第二十章","第二十一章",
                  "第二十二章","第二十三章","第二十四章",
                  "第二十五章","第二十六章","第二十七章",""]
    
    let minIndexOfChapter = 0
    let maxIndexOfChapter = 26
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.automaticallyAdjustsScrollViewInsets = false
        

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        navigationController?.navigationBar.lt_reset()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        updateWebView(index: indexOfChapter)

        
    }
    
    func indexOfChapterIsValid() -> Bool{
        if indexOfChapter < minIndexOfChapter || indexOfChapter > maxIndexOfChapter{
            return false
        }
        return true
    }
    
    func updateWebView(index: Int){
        if index == 0 {
            previousButton?.setTitle("没有了", for: .normal)
        } else {
            previousButton?.setTitle("上一章", for: .normal)
        }
        if index == 26{
            nextButton?.setTitle("没有了", for: .normal)
        } else{
            nextButton?.setTitle("下一章", for: .normal)

        }
        if indexOfChapterIsValid() {
            let resourceName = "chapter" + String(index + 1)
            print(resourceName)
            let path = Bundle.main.path(forResource: resourceName, ofType: "html")
            let htmlSting = NSString()
            if let thePath = path {
                let url = URL(fileURLWithPath: thePath)
                print(url)
                webView?.loadRequest(URLRequest(url: url))
            }
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func previousChapter(_ sender: Any) {
        if indexOfChapter == 0 {
            return
        }
        indexOfChapter -= 1
    }
    
    @IBAction func back(_ sender: Any) {
        _ = self.navigationController?.popViewController(animated: true)
    }

    @IBAction func nextChapter(_ sender: Any) {
        if indexOfChapter == 26 {
            return
        }
        indexOfChapter += 1
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
