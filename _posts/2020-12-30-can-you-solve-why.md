---
layout: post
title: Can you solve why this happened?
---

<style>
  .zero {
    color: #ffcc5b;
  }

  .one {
    color: #efbc4b;
  }

  .two {
    color: #dfac3b;
  }

  .three {
    color: #cf9c2b;
  }

  .four {
    color: #bf8c1b;
  }

  .five {
    color: #af7c0b;
  }

  .six {
    color: #9f6bfb;
  }

  .seven {
    color: #8f5beb;
  }

  .eight {
    color: #7f4bdb;
  }

  .nine {
    color: #6f3bcb;
  }

  .hl {
    color: #bb5555;
  }
</style>

Today, I made a simple solution to shade colors, and put them in a CSS file for my [personal website](https://manen.me). When I tried to shade my <span class="zero">brand color</span>, this is what i got as output.

```css
--brand-color: #ffcc5b;
--brand-color-1: #efbc4b;
--brand-color-2: #dfac3b;
--brand-color-3: #cf9c2b;
--brand-color-4: #bf8c1b;
--brand-color-5: #af7c0b;
--brand-color-6: #9f6bfb;
--brand-color-7: #8f5beb;
--brand-color-8: #7f4bdb;
--brand-color-9: #6f3bcb;
```

Visualized:

<span class="zero">Brand Color</span> \
<span class="one">Brand Color 1</span> \
<span class="two">Brand Color 2</span> \
<span class="three">Brand Color 3</span> \
<span class="four">Brand Color 4</span> \
<span class="five">Brand Color 5</span> \
<span class="six">Brand Color 6</span> \
<span class="seven">Brand Color 7</span> \
<span class="eight">Brand Color 8</span> \
<span class="nine">Brand Color 9</span>

# Wait, what?

Well... Why? By looking at the raw color codes, you might've already realized what happened. There is really no reason to not tell you, if you haven't realized yet.

So \
How the color shading is implemented is key, so I'll tell you. We are removing the hex code of `0x101010` (or a multiple) from the color we want to shade, in this case `0xffcc5b`. \
For the first few, this works perfectly, because there is nothing that could go wrong.

```js
0xffcc5b - 0x101010; // 0xefbc4b
0xffcc5b - 0x202020; // 0xdfac3b
0xffcc5b - 0x303030; // 0xcf9c2b
0xffcc5b - 0x404040; // 0xbf8c1b
0xffcc5b - 0x505050; // 0xaf7c0b
```

But if we were to go one further;

```js
0xffcc5b - 0x606060; // 0x9f6bfb
```

How did we get from <span class="five">`0xaf7c0b`</span> to <span class="six">`0x9f6bfb`</span>?

<span class="five">` 0xaf7c`<span class="hl">`0`</span>`b `</span> ➡️ <span class="six">` 0xaf7c`<span class="hl">`f`</span>`b `</span>

Yup, that was (as far as I know) an [integer overflow](https://en.wikipedia.org/wiki/Integer_overflow). I didn't know those existed in JavaScript, but it's weirdly handy in this case. \
At least it doesn't just throw an error so I have to deal with it, here I can just do what I always do; Not solve the problem, but delay it.
