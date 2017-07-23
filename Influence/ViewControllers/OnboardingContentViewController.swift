//
//  OnboardingContentViewController.swift
//  LINK
//
//  Created by Gregory Klein on 5/22/17.
//  Copyright © 2017 Incipia. All rights reserved.
//

import UIKit

class OnboardingContentViewController: UIViewController {
   var content: OnboardingContent
   
   // MARK: - Init
   init(content: OnboardingContent) {
      self.content = content
      super.init(nibName: nil, bundle: nil)
   }
   
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
   
   // MARK: - Overridden
   override func viewDidLoad() {
      super.viewDidLoad()
      self._configure()
   }
   
   lazy var headerLabel: UILabel = {
      let label = UILabel.with(text: self.content.header, font: UIFont(18, .bold), color: UIColor(.outerSpace))
      label.translatesAutoresizingMaskIntoConstraints = false
      label.numberOfLines = 0
      return label
   }()
   
   lazy var textLabel: UILabel = {
      let label = UILabel.with(text: self.content.text, font: UIFont(14, .light), color: UIColor(.outerSpace))
      label.translatesAutoresizingMaskIntoConstraints = false
      label.numberOfLines = 0
      return label
   }()
   
   lazy var imageView: UIImageView = {
      let view = UIImageView(image: self.content.image)
      view.translatesAutoresizingMaskIntoConstraints = false
      view.contentMode = .scaleAspectFit
      view.tintColor = UIColor(.outerSpace)
      return view
   }()
   
   private func _configure() {
      headerLabel.translatesAutoresizingMaskIntoConstraints = false
      textLabel.translatesAutoresizingMaskIntoConstraints = false
      imageView.translatesAutoresizingMaskIntoConstraints = false
      
      view.addSubview(imageView)
      view.addSubview(headerLabel)
      view.addSubview(textLabel)
      
      NSLayoutConstraint.activate([
         imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
         imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -20),
         headerLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 24),
         headerLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
         headerLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
         textLabel.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: content.header != nil ? 8 : 0),
         textLabel.centerXAnchor.constraint(equalTo: headerLabel.centerXAnchor),
         textLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8)
         ])
   }
}
