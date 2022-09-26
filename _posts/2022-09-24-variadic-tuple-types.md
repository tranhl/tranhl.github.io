---
layout: post
title: "Obscure TypeScript: Variadic Tuple Types"
category: typescript
---

Let's say that you are writing a function that concatenates the contents of two arrays
together, and you want to be able to express that somehow within the function's types.
For simplicity's sake, let's assume that both arrays contain only strings:

~~~ts
function concat(a: string[], b: string[]): string[];
~~~

While these types are _technically_ correct, they don't offer much assurance around the
correctness of the output. For example, a programmer that doesn't know any better could
satisfy the checker by doing this:

~~~ts
function concat(a: string[], b: string[]): string[] {
  return a;
}
~~~

The TypeScript compiler would happily compile this function, but there would be a pretty
nasty logical error you'll have to deal with. We could potentially address this by
adding some overloads:

~~~ts
function concat(a: string[], b: string[]): string[];

function concat<A extends string>(a: [A], b: []): [A];
function concat<A extends string, B extends string>(a: [A, B], b: []): [A, B];
// And so on....
~~~

But as you can see, we would have to create overloads with generics for every possible
combination, which would not scale at all. We would only be able to express correct
types for the overloads that we write.

A better way of typing this would be to instead declare the output as an array that
contains elements from either `a` or `b`:

~~~ts
function concat<A, B>(a: readonly A[], b: readonly B[]): Array<A | B>;

const a = ["1", "2", "3"] as const;
const b = ["a", "b", "c"] as const;

const output = concat(a, b);
~~~

[Open in Playground](https://www.typescriptlang.org/play?#code/GYVwdgxgLglg9mABBBECGUA8BBANIgIQD4AKNALkQCcBTNAEwQBsBPRbAbQF18AjS2g2ZsC3AJSVsVKmhY5EAH0JEA3ACg1KMAGcoiNIgC8iDgCIAjKfymATFcSmAzKa77tyBLvVbdiXkZNTNHtTXhCIFzcPHSh1TU89OBAoAAdkgK10KDI+MRUgA)

This comes with it's own issues though, as we are not able to capture the length or
order of elements in the output array with this approach, as seen by the inferred type
of `output` being `("1" | "2" | "3" | "a" | "b" | "c")[]`. So, is there a better way?

## Variadic Tuple Types

Introduced in TypeScript 4.0,
[Variadic Tuple Types](https://www.typescriptlang.org/docs/handbook/release-notes/typescript-4-0.html#variadic-tuple-types)
allow us to express such scenarios correctly:

~~~ts
function concat<
  A extends readonly unknown[],
  B extends readonly unknown[]k
>(a: A, b: B): [...A, ...B];

const a = ['1', '2', '3'] as const
const b = ['a', 'b', 'c'] as const

const output = concat(a, b)
~~~

[Open in Playground](https://www.typescriptlang.org/play?#code/GYVwdgxgLglg9mABBBECGUA8AoRiCCiApgB5RFgAmAzogE5FqUIA2AnouANZhwDuYANoBdADS5EAIWJkKNeo2Zh2nMD35Dh2AHwAKNAC4CoxACMjkgJRHBAOnv4T925OEBubNhRhqURGkQAXkRBAHIARlCTUIAmKMRQgGZQ4X9ab18vBF8zIJDQtHjQ0yKIFLTkbKhPDL84ECgABwa873QofRNTSyA)

Here, TypeScript understands statically that `output`
contains`['1', '2', '3', 'a', 'b', 'c']` in that specific order thanks to the variadic
tuple return type `[...A, ...B]`. This means that we are now able to work with tuples
and arrays, whose types are not statically known to us, succinctly and accurately.

Let's look at another example -- typing a `curry` function (example taken from
[here](https://github.com/microsoft/TypeScript/pull/39094)):

~~~ts
function curry<T extends unknown[], U extends unknown[], R>(
  f: (...args: [...T, ...U]) => R,
  ...a: T
) {
  return (...b: U) => f(...a, ...b);
}

function add(a: number, b: number): number {
  return a + b;
}

const add10 = curry(add, 10);
const output = add10(20);
console.log(output); // 30
~~~

[Open in Playground](https://www.typescriptlang.org/play?#code/GYVwdgxgLglg9mABBEAnVBPAPAFUQUwA8p8wATAZ0XAGsw4B3MAbQF0AaRAVQONMupg6jFh0QAlAHwAKAFCJEwAFyJpAOg0BDVAHMKK5hrU5ORrqwCUiALySJ7eYiOaVOWVYDej1Pihok6hoARipcVraKgWqapsEWANyyAL6ysqCQsAiImmRk0i6IYCAAtkH4qJwhhSVlqBYqRaXliF4KPn6oSJqIANSIQYkpshAIFFDZuQCMAAw2yGiY+bmcMwnDo+NwIFAADttzOWQz0gBM02sjYBRwADb4ajdwOtJbu9sJiAD0n4gAzNNAA)

There's a lot to unpack here, let's take it step-by-step. Firstly, the `curry` function
takes in two parameters, `f`, which is the function we want to curry, and `a`, which is
a rest element that allows us to provide an arbitrary number of arguments (but no more
than what `f` accepts thanks to variadic tuple types).

To make the magic happen, we tell the checker that `f` takes in an arbitrary number of
arguments using a variadic tuple type `[...T, ...U]`. In simple terms, this type is
saying that the parameters to `f` is a combination of two types, `T` and `U`, where `T`
is applied first and `U` second. The arguments of `T` are given to us when we first call
`curry`, and the remaining arguments `U` are given to us when we call the returned
thunk.
