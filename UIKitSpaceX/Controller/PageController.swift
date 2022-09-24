//
//  MainPageController.swift
//  UIKitSpaceX
//
//  Created by Виктор Черкасов on 26.08.2022.
//

import UIKit

class PageController: UIPageViewController {
    var rockets = [Rocket]()
    var launches = [Launch]()
    
    lazy var views: [RocketMainController] = {
        var controllers = [RocketMainController]()
        for rocket in rockets {
            controllers.append(RocketMainController(rocket: rocket, launch: launchesFor(rocket)))
        }
        return controllers
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        congigControllers()
    }
    
    override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal)
        self.dataSource = self
        self.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func launchesFor(_ rocket: Rocket) -> [Launch] {
        return launches.filter{ $0.rocket == rocket.id }
    }
    
    func congigControllers() {
        setViewControllers([views[0]], direction: .forward, animated: true)
    }
}

extension PageController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewController = viewController as? RocketMainController else {return nil}
        if let index = views.index(of: viewController) {
            return index > 0 ? views[index - 1] : nil
        }
        return nil
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewController = viewController as? RocketMainController else {return nil}
        if let index = views.index(of: viewController) {
            return index < views.count - 1 ? views[index + 1] : nil
        }
        return nil
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return 4
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
}
