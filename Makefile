release:
	docker buildx build --platform linux/arm64 -t staczoquiz:latest .
	docker tag staczoquiz:latest frooko/staczoquiz:latest
	docker push frooko/staczoquiz:latest
