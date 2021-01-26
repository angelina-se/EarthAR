//
//  ViewController.swift
//  EarthAR
//
//  Created by anhelina.mamekhina on 1/25/21.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Create an object
        let object = SCNSphere(radius: 0.2)
        
        // Set up a material for the object
        let material = SCNMaterial()
        material.diffuse.contents = UIImage(named: "art.scnassets/earth.jpg")
        object.materials = [material]
        
        // Set up object's position
        let node = SCNNode()
        node.position = SCNVector3(0, 0.2, -0.5)
        node.geometry = object
        
        sceneView.scene.rootNode.addChildNode(node)
        sceneView.autoenablesDefaultLighting = true
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
}
