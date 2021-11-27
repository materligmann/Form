//
//  MessageModel.swift
//  GoGo
//
//  Created by Mathias Erligmann on 24/11/2020.
//

import UIKit

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

public struct Message {
    let title: String
    let body: String
    let textField: Bool
    let actions: [Action]?
    
    static func basicErrorModel(body: String?) -> Message {
        let defaultBody = "Something went wrong"
        return Message(title: "Error", body: body ?? defaultBody, textField: false, actions: nil)
    }
    
    static func basicSuccessModel(body: String?) -> Message {
        let defaultBody = "Action was succesful"
        return Message(title: "Success", body: body ?? defaultBody, textField: false, actions: nil)
    }
}
