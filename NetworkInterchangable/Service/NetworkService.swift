//
//  NetworkService.swift
//  NetworkInterchangable
//
//  Created by Hatice Taşdemir on 9.11.2024.
//

import Foundation

protocol NetworkService {
    func download(_ resource: String) async throws -> [User]
  
    var type : String {get}
}
