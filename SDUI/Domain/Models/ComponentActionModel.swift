//
//  ComponentActionModel.swift
//  SDUI
//
//  Created by Jean Camargo on 22/03/25.
//

import Foundation

struct ComponentActionModel: ComponentActionProtocol {
    let actionType: String
    let parameters: [String: String]
}
