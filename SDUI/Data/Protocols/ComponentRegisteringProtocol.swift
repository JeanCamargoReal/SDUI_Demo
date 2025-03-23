//
//  ComponentRegisteringProtocol.swift
//  SDUI
//
//  Created by Jean Camargo on 22/03/25.
//

import Foundation
import SwiftUI

protocol ComponentRegisteringProtocol {
    func register<T: ComponentProtocol>(componentType: String, modelType: T.Type, viewBuilder: @escaping (T) -> AnyView)
    func modelType(for componentType: String) -> Decodable.Type?
    func buildView(for parsed: ParsedComponentEntity) -> AnyView
}
