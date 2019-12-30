//
//  View+.swift
//
//
//  Created by Adam Fordyce on 19/11/2019.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

import SwiftUI

// MARK: - ----- TYPE ERASURE

public extension View {

    var asAnyView: AnyView {
        AnyView(self)
    }
}

// MARK: - ----- BACKGROUND

public extension View {

    func backgroundColor(_ color: Color) -> some View {
        background(color)
    }
}

// MARK: - ----- BORDER

public extension View {
    
    func borderColor(_ color: Color) -> some View {
        border(color)
    }
}


// MARK: - ----- FONT

public extension View {
    
    func fontSize<T: UINumericType>(_ size: T, withScaling: Bool = true) -> some View {
        fontSize(size, name: nil, withScaling: withScaling)
    }
    
    func fontSize<T: UINumericType>(_ size: T, name: String? = nil, withScaling: Bool = true) -> some View {
        RenderIf(withScaling) {
            self.scalingFont(size: size, name: name)
        }.elseRender {
            RenderIf(name != nil) {
                self.font(.custom(name!, size: size.asCGFloat))
            }.elseRender {
                self.font(.system(size: size.asCGFloat))
            }
        }
    }
}

// MARK: - ----- FRAME

public extension View {

    func width<T: UINumericType>(_ width: T, _ alignment: Alignment = .center) -> some View {
        frame(width: width.asCGFloat, alignment: alignment)
    }
  
    func height<T: UINumericType>(_ height: T, _ alignment: Alignment = .center) -> some View {
        frame(height: height.asCGFloat, alignment: alignment)
    }
    
    func frame<T_LHS: UINumericType, T_LRS: UINumericType>(_ width: T_LHS, _ height: T_LRS, _ alignment: Alignment = .center) -> some View {
        frame(width: width.asCGFloat, height: height.asCGFloat, alignment: alignment)
    }
    
    func frame<T: UINumericType>(_ size: T, _ alignment: Alignment = .center) -> some View {
        frame(width: size.asCGFloat, height: size.asCGFloat, alignment: alignment)
    }
    
    // native type
    func frame(_ size: CGSize, _ alignment: Alignment = .center) -> some View {
        frame(width: size.width, height: size.height, alignment: alignment)
    }
    
    func width(_ width: CGFloat, _ alignment: Alignment = .center) -> some View {
      frame(width: width, alignment: alignment)
    }

    func height(_ height: CGFloat, _ alignment: Alignment = .center) -> some View {
      frame(height: height, alignment: alignment)
    }

    func frame(_ width: CGFloat, _ height: CGFloat, _ alignment: Alignment = .center) -> some View {
      frame(width: width, height: height, alignment: alignment)
    }

    func frame(_ size: CGFloat, _ alignment: Alignment = .center) -> some View {
      frame(width: size, height: size, alignment: alignment)
    }
    
    //other
    func greedyWidth(_ alignment: Alignment = .center) -> some View {
        frame(maxWidth: .infinity, alignment: alignment)
    }
    
    func greedyHeight(_ alignment: Alignment = .center) -> some View {
        frame(maxHeight: .infinity, alignment: alignment)
    }
    
    func greedyFrame(_ alignment: Alignment = .center) -> some View {
        frame(maxWidth: .infinity, maxHeight: .infinity, alignment: alignment)
    }
}

// MARK: - ----- OFFSET

public extension View {
    
    func offset<T_LHS: UINumericType, T_RHS: UINumericType>(_ x: T_LHS, _ y: T_RHS) -> some View {
        offset(x: x.asCGFloat, y: y.asCGFloat)
    }
    
    func xOffset<T: UINumericType>(_ x: T) -> some View {
        offset(x: x.asCGFloat)
    }

    func yOffset<T: UINumericType>(_ y: T) -> some View {
        offset(y: y.asCGFloat)
    }
    
    //native
    func offset(_ x: CGFloat, _ y: CGFloat) -> some View {
        offset(x: x, y: y)
    }

    func xOffset(_ x: CGFloat) -> some View {
        offset(x: x)
    }

    func yOffset(_ y: CGFloat) -> some View {
        offset(y: y)
    }
    
    func offset(_ point: CGPoint) -> some View {
        offset(x: point.x, y: point.y)
    }
}

// MARK: ----- POSITION

public extension View {
    
    func position<TX: UINumericType, TY: UINumericType>(_ x: TX, _ y: TY) -> some View {
        position(x: x.asCGFloat, y: y.asCGFloat)
    }
    
    func xPosition<T: UINumericType>(_ x: T) -> some View {
        position(x: x.asCGFloat)
    }
    
