//
//  Copyright (c) 2017. Uber Technologies
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

import Foundation

public protocol ViewableBuilder {
    associatedtype Dependency

    func build(dependency: Dependency) -> ViewableRouting
}

public struct ScopedViewableBuilder<Args>: ViewableBuilder {
    public let builder: (Args) -> ViewableRouting

    public func build(dependency: Args) -> ViewableRouting {
        builder(dependency)
    }
}

public extension ViewableBuilder {
    func scoped<T>(_ builder: @escaping (T) -> Dependency) -> ScopedBuilder<T> {
        ScopedBuilder{ args -> Routing in
            self.build(dependency: builder(args))
        }
    }
}
