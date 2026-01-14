# Block Description - Deployment Guide

## Web Version (Vercel)

### Prerequisites
- GitHub account
- Vercel account (free)

### Steps

1. **Push to GitHub**
   ```bash
   git push origin main
   ```

2. **Connect to Vercel**
   - Go to https://vercel.com/new
   - Import your GitHub repository
   - Vercel will auto-detect Next.js settings
   - Click Deploy

3. **Environment Variables (if needed)**
   - Go to Project Settings > Environment Variables
   - Add any required variables

The web version auto-deploys on every push to `main` branch.

---

## Mobile Version (iOS & Android)

### Prerequisites
- EAS account (https://expo.dev)
- Apple Developer account (for iOS)
- Google Play Developer account (for Android)

### Build Setup

1. **Authenticate with EAS**
   ```bash
   npm install -g eas-cli
   eas auth login
   ```

2. **Build APK (Android)**
   ```bash
   eas build --platform android --local
   ```

3. **Build IPA (iOS)**
   ```bash
   eas build --platform ios --local
   ```

### Automated Builds (GitHub Actions)

Add these secrets to GitHub (Settings > Secrets > Actions):
- `EAS_TOKEN` - Get from https://expo.dev/settings
- `VERCEL_TOKEN` - Get from https://vercel.com/account/tokens
- `VERCEL_ORG_ID` - Your Vercel organization ID
- `VERCEL_PROJECT_ID` - Your Vercel project ID

Trigger builds with:
```bash
git push origin releases/mobile -m "[android]" # For Android
git push origin releases/mobile -m "[ios]"     # For iOS
```

---

## Publishing to App Stores

See `PUBLISH_APP_STORE.md` and `PUBLISH_PLAY_STORE.md` for detailed instructions.
