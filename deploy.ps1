# 确保运行的目录是 Git 项目的根目录
Set-Location -Path (Split-Path -Parent $MyInvocation.MyCommand.Definition)

# 安装 npm 依赖（如果没有安装）
npm install

# 构建静态文件
npm run docs:build

# 检查是否有 gh-pages 分支，若没有则创建
$ghPagesBranchExists = git branch -r | Select-String "origin/gh-pages"
if (-not $ghPagesBranchExists) {
    Write-Host "gh-pages 分支不存在，正在创建..."
    git checkout --orphan gh-pages
    git rm -rf .  # 删除所有文件（除了 .git 和 .gitignore）
    git commit -m "Initial commit for gh-pages"
    git push origin gh-pages
}

# 切换到 gh-pages 分支
git checkout gh-pages

# 删除 gh-pages 分支上的所有文件，保留 .git 文件
Get-ChildItem -Recurse | Where-Object { $_.Name -ne '.git' -and $_.Name -ne '.gitignore' } | Remove-Item -Recurse -Force

# 将构建后的文件从 .vitepress/dist 目录复制到当前目录
Copy-Item -Recurse -Force ".vitepress/dist/*" .

# 添加并提交更改
git add .
git commit -m "Deploy to GitHub Pages"

# 推送到远程仓库
git push origin gh-pages

# 切换回主分支（通常是 main 或 master）
git checkout main

# 保证 main 分支的代码不会丢失
Write-Host "部署完成，已切换回 main 分支"
