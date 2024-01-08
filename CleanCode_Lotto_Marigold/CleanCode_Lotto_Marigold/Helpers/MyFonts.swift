//
//  MyFonts.swift
//  CleanCode_Lotto_Marigold
//
//  Created by 황홍필 on 2023/12/11.
//

import UIKit

// enum 타입으로 재사용성 늘리기 (코드 더 깔끔하게 만들기) ⭐️⭐️
enum MyFonts: String {
    case Thin = ""
    case Regular
    case Bold
}

extension UIFont {
    static func LINESeedThin(size: CGFloat) -> UIFont? {
        return UIFont(name: "LINESeedSansKR-Thin", size: size)
    }
    
    static func LINESeedRegular(size: CGFloat) -> UIFont? {
        return UIFont(name: "LINESeedSansKR-Regular", size: size)
    }
    
    static func LINESeedBold(size: CGFloat) -> UIFont? {
        return UIFont(name: "LINESeedSansKR-Bold", size: size)
    }
    
}
