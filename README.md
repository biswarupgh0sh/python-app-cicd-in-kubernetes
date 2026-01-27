# Kubernetes CI/CD Pipeline using GitHub Actions & ArgoCD

This repository is a **CI/CD-focused DevOps showcase** demonstrating how to design, secure, and automate a production-grade delivery pipeline using **GitHub Actions**, **Docker**, **Kubernetes**, and **GitOps with ArgoCD**.

The application itself is intentionally simple; the **primary value of this repository is the CI/CD architecture and automation depth**.

---

## 🚀 What This Repository Demonstrates

This project reflects **real-world DevOps responsibilities**, including:

* End-to-end CI pipeline design using GitHub Actions
* Security-first automation (SAST + container vulnerability scanning)
* Docker image lifecycle management
* Artifact-based job isolation
* GitOps-compatible Kubernetes deployments
* Reusable workflows and structured notifications
* Production-style observability of pipeline health

---

## 🧩 CI/CD Architecture Overview

**Trigger:**

* Automatic execution on every push to the `main` branch

**High-level Flow:**

1. Static Application Security Testing (SAST)
2. Docker image build with immutable versioning
3. Container image vulnerability scanning
4. Slack-based pipeline visibility
5. Image promotion to Docker Hub
6. Kubernetes manifest mutation via GitOps
7. ArgoCD-ready deployment state

---

## 🔐 Stage 1: Static Code Analysis (SAST – SonarCloud)

**Skills Demonstrated:**

* Secure pipeline design
* Quality gates and metric extraction
* API-driven automation

**Implementation Details:**

* SonarCloud scan executed inside GitHub Actions
* Metrics fetched via SonarCloud API:

  * Bugs
  * Vulnerabilities
  * Code Smells
* Metrics parsed using `jq` and exposed as **job outputs**
* Reports stored as pipeline artifacts

This mirrors enterprise SAST integration commonly required in regulated environments.

---

## 🐳 Stage 2: Docker Image Build & Versioning

**Skills Demonstrated:**

* Containerization
* Artifact-driven pipelines
* Deterministic image tagging

**Implementation Details:**

* Docker image built using commit-based **short SHA tags**
* Image stored as a `.tar` artifact (not pushed immediately)
* Enables downstream security scans without registry dependency

This pattern improves pipeline isolation and auditability.

---

## 🛡️ Stage 3: Container Vulnerability Scanning (Trivy)

**Skills Demonstrated:**

* Shift-left security
* Supply-chain risk awareness
* JSON parsing & metrics extraction

**Implementation Details:**

* Image scanned using Trivy for `MEDIUM`, `HIGH`, and `CRITICAL` severities
* Vulnerability counts parsed programmatically
* Results exposed as job outputs and archived as artifacts

This reflects modern DevSecOps practices used in production pipelines.

---

## 📣 Stage 4: Slack Notifications (Reusable Workflows)

**Skills Demonstrated:**

* Reusable GitHub Actions workflows
* Event-driven notifications
* Cross-job data propagation

**Implementation Details:**

* Slack notifications sent using a reusable workflow
* Payload dynamically enriched with:

  * Repository & branch details
  * Commit metadata
  * Trivy vulnerability counts
* Separate success and failure notification paths

Provides real-time pipeline observability for teams.

---

## 📦 Stage 5: Image Promotion to Docker Hub

**Skills Demonstrated:**

* Secure credential handling
* Controlled image promotion

**Implementation Details:**

* Docker image loaded from artifact
* Authentication via GitHub Secrets
* Image pushed only after successful scans & notifications

This enforces security gates before release.

---

## ☸️ Stage 6: GitOps-Based Kubernetes Deployment

**Skills Demonstrated:**

* GitOps principles
* YAML automation
* Kubernetes deployment management

**Implementation Details:**

* Kubernetes `deployment.yml` updated automatically using `yq`
* Image tag updated with immutable commit SHA
* Changes committed back to `main` via GitHub Actions bot

This creates a **Git-driven source of truth** for ArgoCD.

---

## 🔄 ArgoCD Compatibility

* No imperative cluster access from CI
* CI updates Git state only
* ArgoCD detects and syncs desired state

This separation aligns with best-practice Kubernetes delivery models.

---

## 🔑 Security & Best Practices Applied

* No hardcoded secrets
* GitHub Secrets & Variables used throughout
* Immutable image tags
* Artifact-based job boundaries
* Failure-aware notifications

---

## 🧠 Core DevOps & CI/CD Skills Highlighted

* GitHub Actions (advanced workflows)
* DevSecOps automation
* Docker & container security
* Kubernetes & GitOps (ArgoCD-ready)
* YAML & JSON automation (`yq`, `jq`)
* Reusable workflows
* Production-grade pipeline design

---

## 🎯 Why This Repository Matters

This project demonstrates how I approach CI/CD engineering:

* **Security-first** mindset
* **Automation over manual processes**
* **Production-aligned design**
* **Clear separation of concerns**

It reflects the level of rigor expected in modern backend, platform, and DevOps engineering roles.

---

📌 *This repository is intentionally designed as a CI/CD portfolio project and is shared as part of my professional work on LinkedIn.*
