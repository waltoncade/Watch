// "What's inside" callouts. Edit the copy here.
// x / y are positions on public/images/hero.webp, in percent of the image
// (measured from each part's position on the board). side = where the label sits
// on wide screens; labelY = label height in percent of the image.
// The descriptions are placeholder copy: rewrite them freely.
export const callouts = [
  {
    id: "leds",
    title: "LEDs",
    text: "A ring of 24 lights circles the dial and lights up to show the time at a glance.",
    x: 22.68, y: 22.74, side: "left", labelY: 24,
  },
  {
    id: "color-led",
    title: "Multi-color LED",
    text: "A soft glow of color just below the logo, for notifications and status.",
    x: 50.06, y: 37.19, side: "left", labelY: 44,
  },
  {
    id: "seconds",
    title: "Second hand",
    text: "A slender white hand in the centre, driven by a Japanese quartz movement. It marks the seconds, while the lights show the hours and minutes.",
    x: 50.0, y: 50.03, side: "left", labelY: 55,
  },
  {
    id: "brain",
    title: "The brain",
    text: "Brain of the device, reprogrammable for over the air software updates",
    x: 49.97, y: 66.88, side: "left", labelY: 66,
  },
  {
    id: "motion",
    title: "Motion sensor",
    text: "Senses the movement of your wrist and turns on the lights whenever you look at the dial.",
    x: 71.7, y: 45.84, side: "right", labelY: 36,
  },
  {
    id: "light",
    title: "Light sensor",
    text: "Reads the light around you and sets the brightness to match, so the watch is never glaring in the dark or washed out in the sun.",
    x: 63.9, y: 50.07, side: "right", labelY: 52,
  },
  {
    id: "bluetooth",
    title: "Bluetooth",
    text: "Connects to your phone, for things like setting the time and making the watch your own. More details to come.",
    x: 67.21, y: 66.14, side: "right", labelY: 68,
  },
];
