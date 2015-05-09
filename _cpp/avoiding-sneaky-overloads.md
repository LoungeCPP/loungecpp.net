---
title: Avoiding sneaky operator overloads
---

## Comma

When you write `x, y` in generic code, most of the time you intend that to mean "evaluate `x`,
then evaluate `y` and make that the result". But since `operator,` can be overloaded, this could
end up meaning something else entirely.

A simple workaround is to stick a `void()` in between the two expressions:

```
x, void(), y
```

Since you can't take a `void` parameter, there's no way for this to result in a call to an overloaded `operator,`.
