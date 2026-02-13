#!/bin/bash
# 为所有HTML页面添加Google Analytics代码

GA_CODE='
  <!-- Google Analytics (GA4) -->
  <script async src="https://www.googletagmanager.com/gtag/js?id=G-B8MQ2N9FFN"></script>
  <script>
    window.dataLayer = window.dataLayer || [];
    function gtag(){dataLayer.push(arguments);}
    gtag("js", new Date());
    gtag("config", "G-B8MQ2N9FFN");
  </script>
'

echo "📊 正在为所有HTML页面添加Google Analytics..."
echo ""

# 查找所有HTML文件（排除node_modules和.git）
find . -name "*.html" -type f | grep -v node_modules | grep -v .git | while read file; do
    # 检查是否已包含GA代码
    if grep -q "G-B8MQ2N9FFN" "$file"; then
        echo "⊘ $file - 已包含GA代码，跳过"
    else
        # 在</head>标签前插入GA代码
        if grep -q "</head>" "$file"; then
            # 使用sed在</head>前插入
            sed -i.bak "s|</head>|$GA_CODE</head>|" "$file"
            echo "✅ $file - GA代码已添加"
        else
            echo "⚠️  $file - 未找到</head>标签"
        fi
    fi
done

echo ""
echo "🎉 完成！备份文件扩展名: .bak"
echo "💡 如果一切正常，可以删除备份文件:"
echo "   find . -name '*.html.bak' -delete"
