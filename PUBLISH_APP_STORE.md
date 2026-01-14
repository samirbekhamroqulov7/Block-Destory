# Publishing to Apple App Store

## Setup

1. **Create Apple Developer Account**
   - Go to https://developer.apple.com
   - Pay $99/year
   - Complete agreements

2. **Create Release Build**
   ```bash
   eas build --platform ios --release
   ```

3. **Upload to TestFlight First (Optional)**
   - EAS will prompt to upload to TestFlight
   - Great for testing before App Store submission
   - Get feedback from test users

4. **Submit to App Store**
   - Go to App Store Connect
   - Create new app
   - Upload IPA or use TestFlight submission
   - Complete app information
   - Add screenshots and preview video
   - Add release notes

5. **App Review**
   - Apple reviews within 24-48 hours
   - Respond to any rejections
   - Resubmit if needed

## Pre-submission Checklist

- [ ] Privacy Policy URL
- [ ] App Icons (1024×1024 PNG)
- [ ] Screenshots (at least 2 per device)
- [ ] Preview video (optional)
- [ ] Keywords (100 chars)
- [ ] Category selected
- [ ] Age rating completed
- [ ] No external payment outside App Store

## Common Rejections

- **Guideline 2.1**: Aesthetic issues
- **Guideline 2.3**: Third-party apps blocked
- **Guideline 4.3**: Not enough content
- **Privacy**: Missing privacy policy

## After Launch

- Monitor ratings and reviews
- Respond to user feedback
- Update regularly with improvements
- Monitor crash reports
