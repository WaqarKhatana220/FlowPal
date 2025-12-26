# FlowPal – A One-Stop Solution for Scheduling Your Workflows

A powerful workflow automation platform that lets you schedule, manage, and execute workflows with ease.

---

## Prerequisites

Before getting started, ensure you have the following installed on your system:

- **Docker** and **Docker Compose**
- **Make** (for running Makefile commands)

---

## Quick Start

### 1. Clone the Repository
```bash
git clone <repository-url>
cd FlowPal
```

### 2. Configure Environment Variables

Copy the example environment file and update it with your local configuration:
```bash
cp .env.example .env
# Edit .env with your settings
```

### 3. Configure `docker-compose.override.dev.yml`
For running the dev server, you need a `docker-compose.override.dev.yml` file to use Makefile commands. Create one based on the example:

```bash
cp docker-compose.override.dev.yml.example docker-compose.override.dev.yml
```

### 3. Build Docker Image
```bash
make image
```

### 4. Start Services

Start the database and Redis services:
```bash
make services
```

### 5. Start Development Server
```bash
make dev-run
```

Your application will be available at `http://localhost:8000`.

### 6. Run Migrations

Access the server container and run Django migrations:
```bash
make shell
```

Inside the container:
```bash
python manage.py migrate
```

---

## Common Commands

| Command | Description |
|---------|-------------|
| `make image` | Build Docker image |
| `make services` | Start database and Redis |
| `make dev-run` | Start development server |
| `make shell` | Access server container |
| `make help` | View all available commands |
