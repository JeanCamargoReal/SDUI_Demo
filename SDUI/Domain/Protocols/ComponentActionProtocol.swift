//
//  ComponentActionProtocol.swift
//  SDUI
//
//  Created by Jean Camargo on 22/03/25.
//

import Foundation

protocol ComponentActionProtocol: Decodable {
    var actionType: String { get }
    var parameters: [String: String] { get }
}
