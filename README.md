# 🐦 bonkbird-site

> A bird has been slamming its head into a kitchen window in Canby, Oregon for over a week. We put it on the internet.

Live at: [bonkbird.live](https://bonkbird.live)

## Stack

- Pure HTML/CSS/JS — zero build step
- Hosted on Netlify (free tier)
- Stream via Owncast on Oracle Cloud Free Tier (RTMP → HLS)
- Camera: old Android phone running RTMP Streamer

## Deploy

Just push to `main`. Netlify auto-deploys on every commit.

## Swap the stream

Find the `<!-- STREAM EMBED -->` comment block in `index.html` and replace the placeholder `<div>` with your embed:

**Owncast (recommended):**
```html
<iframe src="https://your-oracle-server.com/embed/video"
  width="100%" height="100%" frameborder="0"
  allow="autoplay" allowfullscreen></iframe>
```

**YouTube Live:**
```html
<iframe src="https://www.youtube.com/embed/VIDEO_ID?autoplay=1&mute=1"
  width="100%" height="100%" frameborder="0"
  allow="autoplay; encrypted-media" allowfullscreen></iframe>
```

## Part of

[TH3 SIGNAL](https://signal01.netlify.app) — the 1Commerce solo founder build log.
