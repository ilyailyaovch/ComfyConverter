//
//  AppCoordinator.swift
//  ComfyConverter
//
//  Created by Ilya Ovchinnikov on 08.06.2024.
//

import Foundation

import UIKit
import class Combine.AnyCancellable
import class SwiftUI.UIHostingController

class AppCoordinator: _AppCoordinator {
    
    let window: UIWindow
    
    private var cancellables = Set<AnyCancellable>()

    init(window: UIWindow) {
        self.window = window
    }

    var navigationController: UINavigationController! {
        window.rootViewController as? UINavigationController
    }

    /// Начало работы
    func start() {
        showLaunchScreen()
        Task { @MainActor [weak self] in
            self?.showListScreen()
        }
    }

    /// Экран загрузки
    private func showLaunchScreen() {
        let storyboard = UIStoryboard(name: "LaunchScreen", bundle: nil)
        guard
            let viewController = storyboard.instantiateInitialViewController()
        else { fatalError("Could not instantiate initial view controller from storyboard") }
        window.rootViewController = viewController
    }

    /// Главный экран
    private func showListScreen() {
        let viewModel = CurrencyListViewModel()
        viewModel.didNavigateForvard
            .sink { [weak self] (val) in self?.showDetailScreen(val) }
            .store(in: &cancellables)
        let view = CurrencyListView().environmentObject(viewModel)
        let controller = UIHostingController(rootView: view)
        let nav = UINavigationController(rootViewController: controller)
        nav.navigationBar.isHidden = true
        window.rootViewController = nav
    }

    /// Экран деталей №1
    private func showDetailScreen(_ val: String) {
        let viewModel = CurrencyDetailsViewModel(val: val)
        viewModel.didNavigateBack
            .sink { [weak self] in self?.navigationController.popViewController(animated: true) }
            .store(in: &cancellables)
        viewModel.didNavigateForvard
            .sink { [weak self] in self?.showDetailScreen_2() }
            .store(in: &cancellables)
        let view = CurrencyDetailsView().environmentObject(viewModel)
        let controller = UIHostingController(rootView: view)
        navigationController.pushViewController(controller, animated: true)
    }
    
    /// Экран деталей №2
    private func showDetailScreen_2() {
        let viewModel = CurrencyDetailsViewModel_2()
        viewModel.didNavigateBack
            .sink { [weak self] in self?.navigationController.popViewController(animated: true) }
            .store(in: &cancellables)
        viewModel.didNavigateForvard
            .sink { [weak self] in self?.showDetailScreen_3() }
            .store(in: &cancellables)
        let view = CurrencyDetailsView_2().environmentObject(viewModel)
        let controller = UIHostingController(rootView: view)
        navigationController.pushViewController(controller, animated: true)
    }
    
    /// Экран деталей №3
    private func showDetailScreen_3() {
        let viewModel = CurrencyDetailsViewModel_3()
        viewModel.didNavigateBack
            .sink { [weak self] in self?.navigationController.popToRootViewController(animated: true) }
            .store(in: &cancellables)
        let view = CurrencyDetailsView_3().environmentObject(viewModel)
        let controller = UIHostingController(rootView: view)
        navigationController.pushViewController(controller, animated: true)
    }
}
