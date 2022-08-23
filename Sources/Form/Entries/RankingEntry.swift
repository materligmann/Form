//
//  File.swift
//  
//
//  Created by Mathias Erligmann on 23/08/2022.
//

import Foundation
import UIKit

public struct RankingEntry {
    let name: String
    let ranking: String
    let rankingColor: UIColor
    
    public init(name: String, ranking: String, rankingColor: UIColor) {
        self.name = name
        self.ranking = ranking
        self.rankingColor = rankingColor
    }
}
