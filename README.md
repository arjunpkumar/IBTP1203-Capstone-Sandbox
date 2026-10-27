# 🛡️ Security Monitoring Companion

An enterprise-grade, multi-screen iOS security monitoring application built with **SwiftUI**, **SwiftData**, and modern **Swift Concurrency (`async/await`)**. Developed as a capstone sandbox project to demonstrate robust local persistence, asynchronous networking, clean architectural patterns, and automated unit testing.

---

## 🚀 Key Features

* **Authentication Flow:** Secure mock login screen managing root application state.
* **Security Zone Dashboard:** Real-time monitoring of designated zones (armed/disarmed status, sensor conditions, battery health).
* **Interactive Zone Details:** Granular metrics inspection and interactive toggles for arming/disarming zones or simulating security breaches.
* **Live Event Feed:** Asynchronous fetching of live security alerts and logs using a mock public API (`async/await` + `actor`).
* **Settings & Preferences:** Configurable notification toggles, audible siren preferences, and session termination controls.
* **Automated Unit Testing:** Dedicated `XCTest` suite validating zone state mutation, arm/disarm logic, and trigger safety rules.

---

## 🏗️ Architecture & Design Patterns

The project is structured using the **MVVM (Model-View-ViewModel)** architectural pattern, leveraging modern Apple frameworks to ensure high maintainability, thread safety, and offline resilience.

### 1. Data Persistence Layer (SwiftData)
* Utilizes native **SwiftData** (`@Model`, `@Query`, `@Bindable`) for zero-overhead local data persistence.
* Implements automated database seeding on first launch via the container configuration block to ensure immediate out-of-the-box readiness.

### 2. Networking Layer (Swift Concurrency)
* Encapsulated inside a thread-safe singleton **`actor`** (`NetworkManager`).
* Employs structured concurrency (`async/await`) with `URLSession` to fetch external DTOs safely without blocking the main thread.

### 3. UI & Navigation Layer (SwiftUI)
* Built entirely with declarative SwiftUI components.
* Uses `NavigationStack` for deep hierarchy routing and root-level state bindings to handle seamless transitions between authentication and dashboard views.

---

## 📂 Project Directory Structure

```text
SecurityCompanion/
├── App/
│   └── SecurityCompanionApp.swift       # Entry point & SwiftData container setup
├── Models/
│   ├── SecurityZone.swift               # SwiftData persistent zone model
│   └── SecurityEvent.swift              # SwiftData persistent event model
├── Services/
│   └── NetworkManager.swift             # Actor-based async networking service
├── Views/
│   ├── Auth/
│   │   └── LoginView.swift              # Mock login authentication screen
│   ├── Dashboard/
│   │   ├── MainTabView.swift            # Core bottom tab navigation container
│   │   └── ZoneListView.swift           # Zone overview list with live status badges
│   ├── Details/
│   │   └── ZoneDetailView.swift         # Detailed diagnostics & arm/disarm toggle
│   ├── Events/
│   │   └── EventFeedView.swift          # Live event feed with pull-to-refresh
│   └── Settings/
│       └── SettingsView.swift           # App preferences & secure logout
└── SecurityCompanionTests/
    └── SecurityAppTests.swift           # XCTest suite for business logic