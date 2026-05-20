---
name: docker-build
description: Build the Docker image locally from the project Dockerfile and validate it runs. Use when you want to test the container build before pushing to Docker Hub.
disable-model-invocation: true
---

Build and validate the Docker image locally.

1. Run from the repo root (not front-end/):
   ```bash
   docker build -t satc-devops:local .
   ```

2. If the build succeeds, start the container and verify the app responds:
   ```bash
   docker run --rm -d -p 4173:4173 --name satc-test satc-devops:local
   ```
   Then check `http://localhost:4173` loads the React app (the Vite preview server is the entrypoint).

3. Stop the test container:
   ```bash
   docker stop satc-test
   ```

4. Report: build output, any errors, and whether the app responded on port 4173.

**Security reminders** (already baked into the Dockerfile, verify they're present):
- `npm ci --ignore-scripts` (not npm install)
- `npm install -g npm@10.8.1 --ignore-scripts` (pinned, not @latest)
- `apk update && apk upgrade --no-cache` for Alpine security patches

If $ARGUMENTS contains a tag name (e.g. `/docker-build my-tag`), use that instead of `local`.
