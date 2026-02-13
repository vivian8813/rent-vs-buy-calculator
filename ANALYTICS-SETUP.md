# Google Analytics 集成指南

## ✅ 已完成
已在 `index.html` 中添加 Google Analytics (GA4) 追踪代码。

## 📝 您需要做的

### 1. 获取 Google Analytics 测量ID

1. 登录 [Google Analytics](https://analytics.google.com/)
2. 点击左下角 ⚙️ **管理** (Admin)
3. 创建账号和/或媒体资源
4. 在"数据流"设置中，选择 **Web** 平台
5. 输入网站信息：`rent-vs-buy-calculator.it.com`
6. 获取您的 **测量ID** (格式：`G-XXXXXXXXXX`)

### 2. 替换测量ID

打开 `index.html`，找到这段代码（第33-39行）：

```html
<!-- Google Analytics (GA4) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-XXXXXXXXXX"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'G-XXXXXXXXXX');  ← 替换这里的ID
</script>
```

将 `G-XXXXXXXXXX` 替换为您的实际测量ID。

### 3. 验证安装

#### 方法1：使用 Google Analytics 实时报告
1. 在 Analytics 中打开 **实时** (Realtime) 报告
2. 访问您的网站：https://rent-vs-buy-calculator.it.com
3. 应该能看到当前活跃用户

#### 方法2：使用浏览器开发者工具
1. 打开网站，按 F12 打开开发者工具
2. 在 Console 标签中输入：
```javascript
window.dataLayer
```
3. 应该能看到包含事件数据的数组

### 4. 为其他页面添加 Analytics

以下页面也需要添加相同的 GA 代码：
- [ ] `rent-vs-buy-calculator-usa.html`
- [ ] `rent-vs-buy-calculator-canada.html`
- [ ] `rent-vs-buy-calculator-uk.html`
- [ ] `rent-vs-buy-calculator-australia.html`
- [ ] `usa/austin-rent-vs-buy-2026.html`

在每个页面的 `</head>` 标签之前添加相同的代码。

## 🔧 创建独立 GA 脚本文件（推荐）

为避免在每个页面重复修改，可以创建一个 `ga.html` 包文件：

```html
<!-- Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-XXXXXXXXXX"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'G-XXXXXXXXXX');
</script>
```

然后在需要 Analytics 的页面中使用：
```html
<!-- Google Analytics -->
<script src="/ga.html"></script>
```

## 📊 重要事件追踪建议

建议追踪以下自定义事件：

```javascript
// Calculator usage
gtag('event', 'calculate', {
  'event_category': 'calculator',
  'event_label': 'rent_vs_buy'
});

// Button clicks
gtag('event', 'click', {
  'event_category': 'navigation',
  'event_label': 'city_link_austin'
});
```

## 🌐 其他搜索引擎

### Microsoft Clarity (免费热力图）
```
https://clarity.microsoft.com/
```

### Google Search Console
```
https://search.google.com/search-console
```

## ✅ 检查清单

- [ ] 获取 GA 测量ID
- [ ] 替换 index.html 中的占位符ID
- [ ] 推送更改到 GitHub
- [ ] 在 Analytics 实时报告中验证
- [ ] 为其他页面添加 GA 代码
- [ ] 设置转化目标（可选）
