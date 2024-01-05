//
//  FetchPhase.swift
//  FCStats
//
//  Created by Danyal Nemati on 1/4/24.
//

import Foundation

enum FetchPhase<T> {
    
    case initial
    case fetching
    case success(T)
    case failure(Error)
    
    var value: T? {
        if case .success(let t) = self {
            return t
        }
        return nil
    }
    var error: Error? {
        if case .failure(let error) = self {
            return error
        }
        return nil
    }
}
