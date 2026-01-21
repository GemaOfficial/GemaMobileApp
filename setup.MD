# GEMA Project Setup & Execution Plan

This document outlines the steps to set up and run the GEMA ecosystem, which consists of the **GemaMobileApp** (Flutter) and **gema-core** (Node.js/TypeScript backend).

## 🚀 Current Project Status
- ✅ Cloned `GemaMobileApp` repository.
- ✅ Cloned `gema-core` repository.
- ✅ Installed backend dependencies using `yarn`.
- ✅ Configured basic `.env` for the backend.
- ✅ Applied bug fixes for TypeScript compilation errors in the backend.
- ✅ Flutter environment setup for the mobile app (Web & Android compatible).
- ✅ Replaced deprecated dependencies (persistent_bottom_nav_bar_v2, qr_flutter).
- ✅ Fixed dart:io compatibility issues for Web build.
- ✅ Backend passes all TypeScript checks and is ready for execution.

---

## 🛠️ Prerequisites
- **Node.js** (v18+ recommended)
- **Yarn** (`npm install -g yarn`)
- **MongoDB** (Local instance or Atlas URI)
- **Flutter SDK** (Must be added to System PATH)

---

## 📂 Backend Setup (`gema-core`)

1. **Navigate to the core directory:**
   ```powershell
   cd gema-core
   ```

2. **Install Dependencies:**
   ```powershell
   yarn install
   ```

3. **Environment Configuration:**
   Create a `.env` file in `gema-core/backend/` with the following keys:
   - `MONGO_URI`: Your MongoDB connection string.
   - `JWT_SECRET`: Secret for token signing.
   - `ADVANTA_API_KEY`, `ADVANTA_PARTNER_ID`, `ADVANTA_SHORTCODE`: For SMS services.
   - `PK`, `ACC_ID`: NEAR protocol account details.

4. **Run the Backend:**
   ```powershell
   yarn workspace backend start
   ```

---

## 📱 Mobile App Setup (`GemaMobileApp`)

1. **Navigate to the mobile directory:**
   ```powershell
   cd GemaMobileApp
   ```

2. **Install Flutter Dependencies:**
   ```powershell
   flutter pub get
   ```

3. **Run the App:**
   ```powershell
   flutter run
   ```

---

## 🗺️ Roadmap & Plan

### Phase 1: Infrastructure & Stability
- [ ] **Database Connection**: Ensure a local MongoDB instance is running or update `.env` with a remote URI.
- [ ] **Flutter Environment**: Troubleshoot Flutter installation/PATH issues to enable mobile development.
- [ ] **Backend Health Check**: Verify `http://localhost:5000/api/v1/status` returns a success response.

### Phase 2: Feature Development
- [ ] **M-Pesa Integration**: Implement STK Push and Payment reconciliation in the backend.
- [ ] **User Authentication**: Wire up the mobile app login/register screens to the core backend APIs.
- [ ] **Wallet Monitoring**: Implement NEAR protocol wallet balance and transaction history viewing.

### Phase 3: Polishing & Deployment
- [ ] **UI/UX Refinement**: Apply premium design standards to the Flutter app.
- [ ] **Billing System**: Finalize the prepaid wallet and monetization logic.
- [ ] **Production Readiness**: Configure Docker containers and CI/CD pipelines.

---

---

## ⚠️ Known Issues & Troubleshooting

- **MongoDB Dependency:** The backend will exit if it cannot connect to MongoDB. Ensure your local `mongod` service is running or update `.env` with a remote URI.
- **Node.js Clustering on Windows:** The current `server.ts` uses Node.js clusters. If you experience issues starting the server in development, you can temporarily disable clustering by modifying `server.ts` to skip the `if (cluster.isPrimary)` block.
- **TypeScript Strictness:** Several type casts (`as any`) have been applied to `auth.ts` and `Auth.ts` to allow compilation with the current Express type definitions.

