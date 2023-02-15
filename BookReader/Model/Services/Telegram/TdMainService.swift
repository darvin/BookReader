//
//  TdMainService.swift
//  
//
//  Created by Егор Яковенко on 03.06.2022.
//

import TDLibKit
//import Storage
//import GRDB
import Combine

public class TdMainService: MainService {
    public var updateSubject: PassthroughSubject<Update, Never> {
        tdApi.client.updateSubject
    }
    
    private var tdApi = TdApi.shared
    
    public init() { }
    
    public func getChat(by id: Int64) async throws -> TDLibKit.Chat {
        try await tdApi.getChat(chatId: id)
    }
}
