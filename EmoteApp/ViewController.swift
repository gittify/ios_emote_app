//
//  ViewController.swift
//  EmoteApp
//
//  Created by Kim Toy (Personal) on 4/19/17.
//  Copyright © 2017 Codepath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var trayView: UIView!
    var trayOriginalCenter: CGPoint!
    var trayCenterWhenOpen: CGPoint!
    var trayCenterWhenClosed: CGPoint!
    var newlyCreatedFace: UIImageView!
    var smileyOriginalCenter: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        trayCenterWhenOpen = CGPoint(x: 160.0, y: 459.5)
        trayCenterWhenClosed = CGPoint(x: 160.0, y: 632.0)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTrayPanGesture(_ sender: UIPanGestureRecognizer) {
        // Absolute (x,y) coordinates in parent view (parentView should be
        // the parent view of the tray)
        let point = sender.location(in: view)
        let translation = sender.translation(in: view)
        let velocity = sender.velocity(in: view)

        if sender.state == UIGestureRecognizerState.began {
            print("Gesture began at: \(point)")
            trayOriginalCenter = trayView.center
            print(trayOriginalCenter)
        } else if sender.state == UIGestureRecognizerState.changed {
            print("Gesture changed at: \(point)")
            trayView.center.y = max(trayOriginalCenter.y + translation.y, trayCenterWhenOpen.y)
        } else if sender.state == UIGestureRecognizerState.ended {
            print("Gesture ended at: \(point)")
            print(trayView.center)
            if (velocity.y > 0) { //moving down
                trayView.center.y = trayCenterWhenClosed.y
            } else { // moving up
                trayView.center.y = trayCenterWhenOpen.y
            }
        }
    }
    func baseOnDragSmileyFunc(_ sender: UIPanGestureRecognizer) {
        print("called base function")
        let translation = sender.translation(in: view)
        if sender.state == UIGestureRecognizerState.began {
            // Gesture recognizers know the view they are attached to
            let imageView = sender.view as! UIImageView
            
            // Create a new image view that has the same image as the one currently panning
            newlyCreatedFace = UIImageView(image: imageView.image)
            
            // Add the new face to the tray's parent view.
            view.addSubview(newlyCreatedFace)
            
            // Initialize the position of the new face.
            newlyCreatedFace.center = imageView.center
            
            // Since the original face is in the tray, but the new face is in the
            // main view, you have to offset the coordinates
            newlyCreatedFace.center.y += trayView.frame.origin.y
            smileyOriginalCenter = newlyCreatedFace.center
        } else if sender.state == UIGestureRecognizerState.changed {
            newlyCreatedFace.center = CGPoint(x: translation.x + smileyOriginalCenter.x, y: translation.y + smileyOriginalCenter.y)
        } else if sender.state == UIGestureRecognizerState.ended {

        }
    
    }
    
    @IBAction func onDragSmiley(_ sender: UIPanGestureRecognizer) {
        baseOnDragSmileyFunc(sender)
    }
    
    @IBAction func onDragSmiley2(_ sender: UIPanGestureRecognizer) {
        baseOnDragSmileyFunc(sender)
    }
    
    @IBAction func onDragSmiley3(_ sender: UIPanGestureRecognizer) {
        baseOnDragSmileyFunc(sender)
    }
    
    @IBAction func onDragSmiley4(_ sender: UIPanGestureRecognizer) {
        baseOnDragSmileyFunc(sender)
    }
    
    @IBAction func onDragSmiley5(_ sender: UIPanGestureRecognizer) {
        baseOnDragSmileyFunc(sender)
    }
    
    @IBAction func onDragSmiley6(_ sender: UIPanGestureRecognizer) {
        baseOnDragSmileyFunc(sender)
    }
}

