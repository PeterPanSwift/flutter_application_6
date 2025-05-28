# GitHub Pages 部署指南

## 準備工作

### 1. 在 GitHub 上創建倉庫

1. 前往 [GitHub](https://github.com) 並登入您的帳戶
2. 點擊右上角的 "+" 按鈕，選擇 "New repository"
3. 設置倉庫名稱為 `flutter_application_6`
4. 設為 Public（GitHub Pages 免費版需要公開倉庫）
5. **不要**勾選 "Initialize this repository with a README"
6. 點擊 "Create repository"

### 2. 連接本地倉庫到 GitHub

在終端中執行以下命令（請將 `YOUR_USERNAME` 替換為您的 GitHub 用戶名）：

```bash
# 添加遠程倉庫
git remote add origin https://github.com/YOUR_USERNAME/flutter_application_6.git

# 設置主分支名稱
git branch -M main

# 推送到 GitHub
git push -u origin main
```

### 3. 配置 GitHub Pages

1. 前往您的 GitHub 倉庫頁面
2. 點擊 "Settings" 標籤
3. 在左側邊欄中找到 "Pages"
4. 在 "Source" 部分，選擇 **"GitHub Actions"**
5. 保存設置

## 自動部署

一旦您完成上述設置，每次您推送代碼到 `main` 分支時，GitHub Actions 將自動：

1. 檢出您的代碼
2. 設置 Flutter 環境
3. 安裝依賴項
4. 運行代碼分析和測試
5. 構建 Web 應用程式
6. 部署到 GitHub Pages

## 訪問您的應用程式

部署完成後，您的應用程式將在以下網址可用：

```
https://YOUR_USERNAME.github.io/flutter_application_6/
```

## 手動觸發部署

您也可以在 GitHub 倉庫的 "Actions" 標籤中手動觸發部署：

1. 前往 "Actions" 標籤
2. 選擇 "Deploy Flutter to GitHub Pages" 工作流程
3. 點擊 "Run workflow" 按鈕

## 故障排除

### 部署失敗

如果部署失敗，請檢查：

1. **Actions 標籤**：查看詳細的錯誤日誌
2. **倉庫設置**：確保 GitHub Pages 設置為使用 GitHub Actions
3. **權限**：確保 Actions 有寫入權限（通常是預設的）

### 應用程式無法載入

如果應用程式部署成功但無法載入：

1. 檢查瀏覽器的開發者工具（F12）中的控制台錯誤
2. 確保 `--base-href` 設置正確
3. 清除瀏覽器緩存並重新整理

### 本地測試

在推送到 GitHub 之前，您可以在本地測試：

```bash
# 運行部署腳本
./deploy.sh

# 或手動構建和測試
flutter build web --base-href="/flutter_application_6/"
cd build/web
python3 -m http.server 8000
```

然後在瀏覽器中訪問 `http://localhost:8000`

## 更新應用程式

要更新已部署的應用程式：

1. 修改您的代碼
2. 提交更改：
   ```bash
   git add .
   git commit -m "更新應用程式"
   git push
   ```
3. GitHub Actions 將自動重新部署

## 注意事項

- 首次部署可能需要 5-10 分鐘
- GitHub Pages 有時需要額外時間來傳播更改
- 確保您的倉庫是公開的（免費版 GitHub Pages 的要求）
- Web 構建文件大約 2-5 MB，在 GitHub 的限制範圍內
