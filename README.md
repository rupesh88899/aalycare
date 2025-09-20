
# AAllyCare  

AAllyCare is a Flutter application for health and fitness. It includes assessments, appointments, and personalised challenges, built with Firebase authentication and Riverpod state management.  

## Vedio 

https://github.com/user-attachments/assets/887a09f8-b8f2-4137-9f40-7ee5d9ac0394

## Images

- Splashscreen  
<img src="https://github.com/user-attachments/assets/ee56c09f-9297-4002-a0fb-c15a5ec50133" width="300">

- Login/Sign-in page  
<img src="https://github.com/user-attachments/assets/9545dd40-59e6-48d0-b5c2-3cd831ef8a0d" width="300">

- My Assessment page  
<img src="https://github.com/user-attachments/assets/602dce72-7274-4d6f-a6fe-f73f7c633e8b" width="300">

- My Appointments page  
<img src="https://github.com/user-attachments/assets/7227e2b6-0ea9-4899-b51c-1fb0e91c14ba" width="300">

- Health Risk Assessment  
<img src="https://github.com/user-attachments/assets/7099d476-d2ad-4804-8ec9-50ec31518820" width="300">

- Drawer with Logout Button  
<img src="https://github.com/user-attachments/assets/8f899fd8-b743-476c-9cd4-266575c4e23f" width="300">


  

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
