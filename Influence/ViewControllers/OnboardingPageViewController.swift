//
//  OnboardingPageViewController.swift
//  LINK
//
//  Created by Gregory Klein on 5/18/17.
//  Copyright © 2017 Incipia. All rights reserved.
//

import UIKit

protocol OnboardingPageViewControllerDelegate: class {
   func onboardingPageTransitionCompleted(index: Int, in viewController: OnboardingPageViewController)
}

class OnboardingPageViewController: UIPageViewController {
   // MARK: - Private Properties
   fileprivate lazy var _vcs: [UIViewController] = {
      let vcs: [UIViewController] = self.content.map {
         return OnboardingContentViewController(content: $0)
      }
      
      for (index, vc) in vcs.enumerated() { vc.view.tag = index }
      return vcs
   }()
   
   fileprivate var _currentIndex = 0
   
   // MARK: - Public Properties
   var content: [OnboardingContent] = []
   weak var onboardingDelegate: OnboardingPageViewControllerDelegate?
   
   var totalSteps: Int {
      return _vcs.count
   }
   
   // MARK: - Init
   convenience init(content: [OnboardingContent]) {
      self.init(transitionStyle: .scroll, navigationOrientation: .horizontal)
      self.content = content
   }
   
   required init?(coder: NSCoder) {
      super.init(coder: coder)
      _commonInit()
   }
   
   override init(transitionStyle style: UIPageViewControllerTransitionStyle, navigationOrientation: UIPageViewControllerNavigationOrientation, options: [String : Any]? = nil) {
      super.init(transitionStyle: style, navigationOrientation: navigationOrientation, options: options)
      _commonInit()
   }
   
   private func _commonInit() {
      let appearance = UIPageControl.appearance()
      appearance.pageIndicatorTintColor = UIColor(.outerSpace, alpha: 0.25)
      appearance.currentPageIndicatorTintColor = UIColor(.outerSpace)
      delegate = self
      dataSource = self
   }
   
   // MARK: - Life Cycle
   override func viewDidLoad() {
      super.viewDidLoad()
      view.subviews.forEach { ($0 as? UIScrollView)?.delaysContentTouches = false }
      setViewControllers([_vcs.first!], direction: .forward, animated: false, completion: nil)
   }
   
   // MARK: - Public
   func navigate(_ direction: UIPageViewControllerNavigationDirection, completion: (() -> Void)? = nil) {
      guard let current = viewControllers?.first else { completion?(); return }
      
      var next: UIViewController?
      switch direction {
      case .forward: next = dataSource?.pageViewController(self, viewControllerAfter: current)
      case .reverse: next = dataSource?.pageViewController(self, viewControllerBefore: current)
      }
      
      guard let target = next else { completion?(); return }
      switch direction {
      case .forward: _currentIndex = _currentIndex + 1
      case .reverse: _currentIndex = _currentIndex - 1
      }
      
      setViewControllers([target], direction: direction, animated: true) { finished in
         if let index = self._vcs.index(of: target) {
            // calling setViewControllers(direction:animated:) doesn't trigger the UIPageViewControllerDelegate method
            // didFinishAnimating, so we have to tell our listingPageDelegate that a transition was just completed
            self.onboardingDelegate?.onboardingPageTransitionCompleted(index: index, in: self)
         }
         completion?()
      }
   }
   
   func navigateToFirst() {
      for _ in 0..<_vcs.count { navigate(.reverse) }
      _currentIndex = 0
   }
}

extension OnboardingPageViewController: UIPageViewControllerDataSource {
   func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
      guard let index = _vcs.index(of: viewController), index < _vcs.count - 1 else { return nil }
      return _vcs[index + 1]
   }
   
   func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
      guard let index = _vcs.index(of: viewController), index > 0 else { return nil }
      return _vcs[index - 1]
   }
   
   func presentationCount(for pageViewController: UIPageViewController) -> Int {
      return _vcs.count
   }
   
   func presentationIndex(for pageViewController: UIPageViewController) -> Int {
      return _currentIndex
   }
}

extension OnboardingPageViewController: UIPageViewControllerDelegate {
   func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
      guard completed else { return }
      guard let index = pageViewController.viewControllers?.first?.view.tag else { return }
      _currentIndex = index
      onboardingDelegate?.onboardingPageTransitionCompleted(index: index, in: self)
   }
}
