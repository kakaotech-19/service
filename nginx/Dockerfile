FROM nginx

# 기본 설정 파일 제거
RUN rm /etc/nginx/conf.d/default.conf

# Nginx 설정 파일 복사
COPY default.conf /etc/nginx/conf.d/default.conf

# Nginx 시작
CMD ["nginx", "-g", "daemon off;"]