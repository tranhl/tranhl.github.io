---
layout: post
title: "Obscure TypeScript: Distributive Conditional Types"
category: typescript
---

Conditional types become
[distributive](https://www.typescriptlang.org/docs/handbook/2/conditional-types.html#distributive-conditional-types)
when acting on a generic type that is given a union type. In simpler terms, if you write
a conditional type that uses a generic, and that generic is given a union (e.g.
`'foo' | 'bar'`), the condition within the conditional type will apply to each _member_
of the union:

~~~ts
type OnlyStrings<T> = T extends string ? T : T;
type Strings = OnlyStrings<"foo" | "bar" | "baz" | 1 | 2 | 3>;
type PassThrough = OnlyStrings<{ foo: "bar" }>;
~~~

[Open in Playground](https://www.typescriptlang.org/play?ssl=2&ssc=62&pln=1&pc=1#code/C4TwDgpgBA8gdgGxAZWAJwJZwOYGcA8AKgHxQC8UhUEAHsBHACa5S7pbZQD8lUAXFDgQAbhDQAoUJCipMOFhXhJZHAgHIAZgHstaqAB8oagEYBDNHsMnTAL0tQAjAagAmZwGZiQA)

In this example, we can see that if we supply a union type to the generic of
`OnlyStrings`, the conditional becomes distributive and acts on each member of the
union, filtering out anything that isn't a `string`. However, if the generic isn't a
union (i.e. `{ foo: "bar" }`}), then the conditional will apply to the whole type
instead, which results in the type being returned as-is.

So when would this be useful? You might have already honed in on this, but this is
actually how TypeScript's
[Exclude](https://www.typescriptlang.org/docs/handbook/utility-types.html#excludeuniontype-excludedmembers)
utility type works under the hood! Knowing how conditional types can be distributive, we
can implement `Exclude` ourselves:

~~~ts
type MyExclude<UnionType, ExcludedMembers> = UnionType extends ExcludedMembers
  ? never
  : UnionType;
type Excluded = MyExclude<"a" | "b", "b">;
~~~

[Open in Playground](https://www.typescriptlang.org/play?#code/C4TwDgpgBAsiCiAPAxgGwK4BMIB4CqAdgJYD2BAKuBADRRJpYSYwQC2ARhAE4DOAfFAC8UQqQpUoERMAgFMPOigzZmbTrwBQUKAH4oBCADduWqAC4RxMpUgBuDaEiKGKobARLGOAEQBDb1AAPlDe7N60od58tkA)
