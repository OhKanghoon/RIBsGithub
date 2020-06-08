//
//  SwiftyBeaverSpy.swift
//  LoggingTests
//
//  Created by ohkanghoon on 2020/06/08.
//

import SwiftyBeaver

@testable import Logging

final class SwiftyBeaverSpy: SwiftBeaverProtocol {

  typealias LogParameter = (message: Any, file: String, function: String, line: Int, context: Any?)

  private(set) static var verboseExecutions: [LogParameter] = []
  private(set) static var debugExecutions: [LogParameter] = []
  private(set) static var infoExecutions: [LogParameter] = []
  private(set) static var warningExecutions: [LogParameter] = []
  private(set) static var errorExecutions: [LogParameter] = []

  static func addDestination(_ destination: BaseDestination) -> Bool {
    return true
  }

  static func verbose(_ message: @autoclosure () -> Any, _ file: String, _ function: String, line: Int, context: Any?) {
    self.verboseExecutions.append((message: message(), file: file, function: function, line: line, context: context))
  }

  static func debug(_ message: @autoclosure () -> Any, _ file: String, _ function: String, line: Int, context: Any?) {
    self.debugExecutions.append((message: message(), file: file, function: function, line: line, context: context))
  }

  static func info(_ message: @autoclosure () -> Any, _ file: String, _ function: String, line: Int, context: Any?) {
    self.infoExecutions.append((message: message(), file: file, function: function, line: line, context: context))
  }

  static func warning(_ message: @autoclosure () -> Any, _ file: String, _ function: String, line: Int, context: Any?) {
    self.warningExecutions.append((message: message(), file: file, function: function, line: line, context: context))
  }

  static func error(_ message: @autoclosure () -> Any, _ file: String, _ function: String, line: Int, context: Any?) {
    self.errorExecutions.append((message: message(), file: file, function: function, line: line, context: context))
  }

  static func clearAll() {
    self.verboseExecutions.removeAll()
    self.debugExecutions.removeAll()
    self.infoExecutions.removeAll()
    self.warningExecutions.removeAll()
    self.errorExecutions.removeAll()
  }
}
