//
//  MatchersSpec.swift
//  TestFoundationTests
//
//  Created by ohkanghoon on 2020/06/08.
//

import Nimble
import Quick
import TestFoundation

final class MatchersSpec: QuickSpec {
  override func spec() {
    describe("match()") {
      it("expects to match") {
        expect(1).to(match) { $0 == 1 }
      }

      it("expects to not math") {
        expect(1).toNot(match) { $0 == 2 }
      }

      it("expects not to match") {
        expect(1).notTo(match) { $0 == 3 }
      }
    }

    describe("contain()") {
      it("expects to contain") {
        expect([5, 6, 7]).to(contain) { $0 == 5 }
      }

      it("expects to not contain") {
        expect([5, 6, 7]).toNot(contain) { $0 == 4 }
      }

      it("expects not to contain") {
        expect([5, 6, 7]).notTo(contain) { $0 == 3 }
      }
    }

    describe("haveCount()") {
      it("expects to have count") {
        expect([5, 6, 7, 8]).to(haveCount(2)) { $0 % 2 == 0 }
      }

      it("expects to not have count") {
        expect([5, 6, 7]).toNot(haveCount(1)) { $0 > 3 }
      }

      it("expects not to have count") {
        expect([5, 6, 7]).notTo(haveCount(2)) { $0 < 3 }
      }
    }
  }
}
