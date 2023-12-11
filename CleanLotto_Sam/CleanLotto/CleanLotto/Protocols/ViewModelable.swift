//
//  ViewModelable.swift
//  CleanLotto
//
//  Created by Sam Sung on 12/10/23.
//

import Foundation

protocol ViewModelable: ObservableObject {
    associatedtype Action
    associatedtype State
    
    var state: State { get }
    
    func bindAction(_ action: Action)
}