    func yPosition<T: UINumericType>(_ y: T) -> some View {
        position(y: y.asCGFloat)
    }
}

// MARK: - ----- OPACITY

public extension View {

    func opacity<T: UINumericType>(_ theOpacity: T) -> some View {
        opacity(theOpacity.asDouble)
    }
}

// MARK: ----- BLUR

public extension View {

    func blur<T: UINumericType>(_ radius: T, opaque: Bool = false) -> some View {
        blur(radius: radius.asCGFloat, opaque: opaque)
    }
}

// MARK: ----- IMAGE PROCESSING

public extension View {
 
    func saturation<T: UINumericType>(_ amount: T) -> some View {
        saturation(amount.asDouble)
    }
    
    func brightness<T: UINumericType>(_ amount: T) -> some View {
        brightness(amount.asDouble)
    }
    
    func contrast<T: UINumericType>(_ amount: T) -> some View {
        contrast(amount.asDouble)
    }
    
    func grayscale<T: UINumericType>(_ amount: T) -> some View {
        grayscale(amount.asDouble)
    }
}

// MARK: ----- SHADOW

public extension View {
    
    func shadow<T: UINumericType>(_ theRadius: T) -> some View {
        shadow(radius: theRadius.asCGFloat)
    }
}

// MARK: - ----- PADDING

public extension View {

    func hPadding() -> some View {
        padding(.horizontal)
    }

    func vPadding() -> some View {
        padding(.vertical)
    }

    func hPadding<T: UINumericType>(_ horizontalPadding: T) -> some View {
        padding(.horizontal, horizontalPadding.asCGFloat)
    }
    
    func vPadding<T: UINumericType>(_ verticalPadding: T) -> some View {
        padding(.vertical, verticalPadding.asCGFloat)
    }
    
    //native
    func hPadding(_ horizontalPadding: CGFloat) -> some View {
        padding(.horizontal, horizontalPadding)
    }
    
    func vPadding(_ verticalPadding: CGFloat) -> some View {
        padding(.vertical, verticalPadding)
    }
}

// MARK: - ----- ROTATION

public extension View {

    func rotate(_ angle: Angle, anchor: UnitPoint = .center) -> some View {
        rotationEffect(angle, anchor: anchor)
    }
    
    func rotate3D(_ angle: Angle, _ axis: (x: CGFloat, y: CGFloat, z: CGFloat), anchor: UnitPoint = .center, anchorZ: CGFloat = 0, perspective: CGFloat = 1) -> some View {
        rotation3DEffect(angle, axis: axis, anchor: anchor, anchorZ: anchorZ, perspective: perspective)
    }
}

// MARK: - ----- SCALE

public extension View {

    func scale<T: UINumericType>(_ scaleFactor: T, anchor: UnitPoint = .center) -> some View {
        scaleEffect(scaleFactor.asCGFloat, anchor: anchor)
    }
    
    func scale<TX: UINumericType, TY: UINumericType>(_ scaleX: TX, _ scaleY: TY, anchor: UnitPoint = .center) -> some View {
        scaleEffect(x: scaleX.asCGFloat, y: scaleY.asCGFloat, anchor: anchor)
    }
    
    func xScale<T: UINumericType>(_ scaleX: T, anchor: UnitPoint = .center) -> some View {
        scaleEffect(x: scaleX.asCGFloat, y: 1, anchor: anchor)
    }
    
    func yScale<T: UINumericType>(_ scaleY: T, anchor: UnitPoint = .center) -> some View {
        scaleEffect(x: 1, y: scaleY.asCGFloat, anchor: anchor)
    }
    
    //native
    func scale(_ scaleFactor: CGFloat, anchor: UnitPoint = .center) -> some View {
        scaleEffect(scaleFactor, anchor: anchor)
    }
    
    func scale(_ scaleSize: CGSize, anchor: UnitPoint = .center) -> some View {
        scaleEffect(scaleSize, anchor: anchor)
    }
    
    func scale(_ scaleX: CGFloat, _ scaleY: CGFloat, anchor: UnitPoint = .center) -> some View {
        scaleEffect(x: scaleX, y: scaleY, anchor: anchor)
    }
    
    func xScale(_ scaleX: CGFloat, anchor: UnitPoint = .center) -> some View {
        scaleEffect(x: scaleX, y: 1, anchor: anchor)
    }
    
    func yScale(_ scaleY: CGFloat, anchor: UnitPoint = .center) -> some View {
        scaleEffect(x: 1, y: scaleY, anchor: anchor)
    }
}
