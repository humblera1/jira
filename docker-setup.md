# Установка Docker и Docker Compose на CentOS 7

## 1. Установка Docker

### 1.1. Удалите старые версии Docker (если есть)
```bash
sudo yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-engine
```

### 1.2. Установите необходимые пакеты и добавьте репозиторий Docker
```bash
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
```

### 1.3. Установите Docker Engine, CLI и containerd
```bash
sudo yum install -y docker-ce docker-ce-cli containerd.io
```

### 1.4. Запустите Docker и настройте автозапуск
```bash
sudo systemctl start docker
sudo systemctl enable docker
```

### 1.5. Проверьте установку
Запустите тестовый контейнер:
```bash
sudo docker run hello-world
```
Если установка успешна – вы увидите приветственное сообщение от Docker.

## 2. Установка Docker Compose

### 2.1. Загрузите последнюю версию Docker Compose
Проверьте последнюю [релизную страницу Docker Compose](https://github.com/docker/compose/releases) и замените версию (пример ниже — версия 1.29.2):
```bash
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
```

### 2.2. Сделайте бинарный файл исполняемым
```bash
sudo chmod +x /usr/local/bin/docker-compose
```

### 2.3. Проверьте установку Docker Compose
```bash
docker-compose --version
```

Теперь у вас должны быть установлены Docker и Docker Compose, и вы сможете запускать контейнеры согласно docker-compose.yml.

*Примечание:* Если на сервере используются SELinux или firewall, убедитесь, что они настроены корректно для работы с Docker.