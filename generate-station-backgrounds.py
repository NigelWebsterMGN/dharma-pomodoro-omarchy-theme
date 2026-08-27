#!/usr/bin/env python3
import subprocess
from pathlib import Path


ROOT = Path(__file__).resolve().parent
SOURCE_LOGOS = ROOT / "assets" / "source-logos"
STATIONS = [
    ("MAIN", "DHARMA Initiative", "main"),
    ("SWAN", "The Swan", "swan"),
    ("ARROW", "The Arrow", "arrow"),
    ("STAFF", "The Staff", "staff"),
    ("PEARL", "The Pearl", "pearl"),
    ("HYDRA", "The Hydra", "hydra"),
    ("FLAME", "The Flame", "flame"),
    ("ORCHID", "The Orchid", "orchid"),
    ("LOOKING_GLASS", "The Looking Glass", "looking-glass"),
    ("TEMPEST", "The Tempest", "tempest"),
    ("LAMP_POST", "The Lamp Post", "lamp-post"),
    ("DOOR", "The Door", "door"),
]
SOURCE_FILES = {
    "MAIN": "Main.png",
    "SWAN": "TheSwan.png",
    "ARROW": "TheArrow.png",
    "STAFF": "TheStaff.png",
    "PEARL": "ThePearl.png",
    "HYDRA": "TheHydra.png",
    "FLAME": "TheFlame.png",
    "ORCHID": "TheOrchid.png",
    "LOOKING_GLASS": "TheLookingGlass.png",
    "TEMPEST": "TheTempest.png",
    "LAMP_POST": "TheLampPost.png",
}


def mark(station, fg, bg):
    if station == "MAIN":
        return ""
    if station == "ARROW":
        return f'<path d="M512 302 L390 456 H470 V705 H554 V456 H634 Z" fill="{fg}"/>'
    if station == "STAFF":
        return f'<path d="M512 300 V724 M512 438 C410 352 352 492 458 542 M512 438 C614 352 672 492 566 542" fill="none" stroke="{fg}" stroke-width="44" stroke-linecap="round"/>'
    if station == "PEARL":
        return f'<circle cx="512" cy="512" r="178" fill="{fg}"/><circle cx="455" cy="455" r="46" fill="{bg}"/>'
    if station == "HYDRA":
        heads = "".join(
            f'<path d="M512 646 C{370 + i * 56} 545 {380 + i * 42} 386 {450 + i * 28} 342" fill="none" stroke="{fg}" stroke-width="28" stroke-linecap="round"/>'
            for i in range(5)
        )
        return heads + f'<path d="M400 690 H624" stroke="{fg}" stroke-width="44" stroke-linecap="round"/>'
    if station == "FLAME":
        return f'<path d="M512 292 C660 462 560 522 628 720 C450 652 370 522 512 292 Z" fill="{fg}"/><path d="M510 468 C570 560 506 596 535 676 C450 628 430 560 510 468 Z" fill="{bg}"/>'
    if station == "ORCHID":
        petals = "".join(
            f'<ellipse cx="512" cy="512" rx="56" ry="126" fill="{fg}" transform="rotate({angle} 512 512) translate(0 -88)"/>'
            for angle in (0, 72, 144, 216, 288)
        )
        return petals + f'<circle cx="512" cy="512" r="42" fill="{bg}"/>'
    if station == "LOOKING_GLASS":
        return f'<ellipse cx="512" cy="552" rx="150" ry="126" fill="none" stroke="{fg}" stroke-width="42"/><path d="M450 455 L392 300 M574 455 L632 300" stroke="{fg}" stroke-width="42" stroke-linecap="round"/>'
    if station == "TEMPEST":
        return f'<path d="M330 548 C430 340 648 400 596 532 C560 624 690 614 724 510" fill="none" stroke="{fg}" stroke-width="54" stroke-linecap="round"/><path d="M696 476 C596 684 378 624 430 492 C466 400 336 410 302 514" fill="none" stroke="{fg}" stroke-width="54" stroke-linecap="round"/>'
    if station == "LAMP_POST":
        return f'<path d="M512 300 V704 M400 704 H624 M394 408 C430 310 594 310 630 408" fill="none" stroke="{fg}" stroke-width="44" stroke-linecap="round"/>'
    if station == "DOOR":
        return f'<rect x="405" y="396" width="214" height="232" rx="8" fill="none" stroke="{fg}" stroke-width="44"/><path d="M330 512 H694" stroke="{fg}" stroke-width="44" stroke-linecap="round"/>'
    return f'<path d="M360 585 C420 438 550 412 650 470 C585 492 548 552 470 590 C420 614 382 608 360 585 Z" fill="{fg}"/><path d="M500 432 C530 346 598 308 660 292 C610 330 592 402 624 462" fill="none" stroke="{fg}" stroke-width="42" stroke-linecap="round"/>'


