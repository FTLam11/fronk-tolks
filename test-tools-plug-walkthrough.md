---

# GameFAQs: Rambo XXX: Ocarina of Time
## Frank Lam

![New Game+ Start](https://media.giphy.com/media/RBK9izWXCsV44/giphy.gif)

New Game+ Start!!!

---

# Scope

The last talk was a high level overview of testing and how it could
influence our design. This talk expands on the actual implementation by
covering common libraries + tools and a few demos of different test
types.

The topics for this talk are:

1. Review of Test Hierarchy, test writing conventions
2. Introduce variety of test libraries + tools
3. Describe an ideal development workflow w/ testing
4. Show examples of different test types
5. Reimplement a class purely based on tests

---

# 1. Obligatory anime flashback

![Squirtle squad](https://media.giphy.com/media/eSwGh3YK54JKU/giphy.gif)

1. [Test
   Hierarchy](https://github.com/FTLam11/fronk-tolks/blob/master/we-talkin-bout-testing.md#test-hierarchy)
2. [Slides](https://docs.google.com/presentation/d/12SjaioLqcF3ycD3V9jXfax5OucdB-IMaJcDWYO4gGgg/edit?usp=sharing)
3. [Test Double Wiki](https://github.com/testdouble/contributing-tests/wiki)

---

# 2. Test Libraries + Tools
## A smorgasbord of options

* Core libraries (test structure, runner, formatting, DSL)
* Expectation/assertion libraries
* Mocking libraries
* BDD frameworks
* Test coverage
* Factories
* Web drivers
* IDE/Editor Plugins
* Utility/miscellaneous

---

# 3. Cultivating a test-based workflow
## Pick your items/weapons

* IDE/text editor
* Programming language
* Right tools for different tests

{.column}

* Think about what ideal production code should look like (Design)
* Write a failing test
* Write **minimal** code required to pass test
* Refactor

---

# 4-1. Unit Tests
## Grinding levels + experience

![OHKO](https://media.giphy.com/media/xT9IgBn4UAxjDcM3hS/source.gif)

Unit tests are the easiest tests to write, quick n EZ. They test a
single unit in isolation.

* Test only the public API
* Demo!

---

# 4-2 Integration Tests
## Miniboss fight time

![Bosses](https://media.giphy.com/media/mZQBUN7vKBXFe/giphy.gif)

* Test units together
* Often involves interacting with framework
* Demo!

---

# 4-3 Acceptance Tests
## Impossible final boss fight

Yeah I don't wanna talk about this.

![On second though, nah](https://media.giphy.com/media/d1PvAirswFXWg/giphy.gif)

---

# 5. Deep dive
## Let's break something and reimplement it

![Hope this dive goes ok](https://media.giphy.com/media/26tP3KaWsDnT47VMk/source.gif)

* Let us observe how tests function also as documentation
* Demo!
