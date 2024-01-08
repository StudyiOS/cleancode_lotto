//
//  ViewDrawable.swift
//  CleanCode_Lotto_Marigold
//
//  Created by 황홍필 on 2023/12/11.
//

import Foundation

protocol ViewDrawable: AnyObject {
    func configureUI()
    func setBackgroundColor()
    func setAutolayout()
}
