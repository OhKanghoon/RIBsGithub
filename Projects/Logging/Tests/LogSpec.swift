//
//  LogSpec.swift
//  LoggingTests
//
//  Created by ohkanghoon on 2020/06/08.
//

import TestFoundation

@testable import Logging

final class LogSpec: QuickSpec {
  override func spec() {
    afterEach {
      SwiftyBeaverSpy.clearAll()
    }

    func createLog(with swiftyBeaver: SwiftBeaverProtocol.Type) -> Log {
      return Log(with: swiftyBeaver)
    }

    describe("verbose") {
      it("log verbose with SwiftyBeaver") {
        // given
        let log = createLog(with: SwiftyBeaverSpy.self)

        // when
        log.verbose("Hi")

        // then
        let executions = SwiftyBeaverSpy.verboseExecutions
        expect(executions).to(haveCount(1))
        expect(executions.first?.message as? String) == "Hi"
      }
    }

    describe("debug") {
      it("log debug with SwiftyBeaver") {
        // given
        let log = createLog(with: SwiftyBeaverSpy.self)

        // when
        log.debug("Hi")

        // then
        let executions = SwiftyBeaverSpy.debugExecutions
        expect(executions).to(haveCount(1))
        expect(executions.first?.message as? String) == "Hi"
      }
    }

    describe("info") {
      it("log info with SwiftyBeaver") {
        // given
        let log = createLog(with: SwiftyBeaverSpy.self)

        // when
        log.info("Hi")

        // then
        let executions = SwiftyBeaverSpy.infoExecutions
        expect(executions).to(haveCount(1))
        expect(executions.first?.message as? String) == "Hi"
      }
    }

    describe("warning") {
      it("log warning with SwiftyBeaver") {
        // given
        let log = createLog(with: SwiftyBeaverSpy.self)

        // when
        log.warning("Hi")

        // then
        let executions = SwiftyBeaverSpy.warningExecutions
        expect(executions).to(haveCount(1))
        expect(executions.first?.message as? String) == "Hi"
      }
    }

    describe("error") {
      it("log error with SwiftyBeaver") {
        // given
        let log = createLog(with: SwiftyBeaverSpy.self)

        // when
        log.error("Hi")

        // then
        let executions = SwiftyBeaverSpy.errorExecutions
        expect(executions).to(haveCount(1))
        expect(executions.first?.message as? String) == "Hi"
      }
    }
  }
}
