# InfraNexus Core

**IDE for Virtual Machines** - A powerful, web-based integrated development environment specifically designed for managing, accessing, and developing on virtual machines.

![InfraNexus Screenshot](https://via.placeholder.com/1200x600.png?text=InfraNexus+IDE+Screenshot)

## Features

- **Web-based IDE**: Full-featured code editor in your browser.
- **VM Integration**: Seamlessly connect, provision, and deploy logic to virtual machines.
- **AI Assist**: Built-in coding agent powered by Amazon Bedrock (Claude 3.5 Sonnet).
- **Secure by Default**: Uses environment variables for configuration, HTTPS via Caddy (in production), and supports SSO/OAuth.
- **Real-time Terminal**: Browser-based terminal access directly to your environments.
- **Stripe Integration**: Built-in billing portal for SaaS deployments.

## Architecture Overview

InfraNexus is composed of a modern full-stack web architecture:
- **Frontend**: Next.js 15 (React), Tailwind CSS, NextAuth.js for authentication.
- **Backend**: Express.js, handling heavy logic, AI integrations, WebSocket terminal sessions, and VM deployments.
- **Database**: PostgreSQL with Prisma ORM.
- **Infrastructure**: Designed to run via Docker Compose, Caddy as a reverse proxy/TLS terminator.

## Quickstart

### Development

1. Ensure you have Docker, Node.js, and Postgres installed (or use the provided `docker-compose.yml` for Postgres).
2. Clone the repository: `git clone https://github.com/your-org/infranexus-core`
3. Run the setup script to initialize environment configurations:
   ```bash
   bash scripts/setup.sh
   ```
4. Start Postgres via Docker (if doing local dev):
   ```bash
   docker-compose up -d db
   ```
5. Install dependencies and start the app:
   ```bash
   cd frontend && npm install && npm run dev
   cd ../backend && npm install && npm run dev
   ```

### Production (Docker)

To run the whole stack via Docker Compose:

1. Clone the project.
2. Initialize environment variables. Ensure `DOMAIN` is set in your `.env.production` if using Caddy for automatic HTTPS.
3. Start the stack:
   ```bash
   docker-compose -f docker-compose.prod.yml up -d --build
   ```

## Security Model

Security is a primary concern for InfraNexus since it interacts heavily with VMs and APIs.
- No secrets are committed to the repository.
- Secure environment configuration defaults.
- All dependencies are continually audited.
- Caddy provides automatic and secure TLS certs in production.
- For more details on reporting vulnerabilities, please consult our [SECURITY.md](./SECURITY.md).

## Limitations

- Next.js currently requires Node.js v18.17.0+ 
- Stripe integration requires configuring external Webhook endpoints.

## FAQ

- **Does it run on Raspberry Pi / ARM?**  
  Yes, the provided Dockerfiles use node-alpine which supports multi-arch builds.
- **How can I customize the AI Agent?**  
  You can change the `BEDROCK_MODEL_ID` in your `.env` to any model supported by your AWS Bedrock account.

## Contributing

We welcome contributions! Please see our [Contributing Guide](CONTRIBUTING.md) for details on setting up your development environment and making your first PR.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.