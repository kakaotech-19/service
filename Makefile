.PHONY: all test test-down fclean re help

# Docker Compose 실행
all: test

test:
	cd test && sudo docker compose up -d

# Docker Compose 중지 및 컨테이너 제거
test-down:
	cd test && sudo docker compose down

# 컨테이너, 이미지, 볼륨 정리
fclean:
	sudo docker compose -f test/compose.yaml down -v --rmi all
	sudo docker system prune -af

re:
	make fclean
	chmod +x test/deploy.sh
	sudo ./test/deploy.sh

# 도움말
help:
	@echo "사용 가능한 명령어:"
	@echo "  make up      - 컨테이너 실행"
	@echo "  make down    - 컨테이너 중지"
	@echo "  make fclean   - 전체 정리"
	@echo "  make re      - 전체 정리 후 재실행"