//
//  ComponentProtocol.swift
//  SDUI
//
//  Created by Jean Camargo on 22/03/25.
//

import Foundation

protocol ComponentProtocol: Decodable, Identifiable {
    var componentId: String { get }
}
