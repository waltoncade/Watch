import { defineConfig } from "vite";
import { resolve } from "node:path";
import { fileURLToPath } from "node:url";

const root = fileURLToPath(new URL(".", import.meta.url));

// Relative base so the built site works at a domain root (Vercel, a user
// GitHub Pages site) and in a project subpath (username.github.io/repo/).
export default defineConfig({
  appType: "mpa",
  base: "./",
  server: {
    host: "0.0.0.0",
    port: 43123,
    strictPort: true,
  },
  preview: {
    host: "0.0.0.0",
    port: 43124,
    strictPort: true,
  },
  build: {
    rollupOptions: {
      input: {
        main: resolve(root, "index.html"),
        buildLog: resolve(root, "build-log.html"),
        hardware: resolve(root, "hardware.html"),
        about: resolve(root, "about.html"),
      },
    },
  },
});
