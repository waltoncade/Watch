// Small helpers for the static site. No network calls.

// Header gets a solid background once the page scrolls.
const header = document.querySelector("[data-header]");
const onScroll = () => header?.classList.toggle("is-scrolled", window.scrollY > 8);
onScroll();
window.addEventListener("scroll", onScroll, { passive: true });

// Gallery: clicking a thumbnail swaps the large image.
const main = document.querySelector("[data-gallery-main]");
const thumbs = document.querySelectorAll(".thumb");
thumbs.forEach((thumb) => {
  thumb.addEventListener("click", () => {
    if (!main) return;
    main.classList.add("is-swapping");
    const swap = () => {
      main.src = thumb.dataset.src;
      main.srcset = thumb.dataset.srcset || "";
      main.width = Number(thumb.dataset.w);
      main.height = Number(thumb.dataset.h);
      main.alt = thumb.dataset.alt || "";
      main.classList.remove("is-swapping");
    };
    window.setTimeout(swap, 180);
    thumbs.forEach((t) => {
      const on = t === thumb;
      t.classList.toggle("is-active", on);
      t.setAttribute("aria-pressed", String(on));
    });
  });
});

// Keep the footer year current.
document.querySelectorAll("[data-year]").forEach((el) => {
  el.textContent = String(new Date().getFullYear());
});

// "Inside and out" compare slider. The range input drives a CSS variable;
// the drawing (left) is clipped to the left of the seam.
document.querySelectorAll("[data-compare]").forEach((frame) => {
  const range = frame.querySelector(".compare-range");
  if (!range) return;
  const set = () => frame.style.setProperty("--pos", `${range.value}%`);
  range.addEventListener("input", set);
  set();
});
