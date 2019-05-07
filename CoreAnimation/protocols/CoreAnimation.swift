//
//  CoreAnimation.swift
//  CoreAnimation
//
//  Created by Diego Crozare on 01/05/19.
//  Copyright © 2019 Diego Crozare. All rights reserved.
//

import Foundation
import UIKit

protocol Animations {
    // balançar componente
    func shake()
}

//EXTENSION

extension Animations where Self: UIView {
    
    ///tremer elemento
    func shake() {
        let animation = CABasicAnimation(keyPath: "position.x")
        animation.duration = 0.2
        animation.repeatCount = 2
        animation.autoreverses = true
        animation.fromValue = self.center.x - 4.0
        animation.toValue = self.center.x + 4.0
        
        self.layer.add(animation, forKey: "basicAnimation")
    }
    
    ///rotacionar elemento em 360 graus
    func rotate360Degrees(duration: CFTimeInterval = 1.0, completionDelegate: AnyObject? = nil) {
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = CGFloat(Float.pi)
        rotateAnimation.duration = duration
        
        if let delegate: CAAnimationDelegate = completionDelegate as! CAAnimationDelegate? {
            rotateAnimation.delegate = delegate
        }
        self.layer.add(rotateAnimation, forKey: nil)
    }
    
    /// Dar opacidade no elemento
    func opacityElement() {
        
        let animation = CABasicAnimation(keyPath: "opacity")
        animation.duration = 3
        animation.fromValue = 1
        animation.toValue = 0
        
        // Mantem o ultimo estado da animacao e nao deixa apagar a layer animada
        animation.fillMode = CAMediaTimingFillMode.forwards
        animation.isRemovedOnCompletion = false
        
        self.layer.add(animation, forKey: "opacity")
    }
    
    ///escalar o componente
    func scaleElement() {
        
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.duration = 1
        animation.fromValue = 1
        animation.toValue = 1.5
        
        self.layer.add(animation, forKey: "transform.scale")
    }
    
    /// transição de tela do tipo de mudança de background
    func runTransition() {
        let transition = CATransition()
        transition.duration = 2
        
        //existem alguns tipos de de types para usar na transição (fade - moveIn - push - reveal)
        transition.type = CATransitionType.fade
        self.backgroundColor = UIColor.blue
        
        self.layer.add(transition, forKey: "transition")
    }
    
    ///agrupamentos de animations - exemplo de pulsar
    func groupAnimation() {
        let animationTransform = CABasicAnimation(keyPath: "transform.scale")
        animationTransform.fromValue = 1
        animationTransform.toValue = 1.5
                
        let animationOpacity = CABasicAnimation(keyPath: "opacity")
        animationOpacity.fromValue = 1
        animationOpacity.toValue = 0.3
        
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [animationTransform, animationOpacity]
        animationGroup.duration = 2
        animationGroup.repeatCount = 4
        animationGroup.autoreverses = true
        
        self.layer.add(animationGroup, forKey: "animationGroup")
    }
    
    ///descolocamento do componente na tela
    func position() {
        
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 2
        animation.fromValue = [0, 0]
        animation.toValue = [self.center.x, self.center.y]
        
        self.layer.add(animation, forKey: "position")
    }
    
    ///alteracao da cor do background por meio dos frames
    func backgroundElement() {
            let colorKeyframeAnimation = CAKeyframeAnimation(keyPath: "backgroundColor")
        
            colorKeyframeAnimation.values = [UIColor.red.cgColor,
            UIColor.green.cgColor,
            UIColor.blue.cgColor]
            colorKeyframeAnimation.keyTimes = [0, 1, 2]
            colorKeyframeAnimation.duration = 3
            colorKeyframeAnimation.autoreverses = true
            colorKeyframeAnimation.repeatCount = 4
        self.layer.add(colorKeyframeAnimation, forKey: "backgroundColor")
    }
}
