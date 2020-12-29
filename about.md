---
layout: page
title: About me
---

<div class="about">
</div>

<script>
  fetch("https://manen.me/api/content.json")
    .then(raw => raw.json())
    .then(data => {
      const p = data[0];
      $(".page-title")[0].innerHTML = p.title;
      $(".about")[0].innerHTML = p.text.replace(/\[|\]\(.+\)/g, "");
  })
</script>
