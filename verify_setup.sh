#!/bin/bash

# Flutter GitHub Pages 部署驗證腳本
echo "🔍 驗證 Flutter GitHub Pages 部署設置..."
echo ""

# 檢查 Flutter 安裝
echo "1. 檢查 Flutter 安裝..."
if command -v flutter &> /dev/null; then
    echo "✅ Flutter 已安裝: $(flutter --version | head -n1)"
else
    echo "❌ Flutter 未安裝或不在 PATH 中"
    exit 1
fi

# 檢查 Web 支援
echo ""
echo "2. 檢查 Flutter Web 支援..."
if flutter devices | grep -q "Chrome"; then
    echo "✅ Flutter Web 支援已啟用"
else
    echo "⚠️  Flutter Web 支援可能未啟用，執行: flutter config --enable-web"
fi

# 檢查項目結構
echo ""
echo "3. 檢查項目結構..."
required_files=(
    "pubspec.yaml"
    "lib/main.dart"
    "web/index.html"
    ".github/workflows/deploy.yml"
    "GITHUB_PAGES_DEPLOYMENT.md"
    "deploy.sh"
)

for file in "${required_files[@]}"; do
    if [ -f "$file" ]; then
        echo "✅ $file"
    else
        echo "❌ 缺少 $file"
    fi
done

# 檢查 Git 設置
echo ""
echo "4. 檢查 Git 設置..."
if git rev-parse --git-dir > /dev/null 2>&1; then
    echo "✅ Git 倉庫已初始化"
    
    # 檢查是否有 remote origin
    if git remote get-url origin > /dev/null 2>&1; then
        echo "✅ Git remote origin 已設置: $(git remote get-url origin)"
    else
        echo "⚠️  Git remote origin 未設置"
        echo "   請執行: git remote add origin https://github.com/YOUR_USERNAME/flutter_application_6.git"
    fi
else
    echo "❌ Git 倉庫未初始化"
fi

# 檢查依賴項
echo ""
echo "5. 檢查依賴項..."
if [ -f "pubspec.lock" ]; then
    echo "✅ 依賴項已安裝"
else
    echo "⚠️  依賴項未安裝，執行: flutter pub get"
fi

# 測試構建
echo ""
echo "6. 測試 Web 構建..."
echo "正在構建..."
if flutter build web --base-href="/flutter_application_6/" > /dev/null 2>&1; then
    echo "✅ Web 構建成功"
    
    # 檢查構建輸出
    if [ -d "build/web" ]; then
        build_size=$(du -sh build/web | cut -f1)
        echo "   構建大小: $build_size"
        
        # 檢查關鍵文件
        if [ -f "build/web/index.html" ] && [ -f "build/web/main.dart.js" ]; then
            echo "   ✅ 關鍵文件存在"
        else
            echo "   ⚠️  某些關鍵文件可能缺失"
        fi
    fi
else
    echo "❌ Web 構建失敗"
    echo "   請檢查錯誤並修復後重試"
fi

echo ""
echo "📋 設置摘要:"
echo "────────────────────────────────────────"
echo "項目名稱: flutter_application_6"
echo "部署目標: GitHub Pages"
echo "構建命令: flutter build web --base-href=\"/flutter_application_6/\""
echo "部署網址: https://YOUR_USERNAME.github.io/flutter_application_6/"
echo ""
echo "📖 下一步:"
echo "1. 在 GitHub 上創建倉庫 'flutter_application_6'"
echo "2. 執行: git remote add origin https://github.com/YOUR_USERNAME/flutter_application_6.git"
echo "3. 執行: git push -u origin main"
echo "4. 在 GitHub 倉庫設置中啟用 GitHub Pages (使用 GitHub Actions)"
echo ""
echo "🚀 完成後，您的應用程式將在幾分鐘內部署完成！"
