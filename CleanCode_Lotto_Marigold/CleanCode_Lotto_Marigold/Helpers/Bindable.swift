//
//  File.swift
//  CleanCode_Lotto_Marigold
//
//  Created by 황홍필 on 2023/12/12.
//

import ReactorKit

protocol Bindable {
    associatedtype Reactor: ReactorKit.Reactor
    func bindState(_ reactor: Reactor)
    func bindAction(_ reactor: Reactor)
}
