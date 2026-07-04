#!/usr/bin/env bash
# deploy.sh — Deploy to Cloudflare Pages
# Prerequisites:
#   1. Create a Cloudflare account (free at cloudflare.com)
#   2. Create an API token with "Cloudflare Pages: Edit" permission
#   3. Set CLOUDFLARE_API_TOKEN env var or pass as arg
#
# Usage:
#   CLOUDFLARE_API_TOKEN=xxx ./deploy.sh
#   ./deploy.sh my-api-token
#   npx wrangler pages deploy . --project-name aitools-directory

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR"

TOKEN="${1:-$CLOUDFLARE_API_TOKEN}"
ACCOUNT_ID="${CLOUDFLARE_ACCOUNT_ID}"

if [ -n "$TOKEN" ]; then
  echo "🚀 Deploying to Cloudflare Pages..."
  
  # Try creating the project first (ignores "already exists" error)
  npx --yes wrangler pages project create aitools-directory --production-branch main 2>/dev/null || true
  
  # Deploy the site
  npx wrangler pages deploy . --project-name aitools-directory
  
  echo "✅ Deployed! Visit: https://aitools-directory.pages.dev"
else
  echo "⚠️  No Cloudflare API token found."
  echo ""
  echo "To deploy manually:"
  echo "  1. Go to https://dash.cloudflare.com/"
  echo "  2. Navigate to Workers & Pages → Create → Pages → Direct Upload"
  echo "  3. Drag the project folder onto the upload area"
  echo ""
  echo "Or get started with:"
  echo "  CLOUDFLARE_API_TOKEN=xxx $0"
  echo ""
  echo "To create a token: Cloudflare Dashboard → My Profile → API Tokens → Create Token"
  echo "Use the 'Cloudflare Pages: Edit' template."
fi
