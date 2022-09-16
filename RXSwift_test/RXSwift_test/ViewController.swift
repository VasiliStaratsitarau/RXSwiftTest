//
//  ViewController.swift
//  RXSwift_test
//
//  Created by Vasili Staratsitarau on 16/09/2022.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    let viewModel = ViewModel()
   let circle = UIView()
    var panCoord = CGPoint()
    var disposeBag = DisposeBag()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.setup()
        configureView()
       
        viewModel
            .backgroundColor
            .subscribe {event in self.circle.backgroundColor = event.element}
            .disposed(by: disposeBag)
        // Do any additional setup after loading the view.
    }






private func configureView() {
        circle.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        view.addSubview(circle)
        
        let recognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        circle.addGestureRecognizer(recognizer)
    }
    
    @IBAction func handlePan(_ sender: UIPanGestureRecognizer) {
        if sender.state == .began {
            panCoord = sender.location(in: sender.view)
        }
        
        let newCoord: CGPoint = sender.location(in: sender.view)
        let x = newCoord.x - panCoord.x
        let y = newCoord.y - panCoord.y
        
        let resultX = circle.center.x + x
        let resultY = circle.center.y + y
        circle.center = CGPoint(x: resultX, y: resultY)
        
        viewModel.center.accept(CGPoint(x: resultX, y: resultY))
    }
}



