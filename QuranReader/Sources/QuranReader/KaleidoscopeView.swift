//
//  File.swift
//  
//
//  Created by standard on 2/17/23.
//

import Foundation


import SwiftUI

struct StarShape: Shape {
    
    var pointsAmount: Int = 5
    var amplitude: CGFloat = 0.3
    var radiusFactor: CGFloat = 1.0
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let radius = min(rect.width, rect.height) / 2 * radiusFactor

            let center = CGPoint(x: rect.midX, y: rect.midY)
            let angleStep = CGFloat(360 / (pointsAmount * 2))
            let innerRadius = radius * amplitude

            for i in 0..<pointsAmount*2 {
                let currentAngle = angleStep * CGFloat(i)
                let pointRadius = i % 2 == 0 ? radius : innerRadius
                let point = CGPoint(x: center.x + cos(currentAngle * .pi / 180) * pointRadius,
                                    y: center.y + sin(currentAngle * .pi / 180) * pointRadius)

                if i == 0 {
                    path.move(to: point)
                } else {
                    let prevAngle = angleStep * CGFloat(i-1)
                    let prevPointRadius = (i-1) % 2 == 0 ? radius : innerRadius
                    let prevPoint = CGPoint(x: center.x + cos(prevAngle * .pi / 180) * prevPointRadius,
                                            y: center.y + sin(prevAngle * .pi / 180) * prevPointRadius)
                    let midAngle = (prevAngle + currentAngle) / 2
                    let midPointRadius = radius / cos(angleStep/2 * .pi / 180)
                    let midPoint = CGPoint(x: center.x + cos(midAngle * .pi / 180) * midPointRadius,
                                           y: center.y + sin(midAngle * .pi / 180) * midPointRadius)
                    let controlPoint1 = CGPoint(x: (prevPoint.x + midPoint.x) / 2,
                                                y: (prevPoint.y + midPoint.y) / 2 - (prevPoint.x - midPoint.x) * amplitude)
                    let controlPoint2 = CGPoint(x: (midPoint.x + point.x) / 2,
                                                y: (midPoint.y + point.y) / 2 + (point.x - midPoint.x) * amplitude)

                    path.addCurve(to: point, control1: controlPoint1, control2: controlPoint2)
                }
            }

            path.closeSubpath()

            return path
        
        
    }
}

struct KaleidoscopeView: View {
    @State var rot: Double = 0.0
    var body: some View {
        
        ZStack {
            
            ForEach(1..<10) {_ in
                let amplitude = CGFloat.random(in: -0.3...0.5)
                let pointsAmount = Int.random(in: 8...12)
                StarShape(
                    pointsAmount:pointsAmount,
                    amplitude: amplitude,
                    radiusFactor: CGFloat.random(in: 0.4...1.4)
                )
                    .stroke(
                        .linearGradient(
                        colors: [
                                .blue,
                                .red,
                                .green
                        ],
                        startPoint: .top, endPoint: .bottom),
                        lineWidth: Double.random(in: 0.1...5)
                        
                    )
                    .hueRotation(.degrees(Double.random(in: 0...360)))
                    .rotationEffect(.degrees(Double.random(in: 0...360)))
                    .opacity(Double.random(in: 0.2...0.6))
    


            }

        }
    }
}

struct KaleidoscopeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            KaleidoscopeView()
        }
        .previewLayout(.fixed(width: 300, height: 400))
        .background(Color.cyan)
    }
}

