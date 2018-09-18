//
// Created by Eugene Kazaev on 11/09/2018.
//

import Foundation
import UIKit

/// Helper class to build a chain of steps. Can not be used directly.
public struct StepChainAssembly<C> {

    let previousSteps: [RoutingStep]

    /// Constructor
    init() {
        self.previousSteps = []
    }

    init(previousSteps: [RoutingStep]) {
        self.previousSteps = previousSteps
    }

    /// Adds a single step to the chain
    ///
    /// - Parameter previousStep: The instance of `StepWithActionAssemblable`
    public func from<F: Finder, FC: AbstractFactory>(_ step: StepWithActionAssembly<F, FC>) -> ActionConnectingAssembly<F, FC, C>
            where F.ViewController == FC.ViewController, F.Context == FC.Context {
        return ActionConnectingAssembly(stepToFullFill: step, previousSteps: previousSteps)
    }

    /// Adds a `RoutingStep` to the chain. This step will be the last one in the chain.
    ///
    /// - Parameter previousStep: The instance of `RoutingStep`
    public func from<AC>(_ step: DestinationStep<AC>) -> LastStepInChainAssembly<C> {
        var previousSteps = self.previousSteps
        previousSteps.append(step)
        return LastStepInChainAssembly(previousSteps: previousSteps)
    }

    /// Assembles all the provided settings.
    ///
    /// - Parameter step: An instance of `RoutingStep` to start to build a current step from.
    /// - Returns: An instance of `RoutingStep` with all the provided settings inside.
    public func assemble<AC>(from step: DestinationStep<AC>) -> DestinationStep<C> {
        var previousSteps = self.previousSteps
        previousSteps.append(step)
        return LastStepInChainAssembly<C>(previousSteps: previousSteps).assemble()
    }

}