//
//  Action.swift
//  GoGo
//
//  Created by Mathias Erligmann on 01/12/2020.
//

import UIKit

public struct Action {
    let actionTitle: String
    let onCompletion: ((String?) -> Void)?
    let style: ActionStyle
    
    
    public init(actionTitle: String, onCompletion: ((String?) -> Void)?, style: ActionStyle) {
        self.actionTitle = actionTitle
        self.onCompletion = onCompletion
        self.style = style
    }
}

public enum ActionStyle {
    case cancel
    case basic
    case destructive
}

extension ActionStyle {
    var associatedAlertActionStyle: UIAlertAction.Style {
        switch self {
        case .basic:
            return.default
        case .cancel:
            return .cancel
        case .destructive:
            return .destructive
        }
    }
}
