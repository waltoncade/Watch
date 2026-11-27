// Small helpers for the static site. No network calls.
// The notify form only opens a mailto: link. Edit the address in index.html
// (data-mailto on #notify-form, and the visible mailto link).

const toggle = document.querySelector(".nav-toggle");
const nav = document.querySelector("#site-nav");

function setNav(open) {
  if (!toggle || !nav) return;
  toggle.setAttribute("aria-expanded", String(open));
  nav.dataset.open = String(open);
}

toggle?.addEventListener("click", () => {
  const open = toggle.getAttribute("aria-expanded") === "true";
  setNav(!open);
});

nav?.querySelectorAll("a").forEach((link) => {
  link.addEventListener("click", () => setNav(false));
});

document.addEventListener("keydown", (event) => {
  if (event.key === "Escape") setNav(false);
});

document.addEventListener("click", (event) => {
  if (!toggle || !nav) return;
  const target = event.target;
  if (!(target instanceof Node)) return;
  if (toggle.contains(target) || nav.contains(target)) return;
  setNav(false);
});

const desktop = window.matchMedia("(min-width: 800px)");
desktop.addEventListener("change", (event) => {
  if (event.matches) setNav(false);
});

const form = document.querySelector("#notify-form");
const status = document.querySelector("#notify-status");

form?.addEventListener("submit", (event) => {
  event.preventDefault();

  const address = (form.dataset.mailto || "").trim();
  const subject = (form.dataset.subject || "Watch — preorder interest").trim();
  const data = new FormData(form);
  const email = String(data.get("email") || "").trim();
  const note = String(data.get("note") || "").trim();

  if (!address) {
    if (status) {
      status.textContent =
        "Set data-mailto on the form to a real address. Nothing was sent.";
    }
    return;
  }

  const body = [
    "Preorder interest / notify me",
    "",
    `Email: ${email}`,
    note ? `Note: ${note}` : "Note: (none)",
    "",
    "Sent from the Watch website placeholder form. Nothing was stored on a server.",
  ].join("\n");

  if (status) {
    status.textContent =
      "Opening your email app. If nothing opens, use the address below. Nothing was stored.";
  }

  window.location.href = `mailto:${address}?subject=${encodeURIComponent(subject)}&body=${encodeURIComponent(body)}`;
});
