//
//  File.swift
//  
//
//  Created by Mathias Erligmann on 27/11/2021.
//

import Foundation

public struct Alert {
    public let title: String
    public let image: BasicImage
    public let body: String?
    public let loading: Bool
    public let action: (() -> Void)?
    public var buttonAction: (() -> Void)?
    public let sticky: Bool
    
    static func basicSuccessModel(body: String?,
                                  sticky: Bool,
                                  action: (() -> Void)?,
                                  onButtonAction: (() -> Void)?) -> Alert {
        return Alert(title: Status.success.rawValue,
                     image: .system(Status.success.symbol()),
                     body: body,
                     loading: false,
                     action: action,
                     buttonAction: onButtonAction,
                     sticky: sticky)
    }
    
    static func basicPendingModel(body: String?,
                                  sticky: Bool,
                                  action: (() -> Void)?, onButtonAction: (() -> Void)?) -> Alert {
        return Alert(title: Status.pending.rawValue,
                     image: .system(Status.success.symbol()),
                     body: body,
                     loading: true,
                     action: action,
                     buttonAction: action,
                     sticky: sticky)
    }
    
    static func basicErrorModel(body: String?,
                                sticky: Bool,
                                action: (() -> Void)?) -> Alert {
        return Alert(title: Status.failed.rawValue,
                     image: .system(Status.success.symbol()),
                     body: body,
                     loading: false,
                     action: action,
                     buttonAction: action,
                     sticky: sticky)
    }
    
    mutating func section(rightAction: (() -> Void)?) -> Section {
        if let rightAction = rightAction {
            buttonAction = rightAction
        }
        return Section(title: nil, entries: [
            Entry(entryType: .alert(FormModels.AlertEntry(color: .mainColor,
                                                                     imageColor: .backColor,
                                                                     textColor: .backColor,
                                                                     alert: self)))
        ])
    }
}
