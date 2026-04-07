# 使用輕量級的 Nginx Alpine 版本作為基礎鏡像
FROM nginx:alpine

# 複製專案檔案到 Nginx 的預設靜態檔案目錄
COPY . /usr/share/nginx/html

# Cloud Run 會透過 PORT 環境變數指定埠號（預設為 8080）
# 我們需要修改 Nginx 配置以監聽該埠號
RUN sed -i 's/listen  80;/listen 8080;/' /etc/nginx/conf.d/default.conf

# 暴露 8080 埠
EXPOSE 8080

# 啟動 Nginx
CMD ["nginx", "-g", "daemon off;"]
