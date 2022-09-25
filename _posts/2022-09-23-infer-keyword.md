---
layout: post
title: "Obscure TypeScript: The <code>infer</code> Keyword"
category: typescript
---

## Background: Conditional Types

[Conditional types](https://www.typescriptlang.org/docs/handbook/2/conditional-types.html)
allow you to define types that express different types based on the input type:

```ts
type Input = string;
type Output = Input extends string ? string : number;
```

In their simplest form, conditional types don't seem very useful because if you know how
to read, you can statically determine that `Output` will always be of type `string`!

This is why you'll almost always see conditional types used in conjunction with
[generics](https://www.typescriptlang.org/docs/handbook/2/generics.html). If we apply
generics to the previous example, you'll start to see the utility of conditional types:

```ts
type Output<Input> = Input extends string ? string : number;
```

Here, `Output` will default to being a `number` type, but will express a `string` type
if the input to the generic is also a `string`.

## The `infer` Keyword

In
[TypeScript 2.8](https://www.typescriptlang.org/docs/handbook/release-notes/typescript-2-8.html#type-inference-in-conditional-types),
support for the `infer` keyword was added to conditional types. When you declare
`infer T`, TypeScript will infer the type of `T` and then allow you to reference that
inferred type in the rest of the conditional. In practice, this allows you to unwrap
types from wrapped types and use them in conditional types. For example, we can exploit
this to write a naive implementation for the `Awaited` type:

```ts
type Awaited<T> = T extends Promise<infer U>
  ? U // T is of type `Promise`, return the wrapped type
  : T; // T is not of type `Promise`, return it as-is

type Input = Promise<string>;
type Output = Awaited<Input>; // Will always be of type `string`
```

[Open in Playground](https://www.typescriptlang.org/play?#code/C4TwDgpgBAgg7gQwJbAgEwDwBUB8UC8UWUEAHqgHZoDOUACgE4D2AtktRBkhQGYQNQAqjgBQUKAH4hYqAC4iIkaEhQAkhTABXYAXrM2HDNWANuAc1HLoAeW1adheMlSZ19nEA)

Let's unpack what's happening here. `Awaited` is a generic type that accepts a single
type parameter `T`. In the guts, we use a conditional type to check if `T` is of type
`Promise` or not. If it is not, we simply return `T`. Because we want to unwrap the type
inside of `Promise`, we use `infer U` to instruct TypeScript to infer the type and store
it in the type variable `U`, which we then return in the truthy path of the conditional
type.

## Additional Resources

- [Inferring Within Conditional Types](https://www.typescriptlang.org/docs/handbook/2/conditional-types.html#inferring-within-conditional-types)
