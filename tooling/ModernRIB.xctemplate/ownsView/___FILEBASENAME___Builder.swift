//___FILEHEADER___

import ModernRIBs

public struct ___VARIABLE_productName___Args {
    public let presentationContext: PresentationContext
    public weak var delegate: ___VARIABLE_productName___Delegate?
}

public protocol ___VARIABLE_productName___Dependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
    var presentationContext: PresentationContext { get }
    var delegate: ___VARIABLE_productName___Delegate? { get }
}

final class ___VARIABLE_productName___Component: Component<___VARIABLE_productName___Dependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

public final class ___VARIABLE_productName___Builder: ViewableBuilder {

    public init() {}

    public func build(dependency: ___VARIABLE_productName___Dependency) -> ViewableRouting {
        let component = ___VARIABLE_productName___Component(dependency: dependency)
        let viewController = ___VARIABLE_productName___ViewController()
        let interactor = ___VARIABLE_productName___Interactor(presenter: viewController)
        interactor.delegate = dependency.delegate
        return ___VARIABLE_productName___Router(
            interactor: interactor,
            viewController: viewController,
            dependency: dependency
        )
    }
}
