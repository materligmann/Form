//
//  File.swift
//  
//
//  Created by Mathias Erligmann on 03/02/2022.
//

import Foundation

public class Persistance {
    public static func get<T: Codable>(key: String) -> [T]? {
        let decoder = JSONDecoder()
        if let encodedTransactions = UserDefaults.standard.object(forKey: key) as? Data,
           let questions = try? decoder.decode([T].self, from: encodedTransactions) {
            return questions
        }
        return nil
    }
    
    public static func save<T: Codable>(questions: [T], key: String) {
        let encoder = JSONEncoder()
        if let savedQuestionEncoded = try? encoder.encode(questions) {
            let defaults = UserDefaults.standard
            defaults.set(savedQuestionEncoded, forKey: key)
        }
    }
    
//    public static func set<Codable>(key: String, value: Codable) {
//        UserDefaults.standard.set(value, forKey: key)
//    }
//
//    public static func get<T>(key: String) -> T? {
//        if let obj = UserDefaults.standard.object(forKey: key) as? T {
//            return obj
//        }
//        return nil
//    }
//
//
//    static func saveNew<T: Codable>(obj: T, objKey: String) {
//        let encoder = JSONEncoder()
//        if var savedQuestions = Persistance.get<T>(key: objKey) {
//            savedQuestions.append(question)
//            if let savedTransactionsEncoded = try? encoder.encode(savedQuestions) {
//                let defaults = UserDefaults.standard
//                defaults.set(savedTransactionsEncoded, forKey: "questions")
//            }
//        } else {
//            if let savedQuestionEncoded = try? encoder.encode([question]) {
//                let defaults = UserDefaults.standard
//                defaults.set(savedQuestionEncoded, forKey: "questions")
//            }
//        }
//    }
//
//
//    static func get<T: Codable>() -> [T]? {
//        let decoder = JSONDecoder()
//        if let encodedTransactions = UserDefaults.standard.object(forKey: "questions") as? Data,
//           let questions = try? decoder.decode([T].self, from: encodedTransactions) {
//            return questions
//        }
//        return nil
//    }
    
}
