# Flutter Application 6

這是一個 Flutter 應用程式，已配置為可部署到 GitHub Pages。

## 功能

- 簡單的計數器應用程式
- 支援 Web 平台
- 自動部署到 GitHub Pages

## 部署到 GitHub Pages

### 步驟

1. **創建 GitHub 倉庫**：
   - 在 GitHub 上創建一個新的倉庫，名稱為 `flutter_application_6`
   - 不要初始化 README、.gitignore 或 license（因為本地已經有了）

2. **連接本地倉庫到 GitHub**：
   ```bash
   git remote add origin https://github.com/YOUR_USERNAME/flutter_application_6.git
   git branch -M main
   git push -u origin main
   ```

3. **啟用 GitHub Pages**：
   - 前往您的 GitHub 倉庫
   - 點擊 "Settings" 標籤
   - 滾動到 "Pages" 部分
   - 在 "Source" 下，選擇 "GitHub Actions"

4. **等待部署**：
   - GitHub Actions 工作流程將自動觸發
   - 構建過程大約需要 5-10 分鐘
   - 完成後，您的應用程式將在 `https://YOUR_USERNAME.github.io/flutter_application_6/` 上可用

### 自動部署

該項目已配置了 GitHub Actions 工作流程（`.github/workflows/deploy.yml`），它會：

- 在每次推送到 `main` 分支時觸發
- 設置 Flutter 環境
- 安裝依賴項
- 構建 Web 應用程式
- 部署到 GitHub Pages

### 本地開發

運行應用程式：
```bash
flutter run
```

為 Web 運行：
```bash
flutter run -d chrome
```

構建 Web 版本：
```bash
flutter build web --base-href="/flutter_application_6/"
```

## 注意事項

- 確保在 GitHub 倉庫設置中啟用了 GitHub Pages
- 第一次部署可能需要幾分鐘時間
- 確保 `--base-href` 參數與您的倉庫名稱匹配
