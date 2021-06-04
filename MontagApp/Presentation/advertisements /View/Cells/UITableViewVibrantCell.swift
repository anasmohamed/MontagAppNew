//
//  UITableViewVibrantCellTableViewCell.swift
//  MontagApp
//
//  Created by no one on 04/06/2021.
//

import UIKit

open class UITableViewVibrantCell: UITableViewCell {
    @IBOutlet weak var signInButton : UIButton!
    @IBOutlet weak var buttonTwo : UIButton!
    @IBOutlet weak var fixedPages : UIButton!
    @IBOutlet weak var howWeAre : UIButton!
    @IBOutlet weak var callUs : UIButton!

    private var vibrancyView: UIVisualEffectView = UIVisualEffectView()
    private var vibrancySelectedBackgroundView: UIVisualEffectView = UIVisualEffectView()
    private var defaultSelectedBackgroundView: UIView?
    open var blurEffectStyle: UIBlurEffect.Style? {
        didSet {
            updateBlur()
        }
    }
    
    // For registering with UITableView without subclassing otherwise dequeuing instance of the cell causes an exception
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        vibrancyView.frame = bounds
        vibrancyView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        for view in subviews {
           
            vibrancyView.contentView.addSubview(view)
        }
        addSubview(vibrancyView)

        let blurSelectionEffect = UIBlurEffect(style: .light)
        vibrancySelectedBackgroundView.effect = blurSelectionEffect
        defaultSelectedBackgroundView = selectedBackgroundView
        
        updateBlur()
    }
    
    internal func updateBlur() {
        // shouldn't be needed but backgroundColor is set to white on iPad:
        backgroundColor = UIColor.clear
        
        if let blurEffectStyle = blurEffectStyle, !UIAccessibility.isReduceTransparencyEnabled {
            let blurEffect = UIBlurEffect(style: blurEffectStyle)
            vibrancyView.effect = UIVibrancyEffect(blurEffect: blurEffect)
            
            if selectedBackgroundView != nil && selectedBackgroundView != vibrancySelectedBackgroundView {
                vibrancySelectedBackgroundView.contentView.addSubview(selectedBackgroundView!)
                selectedBackgroundView = vibrancySelectedBackgroundView
            }
        } else {
            vibrancyView.effect = nil
            selectedBackgroundView = defaultSelectedBackgroundView
        }
    }

}
