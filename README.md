# Store Service App

A Flutter app that displays and filters store items with a clean, modern interface.

## Architecture

### Clean Architecture + BLoC Pattern

This app uses **Clean Architecture** with **BLoC (Business Logic Component)** pattern because:

#### Why Clean Architecture?
- **Separation of Concerns**: Code is organized into clear layers
- **Easy Testing**: Each layer can be tested independently
- **Maintainable**: Changes in one layer don't break others
- **Scalable**: Easy to add new features without touching existing code

#### Architecture Layers:

1. **Presentation Layer** (`lib/src/features/item/presentation/`)
   - Pages (UI screens)
   - Widgets (reusable UI components)
   - BLoC (state management)

2. **Domain Layer** (`lib/src/features/item/domain/`)
   - Entities (data models)
   - Use Cases (business logic)
   - Repository interfaces

3. **Data Layer** (`lib/src/features/item/data/`)
   - Repository implementations
   - Data sources (API calls, local storage)
   - Models (data conversion)

4. **Core Layer** (`lib/src/core/`)
   - Dependency injection
   - Network client
   - Common utilities

#### Why BLoC Pattern?
- **Predictable State**: Easy to understand what's happening
- **Reactive**: UI updates automatically when data changes
- **Testable**: Business logic is separate from UI
- **Flutter Recommended**: Works perfectly with Flutter

## Project Structure

```
lib/
├── src/
│   ├── core/                    # Shared utilities
│   │   ├── di/                  # Dependency Injection
│   │   ├── network/             # API client setup
│   │   └── config/              # App configuration
│   │
│   └── features/
│       └── item/                # Item feature
│           ├── presentation/    # UI Layer
│           │   ├── pages/       # Screen pages
│           │   ├── widgets/     # Reusable UI parts
│           │   └── bloc/        # State management
│           │
│           ├── domain/          # Business Logic
│           │   ├── entities/    # Data models
│           │   ├── repositories/# Data contracts
│           │   └── usecases/    # Business operations
│           │
│           └── data/            # Data Layer
│               ├── models/      # API data models
│               ├── repositories/# Data implementation
│               └── datasources/ # API & local data
```

## Features

### ✅ Current Features
- Display list of store items
- Filter items by category and subcategory
- Modern card-based UI design
- Auto-apply filters (no apply button needed)
- Clear filters functionality
- Error handling with retry option
- Loading states

### 🔧 Technical Features
- Clean Architecture implementation
- BLoC state management
- Dependency injection with GetIt
- HTTP API integration with Dio
- Local data caching
- Network connectivity checking

## UI/UX Design Choices

### Design Philosophy
**Simple, Clean, and User-Friendly**

#### Why This Approach?
- **Less Cognitive Load**: Users can focus on finding items, not figuring out the interface
- **Modern Look**: Clean cards and proper spacing make the app feel premium
- **Fast Interaction**: Auto-applying filters saves time
- **Error Recovery**: Clear error messages with action buttons help users when things go wrong

#### Key Design Decisions:

1. **Card-Based Layout**
   - Each item is in a clean white card
   - Easy to scan through items
   - Clear visual separation

2. **Filter Section**
   - Prominent filter card at the top
   - Dropdowns are clearly labeled
   - Auto-apply filters (no extra button click needed)
   - Clear filters button only shows when needed

3. **Color Scheme**
   - Blue for primary actions and filters
   - Grey for backgrounds and secondary text
   - White cards for content
   - Consistent color usage throughout

4. **Typography**
   - Clear font weights for hierarchy
   - Good contrast for readability
   - Proper sizing for mobile screens

5. **Interactive Elements**
   - Loading indicators for better feedback
   - Clear error states with retry options
   - Proper button states and hover effects

6. **User Experience**
   - Filters automatically apply when selected
   - Clear visual feedback for active filters
   - Empty states with helpful messages
   - One-tap filter clearing

## API Integration

The app connects to REST API endpoints:
- `GET /items` - Get all items
- `GET /items/filter?category=X&subCategory=Y` - Get filtered items

## Dependencies

Key packages used:
- `flutter_bloc` - State management
- `dio` - HTTP client
- `get_it` - Dependency injection
- `dartz` - Functional programming (Either type)
- `equatable` - Object equality comparison

## Getting Started

1. Clone the repository
2. Run `flutter pub get` to install dependencies
3. Update API base URL in `lib/src/core/config/env_config.dart`
4. Run `flutter run` to start the app

