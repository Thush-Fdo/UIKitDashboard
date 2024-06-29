//
//  UIHelper.swift
//  UIKitDashboard
//
//  Created by Thush-Fdo on 27/06/2024.
//

import UIKit

enum UIHelper {
    
    static func createTwoColumnFlowLayout(in view: UIView) -> UICollectionViewFlowLayout {
        let width = view.bounds.width
        let padding: CGFloat = 12
        let minimumItemSpacing: CGFloat = 10
        let availableWidth = width - (padding * 2) - minimumItemSpacing
        let itemWidth = availableWidth / 2
        
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowlayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 40)
        
        return flowlayout
    }
    
    static func createThreeColumnFlowLayout(in view: UIView) -> UICollectionViewFlowLayout {
        let width = view.bounds.width
        let padding: CGFloat = 12
        let minimumItemSpacing: CGFloat = 10
        let availableWidth = width - (padding * 2) - (minimumItemSpacing * 2)
        let itemWidth = availableWidth / 3
        
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowlayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 40)
        
        return flowlayout
    }
    
    static func getAvailableColurCombinations(for numberOfColors: Int, random: Bool = true) -> [CGColor] {
        if random {
            return self.getRandomColours(for: numberOfColors)
        } else {
            return self.getPredefinedColours()
        }
    }
    
    private static func getRandomColours(for numberOfColors: Int) -> [CGColor]{
        let colors: [CGColor] = [
            UIColor(hex: 0x7CEA9C).cgColor,
            UIColor(hex: 0x2FB799).cgColor,
            UIColor(hex: 0x454851).cgColor,
            UIColor(hex: 0x6F73D2).cgColor,
            UIColor(hex: 0x98C1D9).cgColor
        ]
        
        var finalColors: [CGColor] = []
        
        for _ in 0...numberOfColors {
            finalColors.append(colors[Int.random(in: 0...numberOfColors)])
        }
        
        return finalColors
    }
    
    private static func getPredefinedColours() -> [CGColor]{
        let twoColors: [[CGColor]] = [
            [UIColor(hex: 0x454851).cgColor, UIColor(hex: 0x7CEA9C).cgColor],
            [UIColor(hex: 0x454851).cgColor, UIColor(hex: 0x2FB799).cgColor],
            [UIColor(hex: 0x454851).cgColor, UIColor(hex: 0x6F73D2).cgColor],
            [UIColor(hex: 0x454851).cgColor, UIColor(hex: 0x98C1D9).cgColor],
            [UIColor(hex: 0x454851).cgColor, UIColor(hex: 0xdfc98d).cgColor],
            [UIColor(hex: 0x4d5366).cgColor, UIColor(hex: 0x8d1203).cgColor],
            [UIColor(hex: 0x0f2254).cgColor, UIColor(hex: 0x0960d5).cgColor]
        ]
        
        return twoColors[Int.random(in: 0...6)]
    }
    
}
