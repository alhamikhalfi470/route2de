# Route2DE v1 - App Privacy Mapping

## SDK in use
- Firebase Authentication
- Cloud Firestore
- Firebase Core

## Data used by app features
- `Email` (account login/register)
- `User ID` (Firebase UID)
- `User content`:
  - `users/{uid}` profile fields
  - `results` (assessment outputs)
  - `users/{uid}/todos`
  - `users/{uid}/field_reflections`

## Data usage purpose
- App functionality:
  - authentication
  - storing and retrieving user assessment and progress data
- No ad personalization flow implemented in v1.

## Tracking
- No cross-app tracking flow implemented in app code.
- ATT prompt is not implemented in v1.

## Notes for App Store Connect
- Fill privacy form based on actual enabled Firebase modules in release build.
- Re-check if Analytics/Crashlytics modules are enabled later.
