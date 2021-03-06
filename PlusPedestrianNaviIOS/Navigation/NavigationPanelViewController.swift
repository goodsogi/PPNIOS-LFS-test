//
//  NavigationPanelViewController.swift
//  PlusPedestrianNaviIOS
//
//  Created by Jeonggyu Park on 11/08/2020.
//  Copyright © 2020 박정규. All rights reserved.
//

import UIKit

class NavigationPanelViewController: UIViewController {

     
    var finishNavigationPopupDelegate: FinishNavigationPopupDelegate?
    var showOverviewButtonDelegate: ShowOverviewButtonDelegate?
    var showStreetViewButtonDelegate: ShowStreetViewButtonDelegate?
    
    @IBOutlet var showOverviewButton: UIView!
    @IBOutlet var showStreetViewButton: UIView!
    @IBOutlet var finishNavigationButton: UIView!
    
    
    @IBOutlet weak var arrivalTimeTextWidthConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var remainingTimeTextWidthConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var remainingDistanceTextWidthConstraint: NSLayoutConstraint!
    
    
    @IBOutlet weak var showOverviewButtonLeadingConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var showStreetViewButtonLeadingConstraint: NSLayoutConstraint!
    
    
    @IBOutlet weak var remainingTime: UITextField!
    
    @IBOutlet weak var remainingDistance: UITextField!
    
    @IBOutlet weak var remainingDistanceUnit: UITextField!
    
    @IBOutlet weak var arrivalTime: UITextField!
    
    
    @IBAction func onFinishNavigationButtonClicked(_ sender: Any) {
        showFinishNavigationAlertPopup()
        
    }
    
    private func showFinishNavigationAlertPopup() {
//        let storyboard = UIStoryboard(name: "AlertPopup", bundle: nil)
//        let modalViewController = storyboard.instantiateViewController(withIdentifier: "FinishNavigationPopup")
//         
//        modalViewController.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
//        modalViewController.modalTransitionStyle = UIModalTransitionStyle.coverVertical
//        
//        (modalViewController as! FinishNavigationPopupController).finishNavigationPopupDelegate  = finishNavigationPopupDelegate
//         
//        self.present(modalViewController, animated: true, completion: nil)
        
        let alert = UIAlertController(title: "", message: LanguageManager.getString(key: "wanna_finish_navigation"), preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: LanguageManager.getString(key: "ok"), style: .default) { (action) in
            self.finishNavigationPopupDelegate?.onFinishNavigationConfirmed()
            alert.dismiss(animated: true, completion: nil)
                }
        let cancelAction = UIAlertAction(title: LanguageManager.getString(key: "cancel"), style: .default) { (action) in
            alert.dismiss(animated: true, completion: nil)
                }
        
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        
        present(alert, animated: false, completion: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
         makeLayout()
        addTapListenerToButtons()
    }
    
    private func makeLayout() {
           let circleButtonBackgroundImg = ImageMaker.getCircle(width: 102, height: 102, colorHexString: "#c2c2c2", alpha: 1.0)
           showOverviewButton.backgroundColor = UIColor(patternImage: circleButtonBackgroundImg)
        
        showStreetViewButton.backgroundColor = UIColor(patternImage: circleButtonBackgroundImg)
        
        let finishNavigationButtonBackgroundImg = ImageMaker.getRoundRectangle(width: 90, height: 70, colorHexString: "#cd1039", cornerRadius: 10.0, alpha: 1.0)
                       finishNavigationButton.backgroundColor = UIColor(patternImage: finishNavigationButtonBackgroundImg)
        
        
        
        let screenWidth = UIScreen.main.bounds.width
               
        let textWidth = (screenWidth - (10 + 15 + 15 + 20 + 90 + 18))/3
                   
        
        arrivalTimeTextWidthConstraint?.constant = textWidth
        remainingTimeTextWidthConstraint?.constant = textWidth
        remainingDistanceTextWidthConstraint?.constant = textWidth
        
        let buttonIntervalWidth = (screenWidth - (102 + 102))/3
        showOverviewButtonLeadingConstraint?.constant = buttonIntervalWidth
        showStreetViewButtonLeadingConstraint?.constant = buttonIntervalWidth
    }
    
    private func addTapListenerToButtons() {
        let showOverviewButtonTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.onShowOverviewButtonTapped(_:)))
        showOverviewButtonTapGesture.numberOfTapsRequired = 1
        showOverviewButtonTapGesture.numberOfTouchesRequired = 1
        showOverviewButton.addGestureRecognizer(showOverviewButtonTapGesture)
        showOverviewButton.isUserInteractionEnabled = true
        
        
        let showStreetViewButtonTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.onShowStreetButtonTapped(_:)))
        showStreetViewButtonTapGesture.numberOfTapsRequired = 1
        showStreetViewButtonTapGesture.numberOfTouchesRequired = 1
        showStreetViewButton.addGestureRecognizer(showStreetViewButtonTapGesture)
        showStreetViewButton.isUserInteractionEnabled = true
        
    }
    
    @objc func onShowOverviewButtonTapped(_ sender: UITapGestureRecognizer) {
    
        showOverviewButtonDelegate?.onShowOverviewButtonTapped()

    }
    
    
    @objc func onShowStreetButtonTapped(_ sender: UITapGestureRecognizer) {
        showStreetViewButtonDelegate?.onShowStreetViewButtonTapped()
    }
    
    
    
    func showRemainingDistance(formattedRemainingDistance: String, distanceUnit: String, contentDescription: String) {
        remainingDistance.text = formattedRemainingDistance
      
            remainingDistanceUnit.text = distanceUnit
        
        remainingDistance.accessibilityLabel = contentDescription
    }
    
    func showRemainingTime(remainingTimeString: String,  contentDescription: String) {
        remainingTime.text = remainingTimeString
         
        remainingTime.accessibilityLabel = contentDescription
    }
    
    func showArrivalTime(arrivalTimeString: String,  contentDescription: String) {
         arrivalTime.text = arrivalTimeString
         arrivalTime.accessibilityLabel = contentDescription
    }
}
