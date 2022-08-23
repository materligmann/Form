//
//  File.swift
//  
//
//  Created by Mathias Erligmann on 23/08/2022.
//

import Foundation

public struct RankingEntry {
    let name: String
    let ranking: String
    
    public init(name: String, ranking: String) {
        self.name = name
        self.ranking = ranking
    }
}
