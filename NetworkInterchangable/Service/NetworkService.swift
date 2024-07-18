//
//  NetworkService.swift
//  NetworkInterchangable
//
//  Created by Mehmet Ali Bunsuz on 18.07.2024.
//

import Foundation

protocol NetworkService {
    
    func download(_ resource: String) async throws-> [User]
    var type : String { get }
    
}
