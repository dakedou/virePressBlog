---
# https://vitepress.dev/reference/default-theme-home-page
layout: home

hero:
  name: "大蝌蚪的博客"
  text: "我的生活"
  tagline: 关于、学习、技术、随笔
  image:
    src: "/images/logo.jpg"
    alt: 大蝌蚪的博客
  # actions:
  #   - theme: brand
  #     text: Markdown Examples
  #     link: /markdown-examples
  #   - theme: alt
  #     text: API Examples
  #     link: /api-examples

features:
  - title: 发财人生
    details: 每天醒来就要思考今天的500万怎么花
  - title: 无为而无不为
    details: 出自老子《道德经》，遵循自然之理，顺应自然的运行，不必去干预自然的运行，不做不必的事
  #  icon: 🎉
  - title: CTRL C
    details: 没有做不来 只有不想做
---

<!-- 自定义组件 -->
<script setup>
import home from './components/home.vue';
</script>

<home />
