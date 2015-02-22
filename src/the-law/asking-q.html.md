---
title: Asking Questions
---

So, you've come to our wonderful room. Great, we hope you stay and have a good time!
And you have a question — that's fine. But there are few important things you have to understand first.

Since you're probably new to the room, and maybe SO chat in general, you should also read
[newbie hints](/the-law/newbie-hints).

## We're not Stack Overflow

Before you continue, keep this in mind. You can skip all this fuss and go ask your question on
the main site, at *any* time, because that's what that site is all about.

**You get far less guarantee about your question being answered on the chat than on SO main.**

## We don't care

Yes, it's harsh, but that's the truth. We're in chat to, well, chat. To unwind, act silly and make fun
of various things. Now — that does *not* necessarily mean we won't help you. For the most part,
we like helping people. But if we detect any hint of entitlement, we *will* tell you to fuck off
and go away. And if you persist, we will troll you to tears and whiny meta posts.

That *especially* includes "I don't have time, so answer really quick", repeating question ad nauseam,
linking an SO question and complaining nobody wants to answer it, etc.

The moral is: don't be annoying, and we'll get along. If you are being told you're annoying, stop,
and we'll (maybe) get along. If you start insulting regulars, you're a lost cause to us. The chat
has a feature that allows users to put others on a ignore list and never again have to read anything
by them. The regulars are using it. Once you're on everybody's ignore list, it's nigh impossible to get
help from the regulars.

Now that's out of the way, the question asking proper.

## We don't read minds

We can't help you if you can't properly articulate your problem. Persistent inability to clarify also
qualifies as being annoying (see above). There are basically three things we need, before we can propose
a solution to your problem.

### Problem description

This is a clear, concise description of the problem you're trying to solve. Avoid the XY problem: don't just describe
the solution you invented, but doesn't work — include the description of the original problem as well.

### Error description

In case of compile time errors, *full* error. In case of runtime errors (like segfaults, or just plain
"I'm getting wrong output"), we need a backtrace, input values, expected output and actual output.
Yes, this means you have to run the debugger and have it pinpoint the spot where crash happens,
or simply sniff the values of variables where you suspect the code goes wrong. The more work you
do on this, the less time it will take us to answer your question. If you skip any of this, and are
asked to provide the information, do so, or you'll be deemed annoying (see above).

For example, let's say you compile your code with GCC. We want *the entire output* if there's a compilation error.
Not just first line you think is relevant. *All of it.* This includes things like overload sets, or entire stack
of template errors. We can sift through that (and if we can't, then it probably means you failed to provide proper
code sample, which will be discussed next), you don't have to do that for us. It makes easier for us to tell what the issue is.

### Code sample

We can't help you if there's no code. You will be asked to provide the code. And it has to follow
[SSCCE](http://sscce.org/) guidelines:

* **Short** — we will not read 1000 lines of code, we will not debug 1000 lines of code.
  If you're trying to force snippet like that through — see 'annoying'.
* **Self-contained** — to the extent possible, of course. If you think your issue is with Qt,
  then by all means leave Qt-related code in it. But no unrelated dependencies.
* **Correct** — it must be the exact code you're compiling. This is really crucial,
  and failure to provide that results in... well, I think you know by now.
* **Example** — it shows the problem you're trying to solve.
  You have to preserve the issue while minimising the code.

An important thing that happens way too often for my taste: if you tell us you can't give us code,
because it's top-secret, you will be laughed at. Not just trolled, but openly laughed at. Don't even bother. Really.

## We don't do C/D/E/whatever

If you come into the room and ask PHP question, because we're the only active room at the moment,
nobody will answer your question. Even if they know the answer. Unless someone feels like being
extremely nice that day. While we all know and use more than one language, we primarily do C++.
You might have a chance of getting Haskell or Python questions answered, but know that you're taking a risk.

And no PHP or Java questions, no matter what. They will be binned and you will be deemed annoying.

## No whining

This is tied strongly to "we don't care". We don't have to help you. We're doing it because we feel like it.
If you sense nobody wants to answer your question, stop trying. Stay, chat, and maybe there'll be someone
in better mood on a later date. We're also more forgiving when it comes to regulars and semi-regulars.
Go ask your question on SO.

We're really only hostile towards people who are truly annoying, and disrupt the chatting experience for us.
If you feel you're getting attacked with no reason, ping (@name) one of room owners — we'll try to defuse the situation.
Or simply ignore the person that annoys you. Just don't feel all offended, this is not a serious place.
Also, complaining on meta gets you on the (unofficial) blacklist and will make you a target of mocking.
