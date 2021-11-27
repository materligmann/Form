//
//  MessageModel.swift
//  GoGo
//
//  Created by Mathias Erligmann on 24/11/2020.
//

import UIKit

public struct Message {
    public let title: String
    public let body: String
    public let textField: Bool
    public let actions: [Action]?
    
    public static func basicErrorModel(body: String?) -> Message {
        let defaultBody = "Something went wrong"
        return Message(title: "Error", body: body ?? defaultBody, textField: false, actions: nil)
    }
    
    public static func basicSuccessModel(body: String?) -> Message {
        let defaultBody = "Action was succesful"
        return Message(title: "Success", body: body ?? defaultBody, textField: false, actions: nil)
    }
}