def svg(station, label, dark):
    bg = "#000000" if dark else "#ffffff"
    fg = "#ffffff" if dark else "#000000"
    muted = "#b9b09a" if dark else "#5f584b"
    return f'''<svg xmlns="http://www.w3.org/2000/svg" width="2560" height="1440" viewBox="0 0 2560 1440">
  <rect width="2560" height="1440" fill="{bg}"/>
  <g transform="translate(1280 650) scale(1.05)">
    <polygon points="0,-470 332,-332 470,0 332,332 0,470 -332,332 -470,0 -332,-332" fill="none" stroke="{fg}" stroke-width="28"/>
    <circle r="260" fill="{bg}" stroke="{fg}" stroke-width="24"/>
    <rect x="-312" y="-68" width="624" height="136" fill="{bg}" stroke="{fg}" stroke-width="18"/>
    <text x="0" y="34" text-anchor="middle" font-family="Arial Black, Helvetica, sans-serif" font-size="82" fill="{fg}" letter-spacing="10">DHARMA</text>
    <g transform="translate(-512 -512)">{mark(station, fg, bg)}</g>
  </g>
  <text x="1280" y="1248" text-anchor="middle" font-family="iA Writer Mono S, monospace" font-size="44" fill="{fg}">{label.upper()}</text>
  <text x="1280" y="1312" text-anchor="middle" font-family="iA Writer Mono S, monospace" font-size="26" fill="{muted}">4 8 15 16 23 42</text>
</svg>
'''


def main():
    for theme_name, dark in (("theme", True), ("theme-light", False)):
        backgrounds = ROOT / theme_name / "backgrounds"
        backgrounds.mkdir(parents=True, exist_ok=True)
        for station, label, slug in STATIONS:
            png_path = backgrounds / f"station-{slug}.png"
            source_name = SOURCE_FILES.get(station)
            source = SOURCE_LOGOS / source_name if source_name else None
            if source and source.exists():
                write_source_background(source, backgrounds, slug, dark)
            else:
                svg_path = backgrounds / f"station-{slug}.svg"
                svg_path.write_text(svg(station, label, dark))
                subprocess.run(["magick", str(svg_path), str(png_path)], check=True)
        default = backgrounds / "station-swan.png"
        if default.exists():
            (backgrounds / "01-swan-station.png").write_bytes(default.read_bytes())


def write_source_background(source, backgrounds, slug, dark):
    bg = "#000000" if dark else "#ffffff"
    fg = "#ffffff" if dark else "#000000"
    muted = "#b9b09a" if dark else "#5f584b"
    logo = backgrounds / f"station-{slug}-logo.png"
    mask = backgrounds / f"station-{slug}-mask.png"
    png = backgrounds / f"station-{slug}.png"
    subprocess.run([
        "magick",
        str(source),
        "-alpha",
        "remove",
        "-resize",
        "980x980",
        "-colorspace",
        "Gray",
        "-negate",
        "-level",
        "8%,82%",
        str(mask),
    ], check=True)
    subprocess.run([
        "magick",
        str(mask),
        "-alpha",
        "off",
        "-fill",
        fg,
        "-colorize",
        "100",
        str(mask),
        "-compose",
        "CopyOpacity",
        "-composite",
        str(logo),
    ], check=True)
    mask.unlink(missing_ok=True)
    subprocess.run([
        "magick",
        "-size",
        "2560x1440",
        f"xc:{bg}",
        str(logo),
        "-gravity",
        "center",
        "-geometry",
        "+0-72",
        "-composite",
        "-fill",
        fg,
        "-font",
        "iA-Writer-Mono-S-Regular",
        "-pointsize",
        "44",
        "-gravity",
        "south",
        "-annotate",
        "+0+176",
        next(label for _station, label, station_slug in STATIONS if station_slug == slug).upper(),
        "-fill",
        muted,
        "-pointsize",
        "26",
        "-annotate",
        "+0+112",
        "4 8 15 16 23 42",
        str(png),
    ], check=True)


if __name__ == "__main__":
    main()
