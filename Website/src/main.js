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

// "Register interest above" link: back to the top, focus the header button.
document.querySelectorAll("[data-register-up]").forEach((link) => {
  link.addEventListener("click", (e) => {
    const target = document.querySelector(".btn-header");
    if (!target) return;
    e.preventDefault();
    window.scrollTo({ top: 0, behavior: "smooth" });
    target.focus({ preventScroll: true });
  });
});

// Hero: a red light travels round the ring of 24 LEDs as the page scrolls.
// LED positions (in hero.webp pixels, clockwise from 12) come from the board layout.
import ringLeds from "./ring-leds.json";

const ring = document.querySelector("[data-hero-ring]");
if (ring) {
  const NS = "http://www.w3.org/2000/svg";
  ring.innerHTML = `<defs>
    <radialGradient id="ledHalo"><stop offset="0" stop-color="#ff4a36" stop-opacity="1"/><stop offset="0.3" stop-color="#ff2a1a" stop-opacity="0.6"/><stop offset="0.65" stop-color="#ff1a0a" stop-opacity="0.18"/><stop offset="1" stop-color="#ff1a0a" stop-opacity="0"/></radialGradient>
    <radialGradient id="ledCore"><stop offset="0" stop-color="#fff4f0"/><stop offset="0.5" stop-color="#ff5a44"/><stop offset="1" stop-color="#ff2a1a" stop-opacity="0"/></radialGradient>
  </defs>`;
  const leds = ringLeds.map(([x, y]) => {
    const g = document.createElementNS(NS, "g");
    g.setAttribute("class", "ring-led");
    g.innerHTML = `<circle cx="${x}" cy="${y}" r="120" fill="url(#ledHalo)"/><circle cx="${x}" cy="${y}" r="30" fill="url(#ledCore)"/>`;
    ring.appendChild(g);
    return g;
  });
  const N = leds.length;
  const media = ring.closest(".hero-media");
  // Brightness of LED i when the light's head is at position h (0..N, clockwise).
  const level = (h, i) => {
    let a = (((h - i) % N) + N) % N; // how far LED i is behind the head
    if (a > N - 1) return a - (N - 1); // next LED, fading in
    if (a > h + 0.001) return 0; // no trail before the light has started moving
    return Math.exp(-a / 2.2); // head and fading trail
  };
  const paint = (h) => leds.forEach((g, i) => { g.style.opacity = level(h, i).toFixed(3); });
  const reduce = window.matchMedia("(prefers-reduced-motion: reduce)");
  let queued = false;
  const update = () => {
    queued = false;
    if (reduce.matches) { paint(0); return; }
    // One full turn while the hero watch scrolls up out of view.
    const span = Math.max(1, (media.offsetTop + media.offsetHeight) * 0.85);
    const p = Math.min(Math.max(window.scrollY / span, 0), 1);
    paint(p * N);
  };
  const onScroll = () => { if (!queued) { queued = true; requestAnimationFrame(update); } };
  window.addEventListener("scroll", onScroll, { passive: true });
  window.addEventListener("resize", onScroll);
  reduce.addEventListener?.("change", onScroll);
  update();
}

// White mechanical second hand, pivoting on the centre hole of hero.webp
// (799.5, 800.5 in the 1600 image, from the board layout).
const HAND_CX = 799.5, HAND_CY = 800.5;
const HAND_REST = 245; // ~8:10, used when still (inside, or reduced motion)

