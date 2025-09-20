
# AAllyCare  

AAllyCare is a Flutter application for health and fitness. It includes assessments, appointments, and personalized challenges, built with Firebase authentication and Riverpod state management.  

## Architecture Decisions  
- **Flutter + Riverpod** for cross-platform UI and scalable state management.  
- **GoRouter** for navigation with authentication-based redirects.  
- **Firebase Auth** for login, signup, and logout.  
- **Modular structure** (auth, home, assessment, etc.) for easy maintenance.  

## State Management Choices  
- **Riverpod** for providers and controllers.  
- **AsyncValue** to handle loading, error, and data states in UI.  
- **GoRouter + Riverpod** integration to automatically redirect based on authentication state.  

## Challenges Faced  
- Handling smooth login → splash → home transitions.  
- Managing logout from the right-side drawer without UI glitches.  
- Making layouts responsive across devices and handling keyboard overlays.  
- Providing clear error messages and loading indicators.  

## How to Run the App  
### Prerequisites  
- Flutter SDK (>=3.0.0)  
- Firebase project  

### Setup  
1. Clone the repository.  
2. Run `flutter pub get`.  
3. Add Firebase config:  
   - `google-services.json` (Android)  
   - `GoogleService-Info.plist` (iOS)  
4. Start the app with:  
   ```bash
   flutter run
