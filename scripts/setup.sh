#!/usr/bin/env bash
set -e

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}Initializing InfraNexus Environment...${NC}"

# Check and copy root production env example if needed
if [ ! -f .env.production ] && [ -f .env.production.example ]; then
    echo -e "${GREEN}Creating .env.production from template...${NC}"
    cp .env.production.example .env.production
    echo "Remember to update .env.production with your real secrets for deployment!"
fi

# Frontend
if [ -d frontend ]; then
    if [ ! -f frontend/.env ] && [ -f frontend/.env.example ]; then
        echo -e "${GREEN}Creating frontend/.env from template...${NC}"
        cp frontend/.env.example frontend/.env
    fi
fi

# Backend
if [ -d backend ]; then
    if [ ! -f backend/.env ] && [ -f backend/.env.example ]; then
        echo -e "${GREEN}Creating backend/.env from template...${NC}"
        cp backend/.env.example backend/.env
    fi
fi

echo -e "${BLUE}Setup complete! You can now run docker-compose up -d db and start the services.${NC}"
