//
//  ExtenseUILabel.swift
//  ThtLittlePrince
//
//  Created by sks on 17/2/26.
//  Copyright © 2017年 chen. All rights reserved.
//

import Foundation
import UIKit

extension UILabel{
    
    func getLabelHeight(labelText: String, font: UIFont, width: CGFloat) -> CGFloat {
        
        let size = CGSize(width:width, height: 10240)
        let attributes = [NSFontAttributeName: font]
        let stringSize = labelText.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil).size
        return stringSize.height + 30
    }
}
