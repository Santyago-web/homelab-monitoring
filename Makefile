up:
	docker compose up -d

down:
	docker compose down

restart:
	docker compose restart

logs:
	docker compose logs -f

lint:
	yamllint .github docker-compose.yml prometheus

check:
	promtool check config prometheus/prometheus.yml
	promtool check rules prometheus/alert.rules.yml
	test -f alertmanager/alertmanager.yml && amtool check-config alertmanager/alertmanager.yml || echo "alertmanager.yml пропущен"

reload:
	curl -X POST http://localhost:9090/-/reload || echo "Prometheus reload failed"
