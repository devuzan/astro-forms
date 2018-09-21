//
//  SwitchRow.swift
//  AstroForms_Example
//
//  Created by Andrew Plummer on 8/9/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
import AstroForms

class SwitchRow: Row, ValueRow {
    
    var valueHasStartedEditing: Bool = false
    
    var valueHasChanged: Bool = false
    
    var valueHasEndedEditing: Bool = false
    
    typealias Value = Bool
    
    var tag: RowTag
    
    var view: SwitchRowView
    
    var value: Value {
        
        get { return view.switch.isOn }
        
        set { view.switch.setOn(newValue, animated: false) }
        
    }
    
    var title: String? {
        
        get { return view.label.text }
        
        set { view.label.text = newValue }
        
    }
    
    init(tag: RowTag) throws {
        
        let view: View = try View.fromXib()
        self.view = view
        self.tag = tag
        self.view.row = self
        self.view.switch.accessibilityLabel = self.view.label.text
        
    }
    
    convenience init(tag: RowTag, title: String, value: Bool) throws {
        
        try self.init(tag: tag)
        self.title = title
        self.value = value
        
    }
    
}