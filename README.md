# Gema: Hybrid FinTech & Web3 Ecosystem

Gema is a modern financial platform designed to bridge the gap between traditional mobile money (M-Pesa) and digital assets (Web3/Blockchain). This repository contains the mobile application (Flutter) and the core backend services.

---

## 🚀 Business Vision
Gema empowers users in emerging markets (primarily East Africa) to interact with the global digital economy. By integrating localized payment rails with low-cost blockchain infrastructure, Gema provides a secure, fast, and user-friendly way to manage wealth and conduct transactions.

### Key Value Pillars
- **Local-to-Global Rails:** Buy and sell crypto directly using M-Pesa.
- **Scan-to-Pay:** Merchant payments via QR codes using the GEM utility token.
- **Utility-First Web3:** Built on the **NEAR Protocol** for near-zero fees and instant finality.

---

## 📱 Mobile App Features (Flutter)
- **Unified Multi-Currency Wallet:** Seamlessly hold GEM, BTC, and ETH.
- **Instant Token Swaps:** Exchange major cryptos for GEM tokens directly in-app.
- **Secure Transaction Hub:** Track P2P transfers and merchant payments in real-time.
- **Interactive QR Scanner:** Send and receive tokens with a single scan.

---

## ⚙️ Backend Architecture (Node.js/TS)
- **Enterprise-Grade Auth:** JWT-based secure login for individuals and brands.
- **Financial Gateway:** Native integration with **Advanta** (SMS/APIs) and planned **M-Pesa** STK push support.
- **Scalable Data:** MongoDB-driven storage with Mongoose ODM for reliable state management.
- **Clustered Performance:** Multi-core Node.js execution for high-concurrency handling.

---

## 🛠 Project Status & Technical Debt Resolved
- **Flutter 3.x Migration:** Full upgrade from Dart 2.x, ensuring compatibility with modern plugins.
- **Web Renderer Support:** Fixed `dart:io` platform-specific blockers to enable Flutter Web execution.
- **Dependency Refresh:** Upgraded critical libraries like `qr_flutter` (4.x), `get` (4.x), and `persistent_bottom_nav_bar_v2`.
- **Backend Type Safety:** Resolved strict TypeScript compilation errors across middlewares and controllers.

---

## 🚦 Quick Start

### Prerequisites
- Flutter SDK (3.0.0+)
- Node.js (16+) & Yarn
- MongoDB (running locally or via Atlas)

### Backend Setup
1. Navigate to `/gema-core/backend`
2. Create a `.env` file (refer to `setup.MD` for required variables).
3. Run `yarn install` followed by `yarn workspace backend start`.

### Mobile Setup
1. Run `flutter pub get` in the root directory.
2. Run `flutter run -d chrome` for web or target a connected mobile device.

---

## 🗺 Roadmap
- [x] Phase 2: Core Platform Stabilization (Mobile & Web Build Fixed).
- [ ] Phase 3: M-Pesa STK Push Integration.
- [ ] Phase 4: Brand Portal for Merchants.
- [ ] Phase 5: Production Deployment (Dockerization).

---

© 2026 Gema Official. All rights reserved.
