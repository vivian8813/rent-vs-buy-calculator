#!/usr/bin/env python3
"""
为所有HTML文件添加Google Analytics代码
"""
import os
import re

GA_CODE = '''
  <!-- Google Analytics (GA4) -->
  <script async src="https://www.googletagmanager.com/gtag/js?id=G-B8MQ2N9FFN"></script>
  <script>
    window.dataLayer = window.dataLayer || [];
    function gtag(){dataLayer.push(arguments);}
    gtag('js', new Date());
    gtag('config', 'G-B8MQ2N9FFN');
  </script>
'''

def add_ga_to_file(filepath):
    """为单个HTML文件添加GA代码"""
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()

    # 检查是否已包含GA代码
    if 'G-B8MQ2N9FFN' in content:
        return False, f"⊘ {filepath} - 已包含GA"

    # 查找</head>标签
    head_pattern = r'(</head>)'
    match = re.search(head_pattern, content)
    if not match:
        return False, f"⚠️  {filepath} - 未找到</head>标签"

    # 在</head>前插入GA代码
    new_content = content.replace(match.group(0), GA_CODE + '\n' + match.group(0))

    # 写回文件
    with open(filepath, 'w', encoding='utf-8') as f:
        f.write(new_content)

    return True, f"✅ {filepath} - GA代码已添加"

def main():
    print("📊 正在为所有HTML页面添加Google Analytics...")
    print()

    # 遍历所有HTML文件
    added_count = 0
    skipped_count = 0

    for root, dirs, files in os.walk('.'):
        # 排除特定目录
        dirs[:] = [d for d in dirs if d not in ['.git', 'node_modules', '.vercel']]

        for filename in files:
            if filename.endswith('.html'):
                filepath = os.path.join(root, filename)

                # 跳过google验证文件
                if 'google' in filename.lower():
                    skipped_count += 1
                    continue

                success, msg = add_ga_to_file(filepath)
                print(msg)
                if success:
                    added_count += 1
                else:
                    skipped_count += 1

    print()
    print(f"🎉 完成！")
    print(f"   ✅ 已添加: {added_count} 个文件")
    print(f"   ⊘ 已跳过: {skipped_count} 个文件")
    print()
    print("💡 提示: 使用 git diff 查看更改")

if __name__ == '__main__':
    main()
