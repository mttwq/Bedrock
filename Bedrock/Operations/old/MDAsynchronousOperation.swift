//
//  MDAsynchronousOperation.swift
//  Bedrock
//
//  Created by Matt Quiros on 01/03/2017.
//  Copyright © 2017 Matt Quiros. All rights reserved.
//

import Foundation

open class MDAsynchronousOperation<ResultType>: MDOperation<ResultType> {
    
    open override func main() {
        fatalError("Unimplemented \(#function)")
    }
    
    public func finish() {
        self.willChangeValue(forKey: "isExecuting")
        self._executing = false
        self.didChangeValue(forKey: "isExecuting")
        
        self.willChangeValue(forKey: "isFinished")
        self._finished = true
        self.didChangeValue(forKey: "isFinished")
    }
    
    // MARK: NSOperation required overrides
    
    fileprivate var _executing = false
    fileprivate var _finished = false
    
    open override var isConcurrent: Bool {
        return true
    }
    
    open override var isAsynchronous: Bool {
        return true
    }
    
    open override var isExecuting: Bool {
        return self._executing
    }
    
    open override var isFinished: Bool {
        return self._finished
    }
    
    open override func start() {
        guard self.isCancelled == false &&
            self.hasFailedDependencies == false &&
            self.shouldExecute()
            else {
                self.willChangeValue(forKey: "isFinished")
                self._finished = true
                self.didChangeValue(forKey: "isFinished")
                return
        }
        
        self.willChangeValue(forKey: "isExecuting")
        Thread.detachNewThreadSelector(#selector(main), toTarget: self, with: nil)
        self._executing = true
        self.didChangeValue(forKey: "isExecuting")
    }
    
}