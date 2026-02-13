#!/bin/bash
# Google Analytics 快速部署脚本

echo "🔍 正在查找所有 HTML 文件..."

# 查找所有 HTML 文件（排除 node_modules 等）
HTML_FILES=$(find . -name "*.html" -type f | grep -v node_modules | grep -v .git | sort)

echo ""
echo "📋 找到以下 HTML 文件:"
echo "$HTML_FILES"
echo ""

# 提示用户操作
echo "💡 下一步操作:"
echo ""
echo "1. 先在 Google Analytics 获取您的测量 ID"
echo "   https://analytics.google.com/"
echo ""
echo "2. 测量 ID 格式：G-XXXXXXXXXX"
echo ""
echo "3. 手动添加 GA 代码到每个页面:"
echo ""
echo "   在每个 HTML 文件的 </head> 标签前添加:"
echo ""
echo '   <!-- Google Analytics -->'
echo '   <script async src="https://www.googletagmanager.com/gtag/js?id=G-XXXXXXXXXX"></script>'
echo '   <script>'
echo '     window.dataLayer = window.dataLayer || [];'
echo '     function gtag(){dataLayer.push(arguments);}'
echo '     gtag("js", new Date());'
echo '     gtag("config", "G-XXXXXXXXXX");'
echo "   </script>"
echo ""
echo "   将 G-XXXXXXXXXX 替换为您的实际测量 ID"
echo ""
echo "📖 详细说明请查看:"
echo "   ANALYTICS-SETUP.md"
echo ""
echo "✨ 或者使用编辑器全局查找替换功能:"
echo '   查找: <!-- SoftwareApplication schema -->'
echo '   在此行之后添加 GA 代码'
