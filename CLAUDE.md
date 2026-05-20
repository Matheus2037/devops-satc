# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

DevOps educational project: React 19 + Vite SPA deployed to Google Kubernetes Engine via GitHub Actions. The pipeline (SonarCloud → Docker build → Trivy scan → GKE deploy) is the primary artifact.

## Directory Layout

All frontend code and npm scripts live under `front-end/`. There is no root `package.json` with scripts — always `cd front-end/` before running npm commands.

```
front-end/    # React app (npm scripts here)
k8s/          # Kubernetes manifests with CI-injected placeholders
.github/      # CI workflows
Dockerfile    # Multi-stage build (Node 20 Alpine)
```

## Commands

Run from `front-end/`:
```bash
npm run dev      # Vite dev server with HMR
npm run build    # Production build → dist/
npm run lint     # ESLint 9 flat config check
npm run preview  # Preview the production build (port 4173)
```

## Branch Workflow

- `feature/*` branches → PR into `develop`
- `develop` → `stage` → `main` (production)
- Commit messages: free-form, written in Portuguese

## Docker

The Dockerfile uses `--ignore-scripts` on all npm commands (security: prevents arbitrary script execution from dependencies). Use `npm ci` (not `npm install`) for deterministic installs. npm is pinned to `10.8.1`.

## Kubernetes

`k8s/deployment.yaml` contains placeholder strings that CI injects at deploy time via `sed`:
- `##DOCKER_USERNAME##` — Docker Hub username
- `##K8S_TAG##` — commit SHA (image tag)
- `##K8S_NAMESPACE##` — target namespace

Never commit real values in their place. The app container exposes port `4173` (Vite preview server).

## CI/CD

Three GitHub Actions workflows:
- **build.yaml** — main pipeline: SonarCloud scan → Docker build + push → Trivy vulnerability scan. Trivy blocks if HIGH or MEDIUM vulnerabilities exceed 50.
- **deploy.yaml** — GKE deploy via OIDC (no long-lived credentials). Triggered after `build.yaml` succeeds.
- **docker_check.yaml** — legacy alternate pipeline (develop branch); uses hardcoded image tag `0.0.1`.

Required GitHub secrets: `DOCKER_USERNAME`, `DOCKER_PASSWORD`, `SONAR_TOKEN`. Required vars: `GCP_PROJECT_NUMBER`, `GCP_PROJECT_ID`, `GKE_CLUSTER_NAME`, `GKE_CLUSTER_LOCATION`, `K8S_NAMESPACE`.

## Code Style

ESLint 9 flat config (`front-end/eslint.config.js`). Rules of note:
- `no-unused-vars`: error, but ignores names matching `/^[A-Z_]/` (constants)
- Browser globals enabled; `dist/` excluded from linting

No TypeScript — files use `.jsx` extension throughout.
