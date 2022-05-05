//___FILEHEADER___

import Combine
import ModernRIBs

protocol ___VARIABLE_productName___Interactable: Interactable {
    var router: ___VARIABLE_productName___Routing? { get set }
    var delegate: ___VARIABLE_productName___Delegate? { get set }
}

protocol ___VARIABLE_productName___ViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class ___VARIABLE_productName___Router: ViewableRouter<___VARIABLE_productName___Interactable, ___VARIABLE_productName___ViewControllable>, ___VARIABLE_productName___Routing {
    private let dependency: ___VARIABLE_productName___Dependency
    private var lifecycleCancellable: AnyCancellable?

    init(
        interactor: ___VARIABLE_productName___Interactable,
        viewController: ___VARIABLE_productName___ViewControllable,
        dependency: ___VARIABLE_productName___Dependency
    ) {
        self.dependency = dependency
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
        var cancellable: AnyCancellable?
        cancellable = lifecycle.sink(receiveCompletion: { _ in
            dependency.presentationContext.dismiss(
                view: viewController.uiviewController
            )
            cancellable?.cancel()
        }, receiveValue: { value in
            switch value {
            case .didLoad:
                dependency.presentationContext.present(
                    view: viewController.uiviewController
                )
            }
        })
        self.lifecycleCancellable = cancellable
    }
}
