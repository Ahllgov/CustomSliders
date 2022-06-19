//
//  Shapes.swift
//  CustomSliders
//
//  Created by Магомед Ахильгов on 19.06.2022.
//

import SwiftUI

struct Line: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
        }
    }
}

struct CustomBillCardShape: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            
            path.move(to: CGPoint(x: 0, y: 75))
            path.addArc(center: CGPoint(x: 0, y: 80), radius: 20, startAngle: .init(degrees: -90), endAngle: .degrees(90), clockwise: false)
            
            path.move(to: CGPoint(x: rect.width, y: 75))
            path.addArc(center: CGPoint(x: rect.width, y: 80), radius: 20, startAngle: .init(degrees: 90), endAngle: .degrees(-90), clockwise: false)
        }
    }
}

