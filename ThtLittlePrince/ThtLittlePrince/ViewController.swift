//
//  ViewController.swift
//  ThtLittlePrince
//
//  Created by sks on 17/2/26.
//  Copyright © 2017年 chen. All rights reserved.
//

import UIKit

class ViewController: CommonViewController, UIScrollViewDelegate {

    @IBOutlet weak var viewWidth: NSLayoutConstraint!
    @IBOutlet weak var viewHeight: NSLayoutConstraint!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var labelHeight: NSLayoutConstraint!
    @IBOutlet weak var contentListsView: UIView!

    let navColor = UIColor(red: 0/255.0, green: 136/255.0, blue: 205/255.0, alpha: 1.0)

    let buttonTagIncrease = 10000
    let contents = "    《小王子》所讲述的是美丽的伤感故事，飞行员我因为飞机出了故障，被迫降落在远离人烟的撒哈拉沙漠上，这时一位迷人而神秘的小男孩出现了，执拗地请我给他画一只绵羊。他就是小王子，纯洁、忧郁，来自太阳系中某个不为人知的小行星，爱提问题，对别人的问题却从不作答。在攀谈中小王子的秘密逐渐揭开了，他是因为与他美丽而骄傲的玫瑰发生了感情纠葛才负气出走的。他在各星球中漫游，分别造访了国王、自负的人、酒鬼、商人、掌灯人和地理学家的星球，最后降临到地球上，试图找到疏解孤独和痛苦的良方，小王子结识了狐狸，同狐狸建立了友谊，也从狐狸那里学到了人生的真谛。他决定回到他的玫瑰那里去，但是他的躯壳是难以带走的，于是他决定求助于那条30秒钟内就能致人于死地的毒蛇……"
    let titles = ["第一章","第二章","第三章",
                  "第四章","第五章","第六章",
                  "第七章","第八章","第九章",
                  "第十章","第十一章","第十二章",
                  "第十三章","第十四章","第十五章",
                  "第十六章","第十七章","第十八章",
                  "第十九章","第二十章","第二十一章",
                  "第二十二章","第二十三章","第二十四章",
                  "第二十五章","第二十六章","第二十七章",""]
    var selectedButton: UIButton! {
        willSet{
            newValue.setTitleColor(UIColor.lightGray, for: .normal)
        }
    }
    
    func createContentListsView(){
        let paddingX: CGFloat = 8
        let paddingY: CGFloat = 8
        let buttonWidth = (view.bounds.width - 4 * paddingX) / 3
        let buttonHeight: CGFloat = 44

        var counter = 0
        for i in 0..<9{
            for j in 0..<3{
                let button = UIButton()
                button.frame = CGRect(x: paddingX + CGFloat(j) * (buttonWidth + paddingX), y: paddingY + CGFloat(i) * (buttonHeight + paddingY), width: buttonWidth, height: buttonHeight)
                button.tag = counter + buttonTagIncrease
                button.setTitle(titles[counter], for: .normal)
                button.setTitleColor(UIColor.blue, for: .normal)
                button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
                button.addTarget(self, action: #selector(click(sender:)), for: .touchUpInside)
                contentListsView.addSubview(button)
                counter += 1
                
            }
        }
    }
    
    func click(sender: UIButton){
//        selectedButton = sender
        print(sender.tag - buttonTagIncrease)
        
        let contentsViewController = storyboard?.instantiateViewController(withIdentifier: "ContentsViewController") as! ContentsViewController
        contentsViewController.indexOfChapter = sender.tag - buttonTagIncrease
        contentsViewController.modalTransitionStyle = .partialCurl
        contentsViewController.modalPresentationStyle = .fullScreen
        
        self.navigationController?.pushViewController(contentsViewController, animated: true)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentLabel.text = contents
        viewWidth.constant = view.bounds.width
        viewHeight.constant = viewWidth.constant
        self.automaticallyAdjustsScrollViewInsets = false
        labelHeight.constant = contentLabel.getLabelHeight(labelText: contents, font: contentLabel.font, width: viewWidth.constant)
        
        createContentListsView()
        
        navigationController?.navigationBar.lt_setBackgroundColor(backgroundColor: navColor)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        navigationController?.navigationBar.lt_reset()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        
        if offsetY > 0 {
//            let number: CGFloat = 30
//            print(number/offsetY)
//            var alpha = number / offsetY
//            if alpha < 0.2{
//                alpha = 0.0
//            }
//            let color = navColor.withAlphaComponent(alpha)
//            navigationController?.navigationBar.lt_setBackgroundColor(backgroundColor: color)
//            navigationController?.navigationBar.lt_setElementsAlpha(alpha: alpha)
//            navigationController?.navigationBar.lt_setTranslationY(translationY: -(offsetY/8))
            
            
            
        }
        
        
        
        
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

