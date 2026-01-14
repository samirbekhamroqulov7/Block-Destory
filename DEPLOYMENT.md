# Block Description - Complete Deployment Guide

## Prerequisites

- Node.js 18+
- Git
- Expo CLI: `npm install -g eas-cli`
- EAS Account: https://expo.dev (free)
- Platform-specific requirements below

## Part 1: Web Deployment (Vercel)

### Setup Vercel

1. **Create Vercel account** at vercel.com
2. **Connect GitHub repository**
3. **Deploy automatically**

Vercel автоматически деплоит при каждом пуше в `main` ветку.

### Manual Web Deploy

```bash
npm run build
npm start
```

Or with Vercel CLI:
```bash
npm install -g vercel
vercel
```

## Part 2: Mobile Deployment (EAS Build)

### Initial Setup

```bash
npm install
eas login
```

### Configuration

1. Update `app.json`:
   - App name: "Block Description"
   - Bundle ID: com.blockdescription.game
   - Package: com.blockdescription.game

2. Generate EAS project:
   ```bash
   eas init
   ```

## Part 3: Android Deployment (Google Play)

### Requirements
- Google Play Developer Account ($25 one-time)
- Service account key for API access

### Step 1: Create Google Play Service Account

1. Go to https://play.google.com/console
2. **Settings** → **API Access** → **Service accounts**
3. Click **Google Cloud Console** link
4. Create new service account with following roles:
   - Service Account User
   - Service Account Token Creator
5. Create JSON key and save as `google-play-api-key.json`

### Step 2: Build for Android

```bash
eas build --platform android
```

This creates an App Bundle (.aab file) optimized for Play Store.

Options:
- `--auto-submit` - автоматически загружает на Play Store
- `--local` - собирает локально (требует Android SDK)
- `--clear-cache` - очищает кэш сборки

### Step 3: Prepare Store Listing

In Google Play Console:
- [ ] App title: "Block Description"
- [ ] Short description (80 chars): "Addictive block breaker game with dynamic colors"
- [ ] Full description (4000 chars): Подробное описание геймплея
- [ ] Category: Games → Arcade
- [ ] Content rating: Complete questionnaire
- [ ] Target API: 34+
- [ ] Screenshots: 5-8 штук (1080x1920)
- [ ] Feature graphic: 1024x500 PNG
- [ ] App icon: 512x512 PNG
- [ ] Privacy policy URL (если собираете данные)

### Step 4: Submit for Review

```bash
eas submit --platform android
```

Or manually:
1. Go to Google Play Console
2. Releases → Production
3. Create new release
4. Upload AAB file from EAS
5. Add release notes
6. Review all content
7. Submit for review

Review usually takes **2-4 hours**.

## Part 4: iOS Deployment (App Store)

### Requirements
- Apple Developer Program ($99/year)
- Apple ID with 2FA enabled
- App Specific Password for CI/CD

### Step 1: Create Apple Developer Account

1. Go to https://developer.apple.com
2. Enroll in Developer Program
3. Accept agreements
4. Create bundle ID: `com.blockdescription.game`

### Step 2: App Specific Password (for CI/CD)

1. Go to https://appleid.apple.com
2. Security → App Specific Passwords
3. Generate password for "Expo"
4. Save it safely

### Step 3: Configure EAS

Update `eas.json`:
```json
{
  "submit": {
    "production": {
      "ios": {
        "ascAppId": "YOUR_APP_ID",
        "appleId": "your@email.com",
        "appleTeamId": "YOUR_TEAM_ID",
        "appleAppSpecificPassword": "xxxx-xxxx-xxxx-xxxx"
      }
    }
  }
}
```

### Step 4: Build for iOS

```bash
eas build --platform ios
```

- `--auto-submit` - загружает в TestFlight автоматически
- `--simulator` - для локального тестирования

### Step 5: Prepare App Store Listing

In App Store Connect:
- [ ] App name: "Block Description"
- [ ] Subtitle: "Break Blocks, Reach New Levels"
- [ ] Category: Games > Arcade
- [ ] Content rating: Complete
- [ ] Description (4000 chars)
- [ ] Keywords: block, breaker, game, puzzle, arcade
- [ ] Screenshots: 5 на iPhone 6.7" (2532x1170)
- [ ] App Preview video (optional)
- [ ] Privacy Policy URL
- [ ] Support URL
- [ ] Age rating: 4+

### Step 6: Submit to App Store

```bash
eas submit --platform ios
```

Or manually:
1. App Store Connect
2. TestFlight → Builds (verify no crashes)
3. App Store → Version
4. Add release notes
5. Submit for review

Review usually takes **1-2 days**.

## Part 5: GitHub Actions CI/CD

### Setup Secrets

1. Go to GitHub repository
2. Settings → Secrets and variables → Actions
3. Add secrets:
   - `VERCEL_TOKEN` - from https://vercel.com/account/tokens
   - `VERCEL_ORG_ID` - your Vercel org ID
   - `VERCEL_PROJECT_ID` - your Vercel project ID
   - `EAS_TOKEN` - from `eas token`

### Automated Workflows

**On push to `main`:**
1. Tests run
2. Lint checks
3. Web deploys to Vercel
4. Android builds with EAS
5. iOS builds with EAS
6. Both submit to app stores

View in `.github/workflows/` directory.

## Part 6: Updates After Launch

### Web Update
```bash
git push origin main
```
Vercel деплоит автоматически.

### Mobile Update

1. Bump version in `package.json` and `app.json`
2. Push to main branch
3. EAS автоматически собирает и деплоит
4. Или ручной деплой:
   ```bash
   eas build --platform android
   eas build --platform ios
   eas submit
   ```

### Hot Updates (без переубки на app stores)

```bash
eas update
```

Обновляет JavaScript без нового App Store/Play Store релиза.

## Troubleshooting

### Build Failed
```bash
eas build:view  # View logs
eas build --platform android --clear-cache
```

### Submission Rejected
- Read detailed rejection message
- Fix issues mentioned
- Resubmit with explanation

### App Crashes
- Check Sentry or Crashlytics logs
- Fix in code
- Push update

## Useful Commands

```bash
# Local testing
npm run dev          # Web dev server
npm run build        # Build web

# Mobile builds
eas build --platform android
eas build --platform ios
eas build --status   # Check build status

# Submissions
eas submit --platform android
eas submit --platform ios

# Updates
eas update           # Push hot update
eas update:view      # View update history
```

## Resources

- Expo Docs: https://docs.expo.dev
- EAS Documentation: https://eas.expo.dev
- Vercel: https://vercel.com/docs
- Google Play Console: https://play.google.com/console
- Apple App Store Connect: https://appstoreconnect.apple.com
