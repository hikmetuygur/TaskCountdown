//
//  Box.swift
//  TaskCountdown
//
//  Created by huygur on 3.11.2022.
//

import Foundation

class Box<T> {
    
    typealias Listener = (T) -> ()
    
    //MARK: - Variables
    
    var value: T{
        didSet{
            listener?(value)
        }
    }
    
    var listener: Listener?
    
    //MARK: - Inits
    
    init (_ value: T) {
        self.value = value
    }
    
    //MARK: - Functions
    
    func bind(listener: Listener?) {
        self.listener = listener
    }
    
    func removeBinding() {
        self.listener = nil
    }
    
}

