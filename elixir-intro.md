---

# Intro to Elixir: *Fun* |> ctional |> Programming

## Frank Lam

![Alchemy Elixir](https://media.giphy.com/media/uAHJry9uTRDtm/source.gif)

Yo

---

# Scope

Let's learn about Elixir and how it puts the *fun* in functional programming!

Today we will explore these topics:

1. Background of Erlang and Elixir
2. Functional programming (FP) and OOP
3. Immutability and concurrency
4. How Elixir uses recursion
5. Preview Elixir concurrency

---

# About me

* B.S General Engineering 2010 U of I
* Systems Engineer/Program Manager 2011-2014 DHS
* Technical Writer 2014-2015 Synology
* Chicago Fiery Skippers 2016 Dev Bootcamp
* Software Developer 2017 Larvata

![Personal RPG stats](https://raw.githubusercontent.com/FTLam11/fronk-talks/master/rpg_stats.jpg)

* **Grapefruit segmenter extraordinaire**

---

# 1. Erlang/Elixir

## Hej Erlang!

* Created by Ericsson, a Swedish telecom company
* Designed with emphasis on reliability, responsiveness, scalability, and
  availability
* Consists of the language, virtual machine, framework, and tools
* Primary use case was to solve telecom problems, but usage has expanded
into more general software domains
* Used by WhatsApp, Heroku, Chef, RabbitMQ, Discord, Bleacher Report,
Pinterest, financial systems, multiplayer games

---

## Hello Elixir!

* Open source project created by Jose Valim
* Abstracts away Erlang boilerplate
* Has cleaner and more compact syntax than Erlang
* Compiles to bytecode run on Erlang virtual machine
* Has a web framework [Pheonix](https://phoenixframework.org/) similar
to [Rails](https://rubyonrails.org/) for Ruby

---

## Example: Adding two numbers in Erlang

```erlang
-module(sum_server).
-behaviour(gen_server).

-export([
  start/0, sum/3,
  init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2,
  code_change/3
])

start() -> gen_server:start(?MODULE, [], []).
sum(Server, A, B) -> gen_server:call(Server, {sum, A, B}).
init(_) -> {ok, undefined}.
handle_call({sum, A, B}, _From, State) -> {reply, A + B, State}.
handle_cast(_Msg, State) -> {noreply, State}.
handle_info(_Info, State) -> {noreply, State}.
terminate(_Reason, _State) -> ok.
code_change(_OldVsn, State, _Extra) -> {ok, State}.
```

---

## Example: Adding two numbers in Elixir

```elixir
defmodule SumServer do
  use GenServer

  def start do
    GenServer.start(__MODULE__, nil)
  end

  def sum(server, a, b) do
    GenServer.call(server, {:sum, a, b})
  end

  def handle_call({:sum, a, b}, _from, state) do
    {:reply, a + b, state}
  end
end

server = SumServer.start
SumServer.sum(server, 1, 1) # 2
```
---

# 2. FP/OOP

## 3..2..1..FIGHT!

![Functional vs OOP](https://66.media.tumblr.com/a72f06c21147341407ca86328a556b18/tumblr_n3iaze8w5G1s3my1ro3_400.gifv)

Fight!

---

## OOP

![OOP](https://www.mememaker.net/api/bucket?path=static/img/memes/full/2019/Jun/16/10/oop-6481.png)

Most people embarking on their programming journey are likely to start by
learning OOP. **Activity:** *Survey audience first language*

An OOP development workflow:

* Brute force blobs of code to accomplish some tasks
* Analyze and extract classes
* Specify data/behavior by defining attributes and exposing public methods
* Replace code blobs by instantiating objects with initial state and
then calling methods on the objects to get some return value and/or
cause side effects

In OOP, we model the real world by creating objects that hold state, and
call methods to change state.

---

## FP

![FP](https://miro.medium.com/max/800/1*8WJq7MMSJ26UgAuMWXTbYQ.png)

Instead of emphasizing objects, the main focus is on **data** and how to
transform it.

A FP development workflow:

* Brute force blobs of code to accomplish some tasks
* Analyze and extract functions
* Always return new copies of data when mutating data (data is **immutable**)
* Replace code blobs with function call chains

Because functions are written to be pure and isolated, each function can
arguably be more easily understood in the absence of side effects.
What else does FP offer us?

## Which one is better?

![Programming humor](https://i.imgur.com/H4uaq47.jpg)

This is a trap question and out of scope for this talk. There is too
much information to analyze. From what I've read, it seems to be a pretty
controversial topic, full of spicy drama. Below are some links to FP discussions:

* [The main benefits of FP](https://www.quora.com/What-is-so-great-about-functional-programming-What-are-the-main-points-of-it-and-why-are-they-useful)
* [Why isn't FP more popular?](https://www.quora.com/Why-isnt-functional-programming-that-popular-even-though-its-so-beneficial)

---

# 3. Immutability & Concurrency

## Immutability

One of the challenges in transitioning from OOP to FP is the concept of
immutability and how it affects shared state. The following compares
OOP/FP approaches for adding a task to a todo list.

---

## Todo list in Ruby

```ruby
class TodoList
  TodoItem = Struct.new(:date, :title)

  attr_reader :entries

  def initialize
    @auto_id = 1
    @entries = {}
  end

  def add_entry(date, title)
    entries[@auto_id] = TodoItem.new(date, title)
    @auto_id += 1
    entries
  end
end

list = TodoList.new
list.entries # {}
list.add_entry(Time.now, 'Walk dog')
```

---

## Todo list in Elixir

```elixir
defmodule TodoList do
  defstruct auto_id: 1, entries: %{}

  def new(), do: %TodoList{}

  def add_entry(list, entry = %{date: _, title: _}) do
    entry = Map.put(entry, :id, list.auto_id)
    new_entries = Map.put(list.entries, list.auto_id, entry)

    %TodoList{list | auto_id: list.auto_id + 1, entries: new_entries}
  end

  def entries(list) do
    list.entries
    |> Enum.map(fn({_, entry}) ->
      %{date: entry.date, title: entry.title}
    end)
  end
end

list = TodoList.new
TodoList.entries(list) # %{}
todo = %{date: ~D[2019-10-01], title: "Walk dog"}
list = TodoList.add_entry(list, todo)
TodoList.entries(list)
```

---

## Comparing Todo list implementations

The Ruby version is a familiar approach. A `list` object is instantiated
and methods are directly called on it. `TodoList#add_entry` mutates the `list`
object. Nothing surprising to see here.

The Elixir version is more verbose, both in its definition of the `TodoList`
module, as well as its usage! `TodoList.add_entry/2` takes `list` and
`entry` arguments and returns a **brand new** `TodoList`.  The return value for
`TodoList.add_entry/2` is saved by reassigning `list`. Since data is
immutable, each new state is saved to a variable if it needs to be used later.

---

## So what benefits does immutability give us?

* Promotes pure functions - easy to reason about, simple to test
* Minimizes the effects of invalid state - data transformed by
multiple functions still exists in its original form (rollbacks for
data!)
* Efficient memory management - new copies of data reuse as much of
the old data as possible, only making shallow copies when needed
* Prevents mutation of shared state - key point for **concurrency**

---

## Concurrency

[Concurrency](https://stackoverflow.com/questions/1050222/what-is-the-difference-between-concurrency-and-parallelism)
is multitasking. It is not the same as parallelism, which is doing multiple
tasks at the same time. Concurrent tasks can be executed, interrupted, and
finished in overlapping time.

Check the following links to learn more about how concurrency is
implemented.

* [JavaScript](https://developer.mozilla.org/en-US/docs/Web/JavaScript/EventLoop)
* [Ruby](https://engineering.universe.com/introduction-to-concurrency-models-with-ruby-part-i-550d0dbb970)
* [PHP](https://amphp.org/)
* [Python](https://realpython.com/python-concurrency/)
* [Go](https://tour.golang.org/concurrency/1)
* [Java](https://docs.oracle.com/javase/tutorial/essential/concurrency/)

---

# 4. Recursion

## What happened to iteration?

* We often use iteration to loop through collections and perform work
* Though Elixir doesn't have loops... 😰, it has lots of fun though...
* We can use higher-order functions which abstract away recursive functions

```elixir
defmodule Fun do
  def so_fun(count) when count > 0 do
    1..count |> Enum.map(fn(_) -> "SO FUN" end) |> Enum.join(" ")
  end

  def very_fun(count) when count > 0 do
    (for _ <- 1..count, into: [], do: "VERY FUN") |> Enum.join(" ")
  end

  def super_fun(count) when count > 0 do
    do_fun(count, [])
  end

  defp do_fun(0, result), do: Enum.join(result, " ")

  defp do_fun(count, result) do
    do_fun(count - 1, ["SUPER FUN" | result])
  end
end
```

* `Fun.so_fun/1` uses the pipe operator `|>` to transform data via
chained function calls, it is similar to Unix piping `|`.
* `Fun.super_fun/1` uses a feature called
[comprehensions](https://elixir-lang.org/getting-started/comprehensions.html)
that uses syntactic sugar to give us an iteration-like mechanism.
* `Fun.very_fun/1` uses recursion, multi-clause functions, and pattern matching.

---

## Higher-order functions in Elixir

Elixir has an `Enumerable` module used to work with collections.
`Enumerable.map/2` iterates through the collection and yields each member
to the callback function. The source code is below:

```elixir
def map(enumerable, fun) do
  reducer = fn x, acc -> {:cont, [fun.(x) | acc]} end
  Enumerable.reduce(enumerable, {:cont, []}, reducer) |> elem(1) |> :lists.reverse()
end
```

`reducer` returns a tuple containing two elements, an **atom** that tells
Elixir to **continue** iterating through the collection,
and a list that accumulates the result of the input function `fun` being
called on the current input `x`.

The actual work is done by `Enumerable.reduce/3`, written as a
**multi-clause function**, a common pattern in Elixir. **Pattern
matching** is another often used tool in Elixir. The input arguments are
matched against to determine which function to call. The order in
which the clauses are defined matters, Elixir matches clauses from top to bottom.

```elixir
def reduce(_list, {:halt, acc}, _fun), do: {:halted, acc}
def reduce(list, {:suspend, acc}, fun), do: {:suspended, acc, &reduce(list, &1, fun)}
def reduce([], {:cont, acc}, _fun), do: {:done, acc}
def reduce([head | tail], {:cont, acc}, fun), do: reduce(tail, fun.(head, acc), fun)
```

Let's walk through the last two clauses:

1. Is the input collection empty (`[]`)? Return `{:done, acc}`, meaning
that the execution is done, and the result is `acc`. Stop execution!
2. The input collection is not empty. Use pattern matching and the cons
`|` operator to save the first member to `head` and the rest to `tail`.
The cons operator is like `unshift` in Ruby and JavaScript.
3. Continue breaking the problem down by calling the same function with
new arguments. Go back to step 1.

Now we've seen how Elixir uses a combination of recursion, multi-clause
functions, and pattern matching to circumvent immutability and the
absence of iteration. Recursive thinking can be considered another big
adjustment coming from OOP to FP. For more information and practice,
check out [The Little Schemer](http://www.ccs.neu.edu/home/matthias/BTLS/).

---

## Fibonacci Recursion Demo

The definition for the [Fibonacci sequence](https://en.wikipedia.org/wiki/Fibonacci_number) is:

Given F<sub>0</sub> = 0, F<sub>1</sub> = 1, when *n* > 1, then:
F<sub>n</sub> = F<sub>n - 1</sub> + F<sub>n - 2</sub>. Here is a first
attempt using Elixir:


```elixir
defmodule SimpleFibonacci do
  def nth_term(n) when n > 0 do
    do_fib(n)
  end

  defp do_fib(1), do: 0

  defp do_fib(2), do: 1

  defp do_fib(n) do
    do_fib(n - 1) + do_fib(n - 2)
  end
end
```

`SimpleFibonacci` is a reasonable first attempt at deriving the n<sup>th</sup>
Fibonacci number. It reads exactly like the mathematical definition. The
issue with this approach is it will be very slow for larger Fibonacci
numbers. For each call of `do_fib(n)` there are *two* recursive calls!
Let's count the number of function calls (shortened to f()):

| Function Calls                                           | Function Count | Big O                   |
|----------------------------------------------------------|----------------|-------------------------|
| f(1)                                                     | 1              | O(1)                    |
| f(2)                                                     | 1              | O(1)                    |
| f(3), f(2) + f(1)                                        | 3              | O(n)                    |
| f(4), f(3) + f(2), f(2) + f(1)                           | 5              | O(n)                    |
| f(5), f(4) + f(3), f(3) + f(2), f(2) + f(1), f(2) + f(1) | 9              | O(n)                    |
| f(6) (omitted)                                           | 15             | O(n)                    |
| f(7) (omitted)                                           | 25             | O(n)                    |
| f(8) (omitted)                                           | 41             | O(n)                    |
| f(9) (omitted)                                           | 67             | O(n)                    |
| f(10) (omitted)                                          | 109            | O(n<sup>2</sup>) YIKES! |

```elixir
defmodule FastFibonacci do
  def nth_term(n) when n > 0 do
    find(n, 0, 1)
  end

  defp find(1, 0, _), do: 1

  defp find(1, _, result), do: result

  defp find(n, acc, result) do
    find(n - 1, result, result + acc)
  end
end
```

`FastFibonacci` uses [tail call
optimization](https://en.wikipedia.org/wiki/Tail_call) resulting in a more
performant solution. The worst case time complexity is O(n). One interesting
thing that Elixir does for tail calls is it does not push another stack
frame (stack level too deep LOL) for tail calls. It instead performs a
"jump statement", so there is no additional memory penalty incurred.

---

# 5. Concurrency in Elixir/Erlang

![BEAM](https://raw.githubusercontent.com/FTLam11/fronk-tolks/feat/ftl-intro-elixir-talk/erlang_concurrency_diagram.png)

The basic concurrency primitive is called an **Erlang process**. It is not
related at all to CPU processes or threads. Erlang processes are super
light-weight; typical Erlang systems often run thousands or millions of
Erlang processes.

In a typical scenario, the BEAM (Erlang virtual machine) runs inside
one OS process and has a number schedulers each running in a thread equal
to the number of CPU cores. The schedulers efficiently manage running
processes, allowing work to be done concurrently and in parallel.

---

## Fibonacci List Demo

```elixir
defmodule Fibonacci do
  def next_after(target) do
    find_next(target, 1, 0, 1)
  end

  defp find_next(target, _term_count, _acc, next) when next > target do
    next
  end

  defp find_next(target, term_count, acc, next) do
    find_next(target, term_count + 1, next, next + acc)
  end
end

defmodule NextFibonacci do
  def run(list) do
    Enum.map(list, fn(num) ->
      run_concurrently(self(), num)
      receive do
        {:ok, next} -> next
      end
    end)
  end

  def run_serial(list) do
    Enum.map(list, &Fibonacci.next_after/1)
  end

  defp run_concurrently(caller, number) do
    spawn(fn ->
      send(caller, {:ok, Fibonacci.next_after(number)})
    end)
  end
end
```

Time for some benchmark tests! Let's create a list of `1_000_000`
random large positive integers. We will benchmark `NextFibonacci.run/1`
and `NextFibonacci.run_serial/1`. **Activity** *Vote for faster
function*

# SPOILERS BELOW
# SPOILERS BELOW
# SPOILERS BELOW
# SPOILERS BELOW
# SPOILERS BELOW
# SPOILERS BELOW
# SPOILERS BELOW
# SPOILERS BELOW
# SPOILERS BELOW
# SPOILERS BELOW

___

Wait, the concurrent version is *slower* than the serial one? What gives
dawg, this is a scam and I demand a refund! Here are some reasons why
the serial version is performing faster than the concurrent version:

* `Fibonacci.next_after/1` is really fast, if the callback function was
slower we would likely see the concurrent function performing better
* There is some overhead with spawning processes and processing messages
for the concurrent version.

This shows concurrency is not always the solution for writing
performant code. The usual boring answer applies here: it depends!

___
