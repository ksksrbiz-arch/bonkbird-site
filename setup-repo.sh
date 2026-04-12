#!/bin/bash
# ─────────────────────────────────────────────────────────────
# bonkbird-site — one-shot GitHub repo setup + Netlify link
# Run this ONCE from inside the bonkbird-site folder
# Requires: git, gh CLI → https://cli.github.com/
# ─────────────────────────────────────────────────────────────
set -e

NETLIFY_SITE_ID="86305146-25bf-4cbf-a23b-841e914276d8"
NETLIFY_SITE_URL="https://bonkbird-site.netlify.app"

echo ""
echo "🐦  bonkbird-site — GitHub + Netlify setup"
echo "────────────────────────────────────────────"

# 1. Init git
echo "→ Initializing git repo..."
git init
git add .
git commit -m "🐦 initial commit — the bird is live"

# 2. Create GitHub repo and push
echo "→ Creating GitHub repo and pushing..."
gh repo create bonkbird-site \
  --public \
  --source=. \
  --remote=origin \
  --push \
  --description "A bird has been slamming its face into a kitchen window for 8+ days. We put it on the internet. 24/7 livestream."

GH_USER=$(gh api user --jq .login)
GH_REPO_URL="https://github.com/${GH_USER}/bonkbird-site"

echo ""
echo "✅ GitHub repo created: ${GH_REPO_URL}"
echo ""

# 3. Link Netlify site to GitHub repo via Netlify CLI
echo "→ Linking to Netlify site (site ID: ${NETLIFY_SITE_ID})..."
if command -v netlify &> /dev/null; then
  netlify link --id "$NETLIFY_SITE_ID"
  echo ""
  echo "→ Setting up GitHub continuous deployment..."
  # Open the Netlify dashboard to complete GitHub connection
  echo ""
  echo "┌─────────────────────────────────────────────────────────┐"
  echo "│  FINAL STEP: Connect GitHub in Netlify dashboard        │"
  echo "│                                                         │"
  echo "│  1. Open: https://app.netlify.com/projects/bonkbird-site│"
  echo "│  2. Site configuration → Build & deploy → Link repo     │"
  echo "│  3. Select GitHub → ${GH_USER}/bonkbird-site            │"
  echo "│  4. Branch: main | Build cmd: (blank) | Publish dir: .  │"
  echo "│  5. Save → every git push auto-deploys ✅               │"
  echo "└─────────────────────────────────────────────────────────┘"
else
  echo ""
  echo "┌─────────────────────────────────────────────────────────┐"
  echo "│  FINAL STEP: Connect GitHub in Netlify dashboard        │"
  echo "│                                                         │"
  echo "│  1. Open: https://app.netlify.com/projects/bonkbird-site│"
  echo "│  2. Site configuration → Build & deploy → Link repo     │"
  echo "│  3. Select GitHub → ${GH_USER}/bonkbird-site            │"
  echo "│  4. Branch: main | Build cmd: (blank) | Publish dir: .  │"
  echo "│  5. Save → every git push auto-deploys ✅               │"
  echo "└─────────────────────────────────────────────────────────┘"
fi

echo ""
echo "🐦  Done! Your repo: ${GH_REPO_URL}"
echo "    Your site: ${NETLIFY_SITE_URL}"
echo ""
echo "    Future deploys: git add . && git commit -m 'update' && git push"
echo ""
