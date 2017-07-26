//: A UIKit based Playground to present user interface

import UIKit
import PlaygroundSupport

class myViewController : UIViewController {
   
   override func viewDidLoad() {
      super.viewDidLoad()
      view.backgroundColor = .red
   }
}

PlaygroundPage.current.liveView = myViewController()
PlaygroundPage.current.needsIndefiniteExecution = true
