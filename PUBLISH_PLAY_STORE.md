# Publishing to Google Play Store

## Setup

1. **Create Google Play Developer Account**
   - Go to https://play.google.com/console
   - Pay $25 registration fee
   - Complete store listing

2. **Create Release Build**
   ```bash
   eas build --platform android --release
   ```

3. **Upload AAB (Android App Bundle)**
   - Go to Google Play Console
   - Navigate to Release > Production
   - Upload the AAB file from EAS build
   - Add release notes
   - Review content rating
   - Set pricing and distribution

4. **Rollout**
   - Start with 10% rollout
   - Monitor for crashes
   - Gradually increase to 100%

## Pre-launch Checklist

- [ ] App icon (512×512 PNG)
- [ ] Screenshots (at least 2)
- [ ] Short description (80 chars)
- [ ] Full description (4000 chars)
- [ ] Privacy policy URL
- [ ] Content rating completed
- [ ] Testing instructions for reviewers

## Common Rejections

- **Content Policy**: Ensure game doesn't violate Google Play policies
- **Permissions**: Only request necessary permissions
- **Crashes**: Test thoroughly before release
- **Ads**: If using ads, ensure proper disclosure

## Monitoring

- Go to Analytics tab
- Monitor daily active users, crashes, rating
- Respond to user reviews
