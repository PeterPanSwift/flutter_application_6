#!/bin/bash

# Flutter Web 部署腳本
# 此腳本用於構建和測試 Flutter Web 應用程式

set -e

echo "🚀 Flutter Web 部署腳本"
echo "========================="

# 檢查是否安裝了 Flutter
if ! command -v flutter &> /dev/null; then
    echo "❌ Flutter 未安裝。請先安裝 Flutter。"
    exit 1
fi

# 啟用 Web 支援
echo "📱 啟用 Flutter Web 支援..."
flutter config --enable-web

# 獲取依賴項
echo "📦 安裝依賴項..."
flutter pub get

# 清理先前的構建
echo "🧹 清理先前的構建..."
flutter clean

# 構建 Web 應用程式
echo "🔨 構建 Web 應用程式..."
flutter build web --base-href="/flutter_application_6/"

echo "✅ 構建完成！"
echo ""
echo "📄 構建文件位於: build/web/"
echo ""
echo "🌐 要在本地測試，請運行："
echo "   cd build/web && python3 -m http.server 8000"
echo "   然後訪問 http://localhost:8000"
echo ""
echo "🚀 要部署到 GitHub Pages："
echo "   1. 推送到 GitHub 倉庫"
echo "   2. 啟用 GitHub Pages 設置"
echo "   3. GitHub Actions 將自動部署"
