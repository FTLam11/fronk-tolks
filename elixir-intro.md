---

# Intro to Elixir: *Fun* |> ctional |> Programming

## Frank Lam

![Pic](pic link)

Yo

---

# Scope

Let's learn a bit about Elixir and why how it puts the *fun* in
functional programming!

Today I plan on covering:

1. Background of Erlang and Elixir
2. Explain functional vs imperative programming
3. What is the big deal about immutability and concurrency?
4. How is recursion utilized in functional programming?
5. Compare concurrency primitives of various languages

---

# About me

* B.S General Engineering 2010 U of I
* Systems Engineer/Program Manager 2011-2014 DHS
* Technical Writer 2014-2015 Synology
* Chicago Fiery Skippers 2016 Dev Bootcamp
* Software Developer 2017 Larvata

![Personal RPG stats](https://raw.githubusercontent.com/FTLam11/fronk-talks/master/rpg_stats.jpg)

* Grapefruit segmenter extraordinaire

---

# 1. Erlang/Elixir

## Hej Erlang!

* Created by Ericsson, a Swedish telecom company
* Designed with reliability, responsiveness, scalability, and
  availability as main points of emphasis
* Consists of the language, virtual machine, framework, and tools
* Used by WhatsApp, Heroku, Chef, RabbitMQ, financial systems,
  multiplayer games

Example: Ericsson's communication system must support millions of
users/phone calls. One dropped phone call or impacted area cannot
bring the entire system down. Updating the system should not
disconnect calls in progress.

---

# 1. Erlang/Elixir

## Hello Elixir!

* Open source project created by Jose Valim
* Abstracts away Erlang boilerplate
* Cleaner and more compact syntax than Erlang
* Compiles to bytecode run on Erlang virtual machine

---

# 1. Erlang/Elixir

## Example: Addition of two numbers in Erlang

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

# 1. Erlang/Elixir

## Example: Addition of two numbers in Elixir

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

# 2. Functional/Imperative Programming

## 3..2..1..FIGHT!

![Functional vs Imperative](img sauce)

Fight!

---

# 2. Functional/Imperative Programming

## Imperative Programming

Most people learning new languages are likely used to the imperative way
of programming. Starting from procedural code we often develop in this
manner:

* Brute force one giant function to accomplish some number of tasks
* Analyze and extract classes
* Specify what information each class contains
* Add behavior to each class
* Instantiate classes with some initial state
* Call methods on the objects to get some return value and/or invoke
side effects

In short, we end up modeling the real world using classes, creating
objects that hold state, and change the world by calling methods on each
object.

---

# 2. Functional/Imperative Programming

## Functional Programming

An alternate approach is functional programming. Instead of modeling the
world in terms of classes and objects, the main focus is on **data**,
and how to transform it. The workflow becomes something like:

* Brute force one giant function to accomplish some number of tasks
* Analyze and extract **pure** functions that have well defined inputs
and outputs
* When working with changing data, return new copies of it (data is
**immutable**)
* Replace long procedures with chains of function calls

In short, we emphasize the data. Because functions are written to be
pure, in isolation, each function can arguably be more easily understood
in the absence of side effects. What else does functional programming
offer us?

---

# 3. Immutability & Concurrency

## Immutability

The biggest "gotcha" in transitioning from OOP to functional programming
is the concept of immutability. The following compares adding a task to
a todo list in Ruby and Elixir.

![replace me](link)

---

# 3. Immutability & Concurrency

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
    item = TodoItem.new(date, title)
    entries[@auto_id] = item
    @auto_id += 1
    entries
  end
end

list = TodoList.new
list.entries # {}
list.add_entry(Time.now, 'Walk dog')
```

---

# 3. Immutability & Concurrency

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
  end
end

list = TodoList.new
TodoList.entries(list) # %{}
todo = %{date: ~D[2019-10-01], title: "Walk dog"}
list = TodoList.add_entry(list, todo)
TodoList.entries(list)
```

---

# 3. Immutability & Concurrency

## Thoughts on Todo list implementations

You might have noticed that the Elixir version is quite verbose, both in
its definition of the `TodoList` module, as well as its usage! The first
thing to look at is `TodoList.add_entry/2`. Notice that this function
takes `list` as an argument and that it returns a brand new `TodoList`.
This means that the return value for `TodoList.add_entry/2` needs to be
saved, in the example, `list` is reassigned. Since there is no mutating
of data, each change we make typically is saved to a variable for
further work down the line.

---

# 3. Immutability & Concurrency

## So what benefits does immutability give us?

* Promotes usage of pure functions - easy to use, simple to test
* Prevents mutation of shared state - key point for **concurrency**

---


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

`SimpleFibonacci` is a reasonable first attempt at deriving the nth
Fibonacci number. It reads exactly like the mathematical equation. The
issue with this approach is it will be very slow for larger Fibonacci
numbers. For each call of `do_fib` there are *two* recursive calls!
Let's count the number of function calls (shortened to f()):

1: f(1) = 1, O(1)
2: f(2) = 1, O(1)
3: f(3) -> f(2), f(1) = 3, O(n)
4: f(4) -> f(3), f(2) -> f(2), f(1) = 5, O(n)
5: f(5) -> f(4), f(3) -> f(3), f(2), f(2), f(1) -> f(2), f(1) = 9, O(n)
6: 15, O(n)
7: 25, O(n)
8: 41, O(n)
9: 67, O(n)
10: 109, O(n<sup>2</sup>) YIKES!

```elixir
defmodule FastFibonacci do
  def nth_term(n) when n > 0 do
    find(n, 0, 1)
  end

  defp find(1, _, result), do: result

  defp find(n, acc, result) do
    find(n - 1, result, result + acc)
  end
end
```

`FastFibonacci` uses a tail call optimization resulting in a more
performant solution. There is only *one* recursive call. In particular,
`find` calls itself as the last operation, so Elixir does not push
another stack frame (stack level too deep LOL), it instead performs a
"jump statement".
