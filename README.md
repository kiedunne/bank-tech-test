[![Build Status](https://travis-ci.org/kiedunne/bank-tech-test.svg?branch=master)](https://travis-ci.org/kiedunne/bank-tech-test)
[![Coverage Status](https://coveralls.io/repos/github/kiedunne/bank-tech-test/badge.svg?branch=master)](https://coveralls.io/github/kiedunne/bank-tech-test?branch=master)
[![codecov](https://codecov.io/gh/kiedunne/bank-tech-test/branch/master/graph/badge.svg)](https://codecov.io/gh/kiedunne/bank-tech-test)
Bank Tech Test
=================

### Local Setup

```
git clone https://github.com/kiedunne/bank-tech-test.git
cd bank-tech-test
bundle install
```

### Run Tests

```
rspec
```

### Technology

* Ruby
* RSpec
* Rubocop
* Coveralls
* SimpleCov
* Travis CI

### Approach

* Review program requirements and diagram potential classes and their methods
* Write a feature test in pseudo code, then break down into smaller unit unit
* Write unit test, let it fail, then implement small lines of code to pass each unit test
* Refactor each class in line with the Single Responsibility Principle(SRP)
* Commit changes
* Repeat process for each unit test

### Requirements

* You should be able to interact with your code via a REPL like IRB or the JavaScript console.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012  
**And** a deposit of 2000 on 13-01-2012  
**And** a withdrawal of 500 on 14-01-2012  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```
