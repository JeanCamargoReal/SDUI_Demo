//
//  GreetingHeaderModel.swift
//  SDUI
//
//  Created by Jean Camargo on 22/03/25.
//

import SwiftUI

struct GreetingHeaderModel: ComponentProtocol {
    let componentId: String
    let title: String
    let subtitle: String
    let userName: String?
    let greetingTextColor: String?
    let userNameColor: String?
    let avatarUrl: String
    
    var id: String { componentId }
}
