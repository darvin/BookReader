//
//  TelegramClient.swift
//  BookReader
//
//  Created by standard on 2/15/23.
//

import Foundation
import TDLibKit



public final class StdOutLogger: Logger {
    
    let queue: DispatchQueue
    
    public init() {
        queue = DispatchQueue(label: "Logger", qos: .userInitiated)
    }
    
    public func log(_ message: String, type: LoggerMessageType?) {
        queue.async {
            var fisrtLine = ""
            if let type = type {
                fisrtLine = ">> \(type.description)"
            }
            NSLog("\(fisrtLine)\n\(message)\n---------------------------")
        }
    }
}



class TelegramClient {
    static let shared = TelegramClient()
    let client:TdClientImpl
    let api:TdApi
    private init() {
        client = TdClientImpl(logger: StdOutLogger())
        api = TdApi(client: client)

    }
    
    func activate() {
        guard let path = Bundle.main.path(forResource: ".KEYS", ofType: "plist"),
              let keys = NSDictionary(contentsOfFile: path),
              let telegramApiKey = keys["TELEGRAM_API_KEY"] as? String,
              let telegramApiId = keys["TELEGRAM_API_ID"] as? Int
        else {return }
           
        client.run { _ in }
        
        let query = SetLogVerbosityLevel(newVerbosityLevel: 5)
        do {
            let result = try api.client.execute(query: DTO(query))
            if let resultDict = result {
                if let resultTypeString = resultDict["@type"] as? String, resultTypeString == "ok" {
                    print("ERROR: \(resultTypeString)")
                } else {
                    print("Wrong response from SetLogVerbosityLevel \(resultDict)")
                }
            } else {
                print("Empty response for loglevel")
            }
        } catch {
            print("Error in SetLogVerbosityLevel request \(error.localizedDescription)")
        }
        
        guard let cachesUrl = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else {
            print("Unable to get cache path")
            return
        }
        let tdlibPath = cachesUrl.appendingPathComponent("tdlib", isDirectory: true).path
        
        let _ = Task {
            let _ = try! await api.setTdlibParameters(
                apiHash: telegramApiKey,
                apiId: telegramApiId,
                applicationVersion: "1.0",
                databaseDirectory: tdlibPath,
                databaseEncryptionKey: nil,
                deviceModel: "iOS",
                enableStorageOptimizer: true,
                filesDirectory: "",
                ignoreFileNames: true,
                systemLanguageCode: "en",
                systemVersion: "Unknown",
                useChatInfoDatabase: true,
                useFileDatabase: true,
                useMessageDatabase: true,
                useSecretChats: true,
                useTestDc: false)
            let authState = try! await api.getAuthorizationState()
            switch (authState) {
            case .authorizationStateWaitPhoneNumber:
                break
            default:
                print("Auth state is not ready. It's \(authState)")
            }
        }
    }
    
    func chats() async -> [Chat]? {
        var chatInfos = [Chat]()
        do {
            
            let chats: Chats = try await api.searchChats(limit: nil, query: nil)
            for chatId in chats.chatIds {
                let chat = try await api.getChat(chatId: chatId)
                chatInfos.append(chat)
            }
            return chatInfos
        } catch {
            print("Error in getChatHistory \(error)")
            return nil
        }

    }

}
