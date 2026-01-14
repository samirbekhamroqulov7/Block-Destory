# Quick Start Guide

## Local Development

```bash
# Install dependencies
npm install

# Start dev server
npm run dev

# Open browser
# http://localhost:3000
```

## Build & Test

```bash
# Production build
npm run build

# Start production server
npm start

# Type check
npm run type-check

# Lint code
npm run lint
```

## Deploy

### Web (Vercel)
```bash
git push origin main
# Automatically deploys to Vercel
```

### Mobile (Expo)
```bash
# Android
npm install -g eas-cli
eas auth login
eas build --platform android

# iOS
eas build --platform ios
```

## Troubleshooting

**Build fails with dependency errors**
```bash
npm cache clean --force
rm -rf node_modules package-lock.json
npm install
```

**Port 3000 already in use**
```bash
npm run dev -- -p 3001
```

**Type errors**
```bash
npm run type-check
```

For more help, see DEPLOY.md
