//
//  ComponentParsing.swift
//  SDUI
//
//  Created by Jean Camargo on 22/03/25.
//

import Foundation

protocol ComponentParsing {
    func parse(from json: [String: Any]) -> Result<ParsedComponentEntity, Error>
}
