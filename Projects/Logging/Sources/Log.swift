//
//  Log.swift
//  Logging
//
//  Created by ohkanghoon on 2020/06/08.
//

import SwiftyBeaver

public final class Log {

  // MARK: Properties

  let console: ConsoleDestination = {
    let console = ConsoleDestination()
    console.format = "$DHH:mm:ss$d $L $M"
    return console
  }()
  private let log: SwiftBeaverProtocol.Type


  // MARK: Initializing

  init(with log: SwiftBeaverProtocol.Type) {
    self.log = log
    self.log.addDestination(console)
  }


  // MARK: Logging

  public func verbose(_ message: Any, _ file: String = #file, _ function: String = #function, line: Int = #line, context: Any? = nil) {
    self.log.verbose(message, file, function, line: line, context: context)
  }

  public func debug(_ message: Any, _ file: String = #file, _ function: String = #function, line: Int = #line, context: Any? = nil) {
    self.log.debug(message, file, function, line: line, context: context)
  }

  public func info(_ message: Any, _ file: String = #file, _ function: String = #function, line: Int = #line, context: Any? = nil) {
    self.log.info(message, file, function, line: line, context: context)
  }

  public func warning(_ message: Any, _ file: String = #file, _ function: String = #function, line: Int = #line, context: Any? = nil) {
    self.log.warning(message, file, function, line: line, context: context)
  }

  public func error(_ message: Any, _ file: String = #file, _ function: String = #function, line: Int = #line, context: Any? = nil) {
    self.log.error(message, file, function, line: line, context: context)
  }
}
