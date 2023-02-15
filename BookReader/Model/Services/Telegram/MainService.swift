//
//  MainService.swift
//  
//
//  Created by Егор Яковенко on 03.06.2022.
//

import Combine
import TDLibKit

public protocol MainService: Service {
    func getChat(by id: Int64) async throws -> Chat
}
