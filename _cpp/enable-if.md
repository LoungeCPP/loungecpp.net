---
title: EnableIf in C++11
---
In C++03 one could use SFINAE to enable or disable overloads based on a boolean condition with a simple
metafunction that usually went by the name `enable_if`. C++11 now standardised this metafunction.
In C++03 one could use this in a number of places, common ones being return types, or extra defaulted parameters:

```
template <typename T>
typename enable_if<std::is_polymorphic<T>::value, int>::type // hard-to-read return type
f(T t);

template <typename T>
some_ctor(T t, typename enable_if<std::is_polymorphic<T>::value>::type* = 0);
```

In C++11 using this can be a lot less clunky.

## Template parameter lists

C++11 extends SFINAE to template parameter lists, allowing us to stop uglifying return types, or adding function parameters.

```
template <typename T
        , typename = typename std::enable_if<std::is_polymorphic<T>::value>::type // SFINAE here
        >
int f(T t); // signature is not butchered

template <typename T
        , typename = typename std::enable_if<std::is_polymorphic<T>::value>::type // SFINAE here
        >
some_ctor(T t); // signature is not butchered
```

## Template aliases

We can still improve, starting by using [template aliases](/cpp/reducing-pain-with-aliases):

```
template <typename Condition>
using EnableIf = Invoke<std::enable_if<Condition::value>>; // Invoke is from the page linked above

template <typename T
        , typename = EnableIf<std::is_polymorphic<T>>
        >
int f(T t);
```

No care needs to be given to the second parameter of `std::enable_if`, because it won't be used anyway in this place.

## Variadic templates

What if there's more than one condition? One could add an extra parameter or one could make `EnableIf` variadic:

```
// Logical conjunction metafunction
template <typename... T>
struct All : std::true_type {};
template <typename Head, typename... Tail>
struct All<Head, Tail...> : Conditional<Head, All<Tail...>, std::false_type> {};

template <typename... Condition>
using EnableIf = Invoke<std::enable_if<All<Condition...>::value>;

template <typename T
        , typename = EnableIf<std::is_polymorphic<T>, std::is_empty<T>>
        >
int f(T t);
```

See [template aliases](/cpp/reducing-pain-with-aliases) for `Conditional`.

## Non-type parameters

What we have sure looks nice now. However, this still has problems (which exist in the previous versions too).

```
template <typename T
        , typename = EnableIf<std::is_polymorphic<T>>
        >
int f(T t);
template <typename T
        , typename = DisableIf<std::is_polymorphic<T>> // DisableIf left as an exercise to the reader :P
        >
int f(T t); // Ooops, redeclaration of same template with different default arguments
```

This fails even before substitution. The compiler rejects the code because it essentially declares the same template
twice (`template <typename T, typename> int f(int)` with different default arguments. This can be solved by making
the templates actually be different templates. Just add a dummy parameter to one:

```
template <typename T
        , typename = EnableIf<std::is_polymorphic<T>>
        >
int f(T t);
template <typename T
        , typename = DisableIf<std::is_polymorphic<T>>
        , typename = void // dummy to make the functions different templates
        >
int f(T t);
```

This solution is not pretty, and most importantly, it's not scalable: if you have more overloads, you need more dummies to distinguish them all.

An alternative way of fixing this is by tweaking the SFINAEing parameter and our `EnableIf` alias slightly:

```
enum class enabled { _ }; // just a type that can be used as a template parameter and is as inocuous as possible
constexpr auto _ = enabled::_; // shortcut for dummy value (do not place _ in global scope!)
template <typename... Condition>
using EnableIf = Invoke<std::enable_if<All<Condition...>::value, enabled>>; // now EnableIf<...> isn't void, but enabled

template <typename T
        , EnableIf<std::is_polymorphic<T>> = _ // default to the dummy value
        >
int f(T t);
template <typename T
        , DisableIf<std::is_polymorphic<T>> = _
        >
int f(T t);
```

Now the templates are not the same, because one of them won't even be considered: the type of the second template
parameter is resolved with substitution, and *Substitution Failure Is Not An Error*!

## No dummies

One can get rid of the dummy by making the SFINAEing template parameter a template parameter pack instead.

```
enum class enabled {}; // no value necessary
template <typename... Condition>
using EnableIf = Invoke<std::enable_if<All<Condition...>::value, enabled>>; // same as before

template <typename T
        , EnableIf<std::is_polymorphic<T>>... // no defaults needed: pack will be empty
        >
int f(T t);
template <typename T
        , DisableIf<std::is_polymorphic<T>>...
        >
int f(T t);
```

The pack will be deduced as empty, but since substitution still has to occur we still get SFINAE.
Unfortunately, it seems versions of GCC and clang as of this writing still have trouble dealing with this form.
