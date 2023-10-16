//
//  File.swift
//  
//
//  Created by Mathias Erligmann on 03/02/2022.
//

import Foundation

public class Persistance {
    public static func get<T: Codable>(key: String) -> T?{
        let decoder = JSONDecoder()
        if let encoded = UserDefaults.standard.object(forKey: key) as? Data,
           let objects = try? decoder.decode(T.self, from: encoded) {
            return objects
        }
        return nil
    }
    
    public static func save<T: Codable>(objects: T, key: String) {
        let encoder = JSONEncoder()
        if let savedEncoded = try? encoder.encode(objects) {
            let defaults = UserDefaults.standard
            defaults.set(savedEncoded, forKey: key)
        }
    }
    
    public static func getArray<T: Codable>(key: String) -> [T]?{
        let decoder = JSONDecoder()
        if let encoded = UserDefaults.standard.object(forKey: key) as? Data,
           let objects = try? decoder.decode([T].self, from: encoded) {
            return objects
        }
        return nil
    }
    
    public static func saveArray<T: Codable>(objects: [T], key: String) {
        let encoder = JSONEncoder()
        if let savedEncoded = try? encoder.encode(objects) {
            let defaults = UserDefaults.standard
            defaults.set(savedEncoded, forKey: key)
        }
    }
    
    public static func saveNewArray<T: Codable>(object: T, key: String) -> Int {
        if var savedObjects: [T] = Persistance.getArray(key: key) {
            savedObjects.append(object)
            Persistance.saveArray(objects: savedObjects, key: key)
            return savedObjects.count - 1
        } else {
            Persistance.saveArray(objects: [object], key: key)
            return 0
        }
    }
    
    public static func insertAt<T: Codable>(object: T, key: String, index: Int) -> Int {
        if var savedObjects: [T] = Persistance.getArray(key: key) {
            savedObjects.insert(object, at: index)
            Persistance.saveArray(objects: savedObjects, key: key)
            return index
        } else {
            Persistance.saveArray(objects: [object], key: key)
            return 0
        }
    }
    
    public static func modifyArray<T: Codable>(object: T, key: String, for index: Int) {
        if var savedObjects: [T] = Persistance.getArray(key: key) {
            savedObjects[index] = object
            Persistance.saveArray(objects: savedObjects, key: key)
        } else {
            Persistance.saveArray(objects: [object], key: key)
        }
    }
    
    public static func delete<T: Equatable & Codable>(deletedObject: T, key: String) {
        if var savedObjects: [T] = Persistance.getArray(key: key) {
            for (i, object) in savedObjects.enumerated() {
                if object == deletedObject {
                    savedObjects.remove(at: i)
                    Persistance.saveArray(objects: savedObjects, key: key)
                    return
                }
            }
        }
    }
    
    public static func deleteAt<T: Codable>(deletedObject: T, index: Int, key: String) {
        if var savedObjects: [T] = Persistance.getArray(key: key) {
            savedObjects.remove(at: index)
            Persistance.saveArray(objects: savedObjects, key: key)
            return
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
//    static func get<T: Codable>() -> [T]? {
//        let decoder = JSONDecoder()
//        if let encodedTransactions = UserDefaults.standard.object(forKey: "questions") as? Data,
//           let questions = try? decoder.decode([T].self, from: encodedTransactions) {
//            return questions
//        }
//        return nil
//    }
    
}
