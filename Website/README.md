# Walton Watches website

Static website for **Walton Watches**. Two pages, built with [Vite](https://vite.dev/) into a `dist/` folder. Plain HTML, CSS and a little JavaScript. No server, no database, no payments, no analytics.

## Pages

| Page | File | What it is |
| --- | --- | --- |
| Home | `index.html` | The product page: hero, gallery, story sections, characteristics, contact |
| About | `about.html` | Simple page with placeholder sections to fill in |

The nav has only these two tabs. Both pages end with a **Contact** button, and the footer on both pages has one too.

## Placeholders to replace

Search the repo for `placeholder` (case-insensitive) to find them all.

- **Contact email: `placeholder@example.com`.** Every Contact / Register interest button is a `mailto:` link to this address. Replace every occurrence in `index.html` and `about.html` with a real address.
- **Model name: "Walton one".** Change it in `index.html` (title, hero, characteristics heading, image alt text, the mailto subject) and in `about.html` (image alt text).
- **Price: "Price TBA"** and **Availability: "Coming soon"** in the hero of `index.html`.
- **Characteristics marked "To be announced" / "Details to come"** (case, diameter, strap, water resistance, battery life, wireless) in `index.html`.
- **Hero ring light.** As the page scrolls, a red light travels once round the ring of 24 LEDs on the hero image (`src/main.js`). The LED positions are in `src/ring-leds.json`, in `hero.webp` pixels clockwise from 12, taken from the board layout; update them if the hero image changes. Visitors who ask for reduced motion see a single lit LED at 12. A white mechanical second hand sits on the centre hole of the hero image and sweeps smoothly with the visitor's clock, independent of scroll (it stays still for reduced motion, and a still copy sits on the "What's inside" image). The red ring light is still driven only by scroll.
- **"What's inside" callouts.** The seven feature descriptions (LEDs, Multi-color LED, Second hand, The brain, Motion sensor, Light sensor, Bluetooth) are placeholder copy. Edit the titles and text in `src/callouts.js`, the only place they live. The `x`/`y` values there are each part's position on `public/images/hero.webp` (in percent), measured from the board layout; update them if the hero image changes.
- **Story copy.** The three story sections on Home are short, honest placeholder copy. Rewrite as you like.
- **About page.** The intro line and the "Our story", "The maker" and "Craft" sections are italic placeholder text, marked with `<!-- Placeholder -->` comments.
- **Images.** `public/images/` holds preview 3D renderings (`hero`, `hero_angle`, `detail`, `back`, each with an `-800` small version). Replace them with photos when you have them, keeping the same file names, or update the `src`/`srcset` paths. The reverse view (`back`) shows the board's printed labels; swap it for a case-back photo when there is one. The "Images are preview renderings. Photography coming soon." note has been removed from the page, so nothing on the site currently says these are renderings; add a note back if you want one before real photos arrive.
- **Logo.** `public/logo/w-logo-white.svg` (header, footer) and `public/logo/w-logo.svg` (uses `currentColor`). Favicon: `public/favicon.svg` and `public/apple-touch-icon.png`.

Colors and fonts are at the top of `src/styles.css` (`:root`).

`src/main.js` only handles the header background on scroll, the gallery thumbnails, the drawing/finished slider, the hero second hand and ring light, the "What's inside" callouts (a small card that opens next to the clicked label or dot), and the footer year. It sends nothing anywhere.

## Run locally

Node 20 or newer.

```bash
npm install
npm run dev
```

Dev server: <http://127.0.0.1:43123>. Production build and local preview of `dist/`:

```bash
npm run build
npm run preview
```

Preview runs on port **43124**.

## Deploy to GitHub Pages

A workflow is included at `.github/workflows/pages.yml`. **GitHub only runs workflows from the `.github/workflows/` folder at the root of the repository.** If this `website/` folder lives inside a bigger repo (for example the `Watch` repo), move the workflow to `<repo root>/.github/workflows/pages.yml` and point it at this folder: add `defaults: run: working-directory: website` to the build job, set `cache-dependency-path: website/package-lock.json` on `setup-node`, and change the upload `path` to `website/dist`.

Then, on GitHub:

1. Open **Settings → Pages**.
2. Set **Build and deployment → Source** to **GitHub Actions**.
3. Push to `main`, or run the "Deploy GitHub Pages" workflow by hand.

`vite.config.js` sets `base: './'` and all links are relative, so the site works at a domain root and in a project subpath (`https://USERNAME.github.io/REPO/`).

## Deploy to Vercel

Import the repo, framework preset **Vite**, build command `npm run build`, output directory `dist` (set the root directory to `website` if it is in a subfolder). No environment variables.

Point `placeholder@example.com` at a real mailbox before going public, or the Contact buttons will draft emails to an address that does not exist.
