---
name: verify
description: Start the Vite dev server and verify the React SPA loads correctly on all three routes. Use after making frontend changes to confirm nothing is broken.
---

Verify the React frontend works end-to-end.

1. Install dependencies if needed (from `front-end/`):
   ```bash
   cd front-end && npm ci
   ```

2. Run the linter first to catch obvious errors:
   ```bash
   cd front-end && npm run lint
   ```

3. Start the Vite dev server in the background:
   ```bash
   cd front-end && npm run dev &
   ```
   Wait a moment for it to start (usually port 5173).

4. Verify all three routes respond:
   - `/` — Home page
   - `/sobre` — Sobre (About) page
   - `/contato` — Contato (Contact) page

5. Stop the dev server when done.

6. Report: lint output, which routes passed/failed, any console errors observed.

If $ARGUMENTS specifies `build`, instead run `npm run build` and then `npm run preview` to verify the production bundle (served on port 4173).
