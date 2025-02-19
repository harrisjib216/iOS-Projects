//
//  Debounce.swift
//  iNihongo
//
//  Created by development on 1/25/25.
//

import Foundation

class Debouncer {
    private var workItem: DispatchWorkItem?
    private let queue: DispatchQueue
    private let delay: TimeInterval

    init(delay: TimeInterval, queue: DispatchQueue = .main) {
        self.delay = delay
        self.queue = queue
    }

    func run(action: @escaping () -> Void) {
        // Cancel any previously scheduled tasks
        workItem?.cancel()
        
        // Create a new work item
        workItem = DispatchWorkItem(block: action)
        
        // Schedule the new work item after the debounce delay
        if let workItem = workItem {
            queue.asyncAfter(deadline: .now() + delay, execute: workItem)
        }
    }
}

