//
//  Matchers.swift
//  TestFoundation
//
//  Created by ohkanghoon on 2020/06/08.
//

import Nimble

public extension Expectation {
  func to<U>(_ matcher: (@escaping (T) -> U) -> Predicate<T>, _ predicate: @escaping (T) -> U) {
    self.to(matcher(predicate))
  }

  func to<U>(_ matcher: (@escaping (T.Iterator.Element) -> U) -> Predicate<T>, _ predicate: @escaping (T.Iterator.Element) -> U) where T: Sequence {
    self.to(matcher(predicate))
  }

  func toNot<U>(_ matcher: (@escaping (T) -> U) -> Predicate<T>, _ predicate: @escaping (T) -> U) {
    self.toNot(matcher(predicate))
  }

  func toNot<U>(_ matcher: (@escaping (T.Iterator.Element) -> U) -> Predicate<T>, _ predicate: @escaping (T.Iterator.Element) -> U) where T: Sequence {
    self.toNot(matcher(predicate))
  }

  func notTo<U>(_ matcher: (@escaping (T) -> U) -> Predicate<T>, _ predicate: @escaping (T) -> U) {
    self.toNot(matcher, predicate) // alias to `toNot()`
  }

  func notTo<U>(_ matcher: (@escaping (T.Iterator.Element) -> U) -> Predicate<T>, _ predicate: @escaping (T.Iterator.Element) -> U) where T: Sequence {
    self.toNot(matcher, predicate) // alias to `toNot()`
  }
}

public func match<T>(_ closure: @escaping (T) -> Bool) -> Predicate<T> {
  return Predicate { actualExpression in
    guard let actualValue = try actualExpression.evaluate() else {
      return PredicateResult(status: .fail, message: .fail("Found nil"))
    }
    return PredicateResult(
      status: closure(actualValue) ? .matches : .doesNotMatch,
      message: .fail("got <\(actualValue)>")
    )
  }
}

public func contain<T>(_ closure: @escaping (T.Iterator.Element) -> Bool) -> Predicate<T> where T: Sequence {
  return Predicate { actualExpression in
    guard let actualValue = try actualExpression.evaluate() else {
      return PredicateResult(status: .fail, message: .fail("Found nil"))
    }
    return PredicateResult(
      bool: actualValue.contains(where: closure),
      message: .fail("got <\(actualValue)>")
    )
  }
}

public func haveCount<T>(_ expectedCount: Int) -> (@escaping (T.Iterator.Element) -> Bool) -> Predicate<T> where T: Collection {
  return { closure in
    return Predicate { actualExpression in
      guard let actualValue = try actualExpression.evaluate() else {
        return PredicateResult(status: .fail, message: .fail("Found nil"))
      }
      let actualCount = actualValue.lazy.filter(closure).count
      let result = actualCount == expectedCount
      let message = ExpectationMessage.expectedCustomValueTo(
        "have \(prettyCollectionType(actualValue)) with count \(stringify(expectedCount))",
        "\(actualCount)"
      )
      return PredicateResult(bool: result, message: message)
    }
  }
}

