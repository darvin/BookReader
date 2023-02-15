//
//  Secret.swift
//  BookReader
//
//  Created by standard on 2/15/23.
//

import Foundation
class Secret {
    
    private static func getSecrets() -> [String: Any] {
        guard let path = Bundle.main.path(forResource: ".KEYS", ofType: "plist"),
              let secrets = NSDictionary(contentsOfFile: path) as? [String: Any]
        else { fatalError()}
        return secrets
    }
    public static var apiId: Int {
        return getSecrets()["TELEGRAM_API_ID"] as! Int
    }
        
    public static var apiHash: String {
        return getSecrets()["TELEGRAM_API_KEY"] as! String

    }
    

}
