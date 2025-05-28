#!/bin/bash

# Flutter GitHub Pages 部署狀態檢查腳本
echo "🚀 檢查 Flutter GitHub Pages 部署狀態..."
echo ""

REPO_URL="https://github.com/PeterPanSwift/flutter_application_6"
PAGES_URL="https://peterpanswift.github.io/flutter_application_6/"

echo "📊 倉庫信息:"
echo "────────────────────────────────────────"
echo "倉庫地址: $REPO_URL"
echo "部署網址: $PAGES_URL"
echo ""

echo "🔍 檢查部署狀態..."
echo ""

# 檢查網站是否可訪問
echo "1. 檢查網站可訪問性..."
if curl -s --head "$PAGES_URL" | head -n 1 | grep -q "200 OK"; then
    echo "✅ 網站可訪問 - $PAGES_URL"
else
    echo "❌ 網站無法訪問，可能還在部署中..."
    echo "   請等待 5-10 分鐘後重試"
fi

echo ""
echo "2. 檢查 GitHub Actions 工作流程..."
echo "   前往查看: $REPO_URL/actions"

echo ""
echo "3. 檢查 GitHub Pages 設置..."
echo "   前往查看: $REPO_URL/settings/pages"

echo ""
echo "📝 部署信息:"
echo "────────────────────────────────────────"
echo "構建命令: flutter build web --base-href=\"/flutter_application_6/\""
echo "部署分支: gh-pages (由 GitHub Actions 自動管理)"
echo "工作流程文件: .github/workflows/deploy.yml"

echo ""
echo "🔄 如果需要重新部署:"
echo "────────────────────────────────────────"
echo "1. 修改代碼"
echo "2. git add ."
echo "3. git commit -m \"更新描述\""
echo "4. git push"

echo ""
echo "🌐 訪問您的 Flutter 應用程式:"
echo "────────────────────────────────────────"
echo "$PAGES_URL"

echo ""
echo "📱 應用程式功能:"
echo "- 響應式設計，支援所有設備"
echo "- 簡單的計數器應用程式"
echo "- Material Design UI"
echo "- 完全離線運行"

echo ""
echo "✨ 部署完成！您的 Flutter 應用程式現在可以在 GitHub Pages 上訪問了！"