function handMarkup(id) {
  return `<defs>
    <linearGradient id="${id}-sheen" x1="0" y1="0" x2="1" y2="0">
      <stop offset="0" stop-color="#c5c0b6"/>
      <stop offset="0.4" stop-color="#f7f4ee"/>
      <stop offset="0.55" stop-color="#ffffff"/>
      <stop offset="1" stop-color="#b8b3a8"/>
    </linearGradient>
    <radialGradient id="${id}-cap" cx="38%" cy="32%" r="70%">
      <stop offset="0" stop-color="#ffffff"/>
      <stop offset="0.45" stop-color="#ece8e0"/>
      <stop offset="1" stop-color="#9a958b"/>
    </radialGradient>
    <filter id="${id}-shadow" x="-40%" y="-10%" width="180%" height="140%">
      <feDropShadow dx="3" dy="6" stdDeviation="3.5" flood-color="#000" flood-opacity="0.42"/>
    </filter>
  </defs>
  <g class="seconds-hand-arm" filter="url(#${id}-shadow)" transform="rotate(${HAND_REST} ${HAND_CX} ${HAND_CY})">
    <polygon points="796.2,800.5 802.8,800.5 806.5,972 799.5,1020 792.5,972" fill="url(#${id}-sheen)"/>
    <circle cx="799.5" cy="988" r="20" fill="url(#${id}-sheen)"/>
    <polygon points="799.5,248 803.6,800.5 799.5,808 795.4,800.5" fill="url(#${id}-sheen)"/>
    <circle cx="799.5" cy="800.5" r="34" fill="url(#${id}-cap)" stroke="#d8c3a0" stroke-width="1.5"/>
    <circle cx="799.5" cy="800.5" r="18" fill="#d8d4cc"/>
    <circle cx="799.5" cy="800.5" r="7" fill="#8a867e"/>
  </g>`;
}

