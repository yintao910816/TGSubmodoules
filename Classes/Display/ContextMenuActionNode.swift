import Foundation
import UIKit


final private class ContextMenuActionButton: HighlightTrackingButton {
    override func convert(_ point: CGPoint, from view: UIView?) -> CGPoint {
        if view is UIWindow {
            return super.convert(point, from: nil)
        } else {
            return super.convert(point, from: view)
        }
    }
}

final class ContextMenuActionNode: ASDisplayNode {
    private let textNode: ImmediateTextNode?
    private var textSize: CGSize?
    private let iconNode: ASImageNode?
    private let action: () -> Void
    private let button: ContextMenuActionButton
    private let actionArea: AccessibilityAreaNode
    
    var dismiss: (() -> Void)?
    
    init(action: ContextMenuAction, blurred: Bool) {
        self.actionArea = AccessibilityAreaNode()
        self.actionArea.accessibilityTraits = .button
        
        switch action.content {
            case let .text(title, accessibilityLabel):
                self.actionArea.accessibilityLabel = accessibilityLabel
                
                let textNode = ImmediateTextNode()
                textNode.isUserInteractionEnabled = false
                textNode.displaysAsynchronously = false
                textNode.attributedText = NSAttributedString(string: title, font: Font.regular(14.0), textColor: UIColor.white)
                textNode.isAccessibilityElement = false
                
                self.textNode = textNode
                self.iconNode = nil
            case let .textWithIcon(title, icon):
                let textNode = ImmediateTextNode()
                textNode.isUserInteractionEnabled = false
                textNode.displaysAsynchronously = false
                textNode.attributedText = NSAttributedString(string: title, font: Font.regular(17.0), textColor: UIColor.white)
                textNode.isAccessibilityElement = false
            
                let iconNode = ASImageNode()
                iconNode.displaysAsynchronously = false
                iconNode.image = icon
                
                self.textNode = textNode
                self.iconNode = iconNode
            case let .icon(image):
                let iconNode = ASImageNode()
                iconNode.displaysAsynchronously = false
                iconNode.image = image
                
                self.iconNode = iconNode
                self.textNode = nil
        }
        self.action = action.action
        
        self.button = ContextMenuActionButton()
        self.button.isAccessibilityElement = false
        
        super.init()
        
        if !blurred {
            self.backgroundColor = UIColor(rgb: 0x2f2f2f)
        }
        
        if let textNode = self.textNode {
            self.addSubnode(textNode)
        }
        if let iconNode = self.iconNode {
            self.addSubnode(iconNode)
        }
        
        self.button.highligthedChanged = { [weak self] highlighted in
            if blurred {
                self?.backgroundColor = highlighted ? UIColor(rgb: 0xffffff, alpha: 0.5) : .clear
            } else {
                self?.backgroundColor = highlighted ? UIColor(rgb: 0x8c8e8e) : UIColor(rgb: 0x2f2f2f)
            }
        }
        self.view.addSubview(self.button)
        self.addSubnode(self.actionArea)
        
        self.actionArea.activate = { [weak self] in
            self?.buttonPressed()
            return true
        }
    }
    
    override func didLoad() {
        super.didLoad()
        
        self.button.addTarget(self, action: #selector(self.buttonPressed), for: [.touchUpInside])
    }
    
    @objc private func buttonPressed() {
        self.backgroundColor = UIColor(white: 0.0, alpha: 0.4)
        
        self.action()
        if let dismiss = self.dismiss {
            dismiss()
        }
    }
    
    override func calculateSizeThatFits(_ constrainedSize: CGSize) -> CGSize {
        if let textNode = self.textNode {
            let textSize = textNode.updateLayout(constrainedSize)
            self.textSize = textSize
            
            var totalWidth = 0.0
            totalWidth += textSize.width
            if let image = self.iconNode?.image {
                if totalWidth > 0.0 {
                    totalWidth += 11.0
                }
                totalWidth += image.size.width
                totalWidth += 24.0
            } else {
                totalWidth += 36.0
            }
            
            return CGSize(width: totalWidth, height: 54.0)
        } else if let iconNode = self.iconNode, let image = iconNode.image {
            return CGSize(width: image.size.width + 36.0, height: 54.0)
        } else {
            return CGSize(width: 36.0, height: 54.0)
        }
    }
    
    override func layout() {
        super.layout()
        
        self.button.frame = self.bounds
        self.actionArea.frame = self.bounds
        
        var totalWidth = 0.0
        if let textSize = self.textSize {
            totalWidth += textSize.width
        }
        if let image = self.iconNode?.image {
            if totalWidth > 0.0 {
                totalWidth += 11.0
            }
            totalWidth += image.size.width
        }
        
        if let textNode = self.textNode, let textSize = self.textSize {
            textNode.frame = CGRect(origin: CGPoint(x: floor((self.bounds.size.width - totalWidth) / 2.0), y: floor((self.bounds.size.height - textSize.height) / 2.0)), size: textSize)
        }
        if let iconNode = self.iconNode, let image = iconNode.image {
            let iconSize = image.size
            iconNode.frame = CGRect(origin: CGPoint(x: floor((self.bounds.size.width - totalWidth) / 2.0) + totalWidth - iconSize.width, y: floorToScreenPixels((self.bounds.size.height - iconSize.height) / 2.0)), size: iconSize)
        }
    }
}
