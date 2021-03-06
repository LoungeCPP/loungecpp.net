---
title: Reducing pain with aliases
---
Anyone that has ever tried to do some template meta-programming, has likely run into the need for the
[typename keyword](http://stackoverflow.com/a/613132/46642). Using type traits often involves this keyword.

```
// examples
typename std::remove_const<T>::type
typename std::add_lvalue_reference<T>::type
typename std::conditional<std::is_const<T>::value, typename std::add_const<U>::type, T>::type
```

This makes for verbose code and quickly becomes annoying. Fortunately C++11 brings us
template aliases (available on Clang 3.0 and GCC 4.7). With these one can make these things much less of an eye sore.

One can capture this `typename T::type` pattern with a template alias that can be used to replace it:

```
template <typename T>
using Invoke = typename T::type;
```

And rewrite the previous examples as:

```
Invoke<std::remove_const<T>>
Invoke<std::add_lvalue_reference<T>>
Invoke<std::conditional<std::is_const<T>::value, Invoke<std::add_const<U>>, T>>
```

This already helps, but one can also go one step further by making specialised aliases for each trait.

```
template <typename T>
using RemoveConst = Invoke<std::remove_const<T>>;

template <typename T>
using AddLvalueReference = Invoke<std::add_lvalue_reference<T>>;

template <typename T>
using AddConst = Invoke<std::add_const<U>::type;

template <typename If, typename Then, typename Else>
using Conditional = Invoke<std::conditional<If::value, Then, Else>>;
```

And the previous examples becomes a lot more readable:

```
RemoveConst<T>
AddLvalueReference<T>
Conditional<std::is_const<T>, AddConst<U>, T>>
```

It almost doesn't look like TMP at all.
