//
//  Payer.swift
//  CustomSliders
//
//  Created by Магомед Ахильгов on 19.06.2022.
//

import SwiftUI

struct Payer: Identifiable {
    var id = UUID().uuidString
    var image: String
    var name: String
    var bgColor: Color
    var offset: CGFloat = 0
}

