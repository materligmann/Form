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
    
    public static func basicSuccessModel(title: String?,
                                         sticky: Bool,
                                         action: (() -> Void)?,
                                         onButtonAction: (() -> Void)?) -> Alert {
        return Alert(title: title ?? Status.success.rawValue,
                     image: .system(Status.success.symbol()),
                     body: nil,
                     loading: false,
                     action: action,
                     buttonAction: onButtonAction,
                     sticky: sticky)
    }
    
    public static func basicPendingModel(title: String?,
                                         sticky: Bool,
                                         action: (() -> Void)?, onButtonAction: (() -> Void)?) -> Alert {
        return Alert(title: title ?? Status.pending.rawValue,
                     image: .system(Status.success.symbol()),
                     body: nil,
                     loading: true,
                     action: action,
                     buttonAction: action,
                     sticky: sticky)
    }
    
    public static func basicErrorModel(title: String?,
                                       sticky: Bool,
                                       action: (() -> Void)?) -> Alert {
        return Alert(title: title ?? Status.failed.rawValue,
                     image: .system(Status.success.symbol()),
                     body: nil,
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
