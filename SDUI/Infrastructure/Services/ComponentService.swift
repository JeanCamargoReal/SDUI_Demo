//
//  ComponentService.swift
//  SDUI
//
//  Created by Jean Camargo on 22/03/25.
//

import SwiftUI

final class ComponentService {
    private let parser: ComponentParsingProtocol

    init(parser: ComponentParsingProtocol = ComponentParser()) {
        self.parser = parser
    }

    func fetchComponents(from url: URL, completion: @escaping ([ParsedComponentEntity]) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data,
                  let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
                  let componentList = json["components"] as? [[String: Any]] else {
                print("Erro ao processar resposta JSON")
                completion([])
                return
            }

            let parsed = componentList.compactMap { result in
                switch self.parser.parse(from: result) {
                case .success(let component): return component
                case .failure(let error):
                    print("Erro ao parsear componente: \(result.description) \(error.localizedDescription)")
                    return nil
                }
            }

            completion(parsed)
        }.resume()
    }
}
