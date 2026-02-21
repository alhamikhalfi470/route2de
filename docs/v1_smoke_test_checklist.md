# Route2DE v1 - Smoke Test Checklist

## Authentication
1. Register with new email.
2. Logout from profile settings.
3. Login with same account.
4. Wrong password shows error.
5. Forgot password sends reset email.

## Core assessment flow
1. Open questionnaire.
2. Submit answers.
3. Verify document created in `results`.
4. Open Home and verify latest result loaded.
5. Test empty state (user without `results`) does not crash.

## Explore and detail
1. Open Explore tab.
2. Open `Pflege & Care` detail page.
3. Open Recommendation Detail from Home.
4. Open `Ausbildungsvertrag` info page from action CTA.

## Legal screens
1. Open Profile settings.
2. Open Privacy Policy page.
3. Open Terms of Use page.
4. Open Immigration Disclaimer page.

## Account deletion (Apple compliance)
1. Open Profile settings.
2. Tap `Delete Account`.
3. Confirm delete.
4. If prompted, complete re-auth password.
5. Verify:
   - Firebase Auth user deleted.
   - `users/{uid}` deleted.
   - `results` where `userId == uid` deleted.
   - `users/{uid}/todos` deleted.
   - `users/{uid}/field_reflections` deleted.
