//
//  LineShape.swift
//  RealStateApp
//
//  Created by Brandon Rojas on 2/12/23.
//

import SwiftUI

struct LineShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        return path
    }
}
