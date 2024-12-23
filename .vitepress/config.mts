import { defineConfig } from "vitepress";
import sidebar from "./sidebar.mts";
// https://vitepress.dev/reference/site-config

export default defineConfig({
  base: "/",
  title: "dakedou",
  description: "我的个人博客",
  srcDir: "blog",
  appearance: false,
  themeConfig: {
    // logo: '/images/1203.jpg',
    // https://vitepress.dev/reference/default-theme-config
    nav: [
      { text: "首页", link: "/" },
      { text: "我的随笔", link: "/我的随笔/index" },
      { text: "生活分享", link: "/生活分享/index" },
      {
        text: "技术相关",
        // items:[{
        //         text:'新建的项目',
        //         link:'/技术相关/index.md'
        //     }],
        // activeMatch: "/技术相关/",
        link: "/技术相关/index",
      },
      {
        text: "友连",
        items: [
          {
            text: "小小人",
            link: "https://blog.xiaoxiaoren.icu/",
            target: "_self",
            rel: "sponsored",
          },
        ],
      },
    ],

    sidebar: sidebar,
    socialLinks: [{ icon: "github", link: "https://github.com/dakedou" }],
    //footer: {
    // message: 'Released under the MIT License.',
    // copyright: 'Copyright © 2024-present gqk'
    //}
  },
});
