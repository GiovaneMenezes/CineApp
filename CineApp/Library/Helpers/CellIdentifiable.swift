//
//  CellIdentifiable.swift
//  CineApp
//
//  Created by Giovane Silva de Menezes Cavalcante on 05/01/19.
//  Copyright © 2019 GSMenezes. All rights reserved.
//

import UIKit

protocol CellIdentifiable {
    static var cellIdentifier: String { get }
}

extension CellIdentifiable where Self: UICollectionViewCell {
    static var cellIdentifier: String {
        return "\(Self.self)"
    }
}
