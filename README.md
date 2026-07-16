# BarberShopHQ

Sinatra-приложение для записи в барбершоп.

## Запуск

```bash
bundle install
bundle exec rake db:migrate
bundle exec rackup
```

Откройте http://localhost:9292

## Что умеет

- `/visit` — запись к барберу (POST сохраняет клиента в БД)
- `/booking` — список записавшихся
- `/contacts` — отправка сообщения (email + текст)
