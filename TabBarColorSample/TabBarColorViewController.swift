//
//  TabBarColorViewController.swift
//  TabBarColorSample
//
//  Created by 清水智貴 on 2020/06/27.
//  Copyright © 2020 com.tomotaka. All rights reserved.
//

import UIKit

class TabBarColorViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // fontの設定
        let fontFamily: UIFont! = UIFont.systemFont(ofSize: 15) //フォントサイズ：15
        
        // 背景色の設定
        if #available(iOS 15.0, *) {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor.red
            tabBar.standardAppearance = appearance
            tabBar.scrollEdgeAppearance = tabBar.standardAppearance
        } else {
            UITabBar.appearance().barTintColor = UIColor.red
        }
        
        
        // 非選択時の設定
        let nomalAttributes = [NSAttributedString.Key.font: fontFamily, NSAttributedString.Key.foregroundColor: UIColor.white] //白色
        // タイトルテキストカラーの設定
        UITabBarItem.appearance().setTitleTextAttributes(nomalAttributes as [NSAttributedString.Key : Any], for: UIControl.State.normal)
        // アイコンカラー（画像）の設定（非選択時での画像のカラーはコードだけでは書けないため、元の色にするためにこのコードを書く）
        let assets :Array<String> = ["icons8_file_50@2x.png", "icons8_box_50@2x.png", "icons8_bookmark_ribbon_50@2x.png"]
        // tabBarItemのタイトルの設定
        let titles = ["File", "Box", "Bookmark"]
        for (idx, item) in self.tabBar.items!.enumerated() {
            item.image = UIImage(named: assets[idx])?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
            item.title = titles[idx]
        }
        
        
        // 選択時の設定
        let selectedColor:UIColor = UIColor.yellow
        let selectedAttributes = [NSAttributedString.Key.font: fontFamily, NSAttributedString.Key.foregroundColor: selectedColor]
        // タイトルテキストカラーの設定
        UITabBarItem.appearance().setTitleTextAttributes(selectedAttributes as [NSAttributedString.Key : Any], for: UIControl.State.selected)
        // アイコンカラーの設定
        UITabBar.appearance().tintColor = selectedColor
    }
    
}
