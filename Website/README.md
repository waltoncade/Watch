# Watch

Static site for **Watch**, Cade’s custom open-hardware PCB smartwatch. Informal hobby project. The name is a working title.

The site is a product page plus a build log. It is plain HTML, CSS, and a little JavaScript, built with [Vite](https://vite.dev/) into a `dist/` folder. No server, no database, no payment backend. It can be hosted on GitHub Pages or Vercel.

## Pages

| Page | File | What it is |
| --- | --- | --- |
| Home / product | `index.html` | Hero, features, short specs, notify form |
| Build log | `build-log.html` | Dated bench notes |
| Hardware / specs | `hardware.html` | The known parts and a specs table |
| About | `about.html` | What the project is, and a blank bio |

## Edit the content

Content lives in the HTML files. Search the repo for `Placeholder` and update those spots.

- **Watch name.** Working title, used in titles, the wordmark, and the mailto subject. Search for `Watch` and rename when there is a real one. Leave part numbers alone.
- **Notify address.** There is no mailing-list server. The form opens the visitor’s email app. Replace every `placeholder@example.com` (the form’s `data-mailto` on `#notify-form` in `index.html`, the visible mailto links, and the About page). The subject is `data-subject` on the same form.
- **Price.** Not set. The home and hardware pages say so on purpose. Do not invent one.
- **Photos.** Dashed boxes are empty slots. Put a file in `public/photos/`, then replace a `.photo-slot-frame` div with an image:

  ```html
  <img src="/photos/front.jpg" alt="Front of the first assembled board" />
  ```

  Vite rewrites that path for the `base` setting at build time.

- **Build log.** Copy an `<article class="entry">` in `build-log.html`. Replace `Date — edit this`. Remove the Placeholder tag when the note is real. One entry is titled “First boards ordered from JLCPCB” — keep that title unless the note itself changes.
- **Hardware facts.** `hardware.html` is the source of truth. Do not add a display, an MCU part number, a radio protocol, battery life, or a case unless you actually know them. Unknowns belong in the “Not specified yet” list.
- **Bio.** The About page biography is empty on purpose.
- **Accent color and type.** `:root` at the top of `src/styles.css`.

`src/main.js` only opens and closes the mobile menu and builds the `mailto:` link. It does not send data anywhere.

## Run locally

Node 20 or newer.

```bash
npm install
npm run dev
```

The dev server is [http://127.0.0.1:43123](http://127.0.0.1:43123). The port is set in `vite.config.js`.

Production build, then a local preview of `dist/`:

```bash
npm run build
npm run preview
```

Preview uses port **43124** so it can run beside the dev server.

## Deploy to GitHub Pages

A workflow is included at `.github/workflows/pages.yml`. It installs, runs `npm run build`, and deploys the `dist/` folder with GitHub Actions.

1. Push the repository to GitHub.
2. In the repo, open **Settings → Pages**.
3. Set **Build and deployment → Source** to **GitHub Actions**.
4. Push to `main`, or run the “Deploy GitHub Pages” workflow by hand.

`vite.config.js` sets `base: './'`, so asset paths are relative. That works for a user site (`https://USERNAME.github.io/`) and a project site (`https://USERNAME.github.io/REPO/`).

Until Pages is enabled, the deploy job has nothing to publish to. The build job can still be used to confirm `npm run build` passes.

## Deploy to Vercel

This is a static Vite build. No environment variables.

1. Import the Git repository in Vercel.
2. Framework preset: **Vite**.
3. Build command: `npm run build`.
4. Output directory: `dist`.
5. Deploy.

The notify form is still a mailto link after deploy. Point `placeholder@example.com` at a real mailbox first, or the button will draft a message to an address that does not exist.

## What this site does not do

- No accounts, no database, no analytics snippet.
- No payment. “Get notified” is preorder *interest*, not an order.
- No invented specs. Photos, price, the final name, the MCU, the display, the case, and the radio protocol are marked as placeholders.
