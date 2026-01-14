# Google Play Store Comprehensive Publishing Guide

## Account Setup

### Prerequisites
- Google account
- $25 one-time developer registration fee
- Phone number for account verification

### Create Developer Account

1. Visit https://play.google.com/console
2. Click **Create account**
3. Agree to Developer Distribution Agreement
4. Pay $25 registration fee
5. Verify phone number
6. Complete account setup

## Service Account for Automated Submissions

### Generate API Key

1. **Google Cloud Console:**
   - Go to https://console.cloud.google.com
   - Create new project

2. **Enable APIs:**
   - Search "Google Play Android Developer API"
   - Click Enable

3. **Create Service Account:**
   - Credentials → Create Credentials → Service Account
   - Give it Editor role
   - Create JSON key
   - Download and save as `google-play-api-key.json`

4. **Link to Play Console:**
   - Play Console → Settings → API Access
   - Create new service account link
   - Upload the service account JSON key

### Add to Repository (Securely)

Do NOT commit `google-play-api-key.json` to git!

Instead:
1. Add to GitHub Secrets
2. Base64 encode: `base64 google-play-api-key.json`
3. Add as `GOOGLE_PLAY_API_KEY` secret
4. GitHub Actions decodes it during build

## App Creation

### Basic Information

1. **App name:** Block Description
2. **Package name:** com.blockdescription.game
3. **App category:** Games → Arcade
4. **Description:** Break blocks, reach high levels, dynamic difficulty
5. **Content rating:** Games (age appropriate)

### Store Listing Content

#### Mandatory
- [ ] App name (50 chars max)
- [ ] Short description (80 chars)
- [ ] Full description (4000 chars)
- [ ] Screenshots (minimum 2, recommended 5-8)
- [ ] Feature graphic (1024x500 PNG)
- [ ] App icon (512x512 PNG)
- [ ] Target API level: 34+

#### Recommended
- [ ] Promotional video
- [ ] Contact email
- [ ] Website
- [ ] Privacy policy URL

### Graphics & Media Specifications

#### Screenshots
- **Format:** PNG or JPEG
- **Phone:** 1080x1920 pixels (minimum 2, max 8)
- **Tablet:** 1200x1600 pixels (optional)
- **Requirements:**
  - Show actual gameplay
  - Include captions explaining features
  - High quality, no blurry images
  - Safe area: 90px margins

#### Feature Graphic
- **Size:** 1024x500 pixels
- **Format:** PNG or JPEG
- **Purpose:** Displayed at top of store listing
- **Design:** Showcase main game feature

#### App Icon
- **Size:** 512x512 pixels
- **Format:** PNG or JPEG
- **Requirements:**
  - No transparency needed
  - High contrast
  - Recognizable at small sizes
  - Match app brand

### Content Rating

1. Go to **Content rating** questionnaire
2. Select category:
   - Games
   - IARC questionnaire
3. Answer about:
   - Violence
   - Sexual content
   - Substance abuse
   - Language
   - Other content
4. System auto-assigns rating (Unrated, 3+, 7+, 12+, 16+, 18+)

For "Block Description" - typically **Unrated** or **3+**

### Price & Distribution

1. **Price:**
   - Free app (recommended)
   - Paid ($0.99 - $399.99)
   - In-app purchases (optional)

2. **Distribution:**
   - Available in all countries
   - Or select specific countries
   - No restrictions needed

3. **Devices:**
   - Phone
   - Tablet
   - TV (optional)

## Build Preparation

### Build Requirements

Before submission:
- [ ] Minimum SDK: 24
- [ ] Target SDK: 34+
- [ ] Version code: 1
- [ ] Version name: 1.0.0

### Build with EAS

```bash
# Login to EAS
eas login

# Build APK for testing
eas build --platform android --local

# Build AAB for Play Store (recommended)
eas build --platform android
```

### Signed App Bundle (AAB)

EAS automatically signs with Play App Signing.

You can also manually sign:
```bash
jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 \
  -keystore release-key.jks app-release-unsigned.apk alias_name
```

## Store Listing Checklist

### Metadata
- [ ] App name: Block Description
- [ ] Short description: 80 chars exactly
- [ ] Full description: Engaging, 4000 chars
- [ ] Category: Games/Arcade
- [ ] Target audience: 3+ years
- [ ] Contact information: email@example.com

### Visuals
- [ ] App icon (512x512) - colorful, recognizable
- [ ] Feature graphic (1024x500) - eye-catching
- [ ] Screenshots (5-8): Show gameplay, add captions
- [ ] Video (optional): 15-30 seconds, gameplay

### Compliance
- [ ] Privacy policy linked
- [ ] Target API 34+
- [ ] Permissions justified
- [ ] Ads policy (none in this game)
- [ ] Approved rating

## Submission Process

### Step 1: Create Release

1. Go to **Releases** → **Production**
2. Click **Create new release**
3. Click **Browse files** → select AAB
4. Upload signed bundle

### Step 2: Add Release Notes

- What's new? (max 500 chars)
- Example: "Initial launch! Break blocks and reach new levels!"

### Step 3: Review

- Review all information
- Check content rating
- Verify graphics
- Test app functionality

### Step 4: Submit

1. Scroll to top
2. Click **Submit**
3. Confirm submission

### Step 5: Track Review

1. Status: Usually **In review** (2-4 hours)
2. View in **Releases** → **Overview**
3. Set automatic rollout (optional)

## Common Rejection Reasons

### Functional Issues
- **App crashes:** Test thoroughly, check logs
- **Poor performance:** Optimize code
- **Broken links:** Verify all URLs work

### Content Issues
- **Misleading description:** Match app to description
- **Stolen content:** Use original assets
- **Inappropriate content:** Check age rating

### Policy Violations
- **Ads in free app:** Not allowed without disclosure
- **Excessive permissions:** Minimize requested permissions
- **Deceptive practices:** Be honest in description

## Post-Launch Management

### Monitor Performance

1. **Crashes & errors:**
   - Android Vitals section
   - Fix high-impact crashes
   - Push updates ASAP

2. **Reviews & ratings:**
   - Monitor 1-2 star reviews
   - Respond professionally
   - Fix reported issues

3. **Install metrics:**
   - Track installs
   - Monitor uninstalls
   - Analyze user behavior

### Update Process

1. Bump version code (e.g., 1 → 2)
2. Build new AAB: `eas build --platform android`
3. Submit as new release
4. Review takes 1-2 hours typically

### Promote Updates

After approval:
1. Create release notes
2. Announce on social media
3. Monitor crash reports
4. Collect feedback

## Pricing Strategy

**Block Description is FREE** - Good strategy because:
- Higher download volume
- Faster review approval
- No payment processing needed
- Can add in-app purchases later

## Analytics & Optimization

### What to Track
- Daily/monthly active users
- Retention rate (1-day, 7-day, 30-day)
- Crash rate
- User ratings over time
- Geographic distribution

### Store Listing Optimization
- A/B test screenshots
- Refresh promotional text seasonally
- Update based on user feedback
- Monitor competitor apps

## Useful Links

- Play Console: https://play.google.com/console
- Policies: https://play.google.com/about/developer-content-policy/
- Android Studio: https://developer.android.com/studio
- Play SDK Reference: https://developer.android.com/reference
