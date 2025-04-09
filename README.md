# homelab-cloud
# 🧠 Homelab Monitoring

📊 **Система мониторинга для домашней инфраструктуры**, собранная на базе:
- **Prometheus** — сбор метрик
- **Grafana** — визуализация
- **Alertmanager** — алерты (включая Telegram)
- **Node Exporter** — экспорт метрик с хоста

---

## 🚀 Быстрый старт

```bash
git clone https://github.com/Santyago-web/homelab-monitoring.git
cd homelab-monitoring
docker compose up -d
```

> ⚠️ **Секретные данные и переменные окружения (`.env`) не добавлены в git.**  
> Для уведомлений в Telegram используй свой `bot_token` и `chat_id`.

---

## 🛠 Стек

| Компонент      | Назначение                      | Порт |
|----------------|----------------------------------|------|
| Prometheus     | Сбор и хранение метрик          | 9090 |
| Grafana        | Дашборды и визуализация         | 3000 |
| Alertmanager   | Уведомления по событиям         | 9093 |
| Node Exporter  | Метрики с хостов                | 9100 |

---

## 📂 Структура проекта

```
homelab-monitoring/
│
├── prometheus/
│   ├── prometheus.yml         # конфиг Prometheus
│   └── alert.rules.yml        # правила алертов
│
├── alertmanager/
│   └── alertmanager.yml       # конфиг Alertmanager (в .gitignore)
│
├── .env                       # переменные окружения (в .gitignore)
├── .gitignore
└── docker-compose.yml         # запуск всех сервисов
```

---

## 📬 Уведомления в Telegram

### Пример `.env`:

```env
TELEGRAM_BOT_TOKEN=123456:ABC-DEF1234ghIkl-zyx57W2v1u123ew11
TELEGRAM_CHAT_ID=123456789
```

### Пример секции в `alertmanager.yml`:

```yaml
receivers:
  - name: 'telegram'
    telegram_configs:
      - bot_token: '{{ env "TELEGRAM_BOT_TOKEN" }}'
        chat_id: '{{ env "TELEGRAM_CHAT_ID" }}'
```

---

## 📸 Скриншоты

> Будут позже

---

## 💡 Планы

- [ ] Подключение NAS через NFS/SNMP
- [ ] Мониторинг Docker-контейнеров
- [ ] Дашборды в Grafana для разных устройств
- [ ] Интеграция с Discord, Email, Matrix и другими каналами

---

## 🧾 Лицензия

Проект распространяется под лицензией MIT.
