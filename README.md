# 🏥 Hospital Management Admin Panel

> **A modern admin dashboard built with Flutter Web & Firebase to manage hospital operations efficiently.**

![Flutter](https://img.shields.io/badge/Flutter-Web-blue?logo=flutter)
![Firebase](https://img.shields.io/badge/Firebase-Backend-yellow?logo=firebase)
![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)

---

## ✨ Overview

The **Hospital Management Admin Panel** is a secure, web-based dashboard built using **Flutter Web** and **Firebase**. Designed for administrative staff, it enables verification of doctors, management of appointments, access to uploaded medical files, and overall monitoring of hospital activity — all from a sleek, centralized interface.

---

## 📋 Table of Contents

- [🚀 Features](#-features)
- [🔐 Admin Authentication](#-admin-authentication)
- [🛠️ Tech Stack](#-tech-stack)
- [⚙️ Installation](#️-installation)
- [📦 Configuration](#-configuration)
- [💻 Usage](#-usage)
- [📷 Screenshots](#-screenshots)
- [🧩 Troubleshooting](#-troubleshooting)
- [🙋 Contributors](#-contributors)
- [📝 License](#-license)

---

## 🚀 Features

✅ Admin login via Firebase Auth  
✅ Role-based access (only super-admin allowed)  
✅ Doctor profile verification and management  
✅ Appointment scheduling and overview  
✅ Upload/view medical reports (PDFs, images) via Firebase Storage / Cloudinary  
✅ Clean dashboard UI with optional analytics and charts

---

## 🔐 Admin Authentication

> Security is top priority.

- Only a **single authorized admin** (e.g., `admin@hospital.com`) can access the panel.
- All authentication is handled via **Firebase Authentication**.
- Unauthorized users will be **denied access** immediately.

---

## 🛠️ Tech Stack

| Layer        | Technology        |
|--------------|-------------------|
| Frontend     | Flutter Web        |
| Backend/Auth | Firebase Auth      |
| Database     | Cloud Firestore    |
| File Storage | Firebase Storage / Cloudinary |

---

## ⚙️ Installation

### 1. Clone the Repository

```bash
git clone https://github.com/your-username/hospital-admin-panel.git
cd hospital-admin-panel