const reduceMotion = window.matchMedia("(prefers-reduced-motion: reduce)");
document.querySelectorAll("[data-seconds-hand]").forEach((svg, i) => {
  svg.innerHTML = handMarkup(`hand${i}`);
  const arm = svg.querySelector(".seconds-hand-arm");
  const rest = Number(svg.dataset.secondsRest || HAND_REST);
  const setAngle = (deg) => arm.setAttribute("transform", `rotate(${deg} ${HAND_CX} ${HAND_CY})`);
  if (!svg.hasAttribute("data-seconds-live")) { setAngle(rest); return; }
  // Smooth sweep, always running; scroll does not drive the hand.
  let raf = 0;
  const loop = () => {
    if (reduceMotion.matches) {
      cancelAnimationFrame(raf);
      setAngle(rest);
      return;
    }
    const d = new Date();
    setAngle((d.getSeconds() + d.getMilliseconds() / 1000) * 6);
    raf = requestAnimationFrame(loop);
  };
  reduceMotion.addEventListener?.("change", loop);
  loop();
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

// "What's inside" callouts. Copy lives in src/callouts.js.
// Clicking a label or dot opens a small card next to it; one at a time.
import { callouts } from "./callouts.js";

const stage = document.querySelector("[data-inside]");
if (stage) {
  const media = stage.querySelector(".inside-media");
  const svg = stage.querySelector(".inside-lines");
  const pop = stage.querySelector(".inside-pop");
  const popTitle = pop.querySelector("h3");
  const popText = pop.querySelector("p");
  const list = document.querySelector("[data-inside-list]");
  const NS = "http://www.w3.org/2000/svg";
  // Stage is 1600 x 1000 units; the square image spans x 300..1300.
  const IMG_X = 300, IMG_W = 1000;
  const toStage = (x, y) => [IMG_X + (x / 100) * IMG_W, (y / 100) * 1000];
  const items = [];
  let active = null;
  let anchor = null;
  let hideTimer = 0;

  callouts.forEach((c, i) => {
    const n = i + 1;
    const [hx, hy] = toStage(c.x, c.y);
    const ly = (c.labelY / 100) * 1000;
    const right = c.side === "right";
    const elbowX = right ? 1270 : 330;
    const endX = right ? 1330 : 270;
    const pts = `${hx},${hy} ${elbowX},${ly} ${endX},${ly}`;

    const shadow = document.createElementNS(NS, "polyline");
    shadow.setAttribute("points", pts);
    shadow.setAttribute("class", "inside-line-shadow");
    svg.appendChild(shadow);
    const line = document.createElementNS(NS, "polyline");
    line.setAttribute("points", pts);
    line.setAttribute("class", "inside-line");
    svg.appendChild(line);

    const hot = document.createElement("button");
    hot.type = "button";
    hot.className = "inside-hot";
    hot.style.left = `${c.x}%`;
    hot.style.top = `${c.y}%`;
    hot.setAttribute("aria-label", c.title);
    hot.innerHTML = `<span aria-hidden="true">${n}</span>`;
    media.appendChild(hot);

    const label = document.createElement("button");
    label.type = "button";
    label.className = `inside-label inside-label-${right ? "right" : "left"}`;
    label.style.top = `${(ly / 1000) * 100}%`;
    label.textContent = c.title;
    stage.appendChild(label);

    const li = document.createElement("li");
    li.className = "inside-item";
    li.innerHTML = `<button type="button" class="inside-item-btn"><span class="inside-num" aria-hidden="true">${n}</span><span>${c.title}</span></button>`;
    list.appendChild(li);
    const itemBtn = li.querySelector("button");

    [hot, label, itemBtn].forEach((b) => {
      b.setAttribute("aria-expanded", "false");
      b.setAttribute("aria-controls", "inside-pop");
    });
    items.push({ c, side: right ? "right" : "left", line, hot, label, li, itemBtn });
  });

  const visible = (el) => el.offsetParent !== null;
  const headerH = () => document.querySelector("[data-header]")?.offsetHeight || 0;

  // Place the card beside the anchor, inside the stage and the viewport.
  function place() {
    if (active === null || !anchor) return;
    const GAP = 14, M = 8;
    const s = stage.getBoundingClientRect();
    // The card may use the whole section (room above and below the image).
    const sec = (stage.closest(".inside") || stage).getBoundingClientRect();
    const a = anchor.getBoundingClientRect();
    const vw = document.documentElement.clientWidth;
    const vh = window.innerHeight;
    const box = {
      l: Math.max(sec.left + M, M), t: Math.max(sec.top, M + headerH()),
      r: Math.min(sec.right - M, vw - M), b: Math.min(sec.bottom, vh - M),
    };
    pop.style.maxWidth = `${Math.max(180, Math.min(300, box.r - box.l))}px`;
    const w = pop.offsetWidth, h = pop.offsetHeight;
    const cx = a.left + a.width / 2, cy = a.top + a.height / 2;
    const side = items[active].side;
    const isLabel = anchor.classList.contains("inside-label");
    // Under a side label, line the card up with the label's outer edge.
    const vx = isLabel ? (side === "right" ? a.right - w : a.left) : cx - w / 2;
    // Candidate spots: beside, below or above the anchor, with a few slides
    // along each side so the card can dodge other dots and labels.
    const clamp = ([x, y]) => [
      Math.min(Math.max(x, box.l), Math.max(box.l, box.r - w)),
      Math.min(Math.max(y, box.t), Math.max(box.t, box.b - h)),
    ];
    const fits = ([x, y]) => x >= box.l && y >= box.t && x + w <= box.r && y + h <= box.b;
    const ys = [cy - h / 2, a.top - 8, a.bottom + 8 - h];
    const xs = isLabel ? [vx] : [cx - w / 2, a.left - 8, a.right + 8 - w];
    const cands = {
      right: ys.map((y) => [a.right + GAP, y]),
      left: ys.map((y) => [a.left - GAP - w, y]),
      below: xs.map((x) => [x, a.bottom + GAP / 2]),
      above: xs.map((x) => [x, a.top - GAP / 2 - h]),
      // Just outside the image, used when every closer spot would cover a dot.
      outAbove: [[cx - w / 2, s.top - GAP / 2 - h]],
      outBelow: [[cx - w / 2, s.bottom + GAP / 2]],
    };
    const order = (isLabel
      ? ["below", "above", side === "right" ? "left" : "right"]
      : side === "right" ? ["left", "right", "below", "above"] : ["right", "left", "below", "above"]
    ).concat(cy < s.top + s.height / 2 ? ["outAbove", "outBelow"] : ["outBelow", "outAbove"]);
    // Other parts' dots (and visible labels) the card should not cover.
    const own = items[active];
    const others = items.flatMap((it) => (it === own ? [] : [it.hot, it.label]))
      .filter(visible).map((el) => el.getBoundingClientRect());
    const covers = ([x, y]) => others.filter((r) =>
      r.right + 4 > x && r.left - 4 < x + w && r.bottom + 4 > y && r.top - 4 < y + h).length;
    let best = null;
    order.forEach((k, oi) => cands[k].forEach((p, vi) => {
      const ok = fits(p);
      const q = ok ? p : clamp(p);
      // Covering the anchor itself after clamping is the worst outcome.
      const hitsAnchor = !ok && q[0] < a.right && q[0] + w > a.left && q[1] < a.bottom && q[1] + h > a.top;
      const score = (hitsAnchor ? 1000 : 0) + (ok ? 0 : 100) + covers(q) * 10 + oi + vi * 0.1 + (k.startsWith("out") ? 3 : 0);
      if (!best || score < best.score) best = { score, k, q };
    }));
    const pick = best.k;
    const [x, y] = best.q;
    pop.dataset.place = pick;
    pop.style.left = `${x - s.left}px`;
    pop.style.top = `${y - s.top}px`;
    // Grow out of the anchor.
    pop.style.transformOrigin = `${Math.min(Math.max(cx - x, 0), w)}px ${Math.min(Math.max(cy - y, 0), h)}px`;
  }

  function close(returnFocus = false) {
    if (active === null) return;
    const prev = anchor;
    active = null;
    anchor = null;
    items.forEach((it) => {
      [it.hot, it.label, it.itemBtn].forEach((b) => { b.classList.remove("is-active"); b.setAttribute("aria-expanded", "false"); });
      it.line.classList.remove("is-active");
      it.li.classList.remove("is-active");
    });
    pop.classList.remove("is-open");
    clearTimeout(hideTimer);
    hideTimer = setTimeout(() => { if (active === null) pop.hidden = true; }, 220);
    if (returnFocus && prev && visible(prev)) prev.focus();
  }

  function open(i, from) {
    if (active === i && anchor === from) { close(); return; }
    clearTimeout(hideTimer);
    active = i;
    const it = items[i];
    // List rows on small screens point the card at the numbered dot.
    anchor = from === it.itemBtn ? it.hot : from;
    items.forEach((o, k) => {
      const on = k === i;
      [o.hot, o.label, o.itemBtn].forEach((b) => { b.classList.toggle("is-active", on); b.setAttribute("aria-expanded", String(on)); });
      o.line.classList.toggle("is-active", on);
      o.li.classList.toggle("is-active", on);
    });
    popTitle.textContent = it.c.title;
    popText.textContent = it.c.text;
    pop.hidden = false;
    pop.classList.remove("is-open");
    if (from === it.itemBtn) {
      const r = stage.getBoundingClientRect();
      if (r.top < 0 || r.bottom > window.innerHeight) {
        stage.scrollIntoView({ block: "center" });
      }
    }
    place();
    void pop.offsetWidth;
    pop.classList.add("is-open");
  }

  items.forEach((it, i) => {
    [it.hot, it.label, it.itemBtn].forEach((b) => b.addEventListener("click", () => open(i, b)));
  });
  // Tapping the card itself also dismisses it (it can cover nearby dots on phones).
  pop.addEventListener("click", () => close());
  document.addEventListener("pointerdown", (e) => {
    if (active === null) return;
    const t = e.target;
    if (pop.contains(t) || t.closest(".inside-hot, .inside-label, .inside-item-btn")) return;
    close();
  });
  document.addEventListener("keydown", (e) => {
    if (e.key === "Escape" && active !== null) close(true);
  });
  window.addEventListener("resize", () => {
    if (active !== null && anchor && !visible(anchor)) close();
    else place();
  });
  window.addEventListener("scroll", place, { passive: true });
}
