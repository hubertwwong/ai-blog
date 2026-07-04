# AI Tools Directory

Automated affiliate comparison site. Agent writes content, publishes weekly, and deploys to Cloudflare Pages.

## 🚀 One-Time Setup (you, ~30 min)

### 1. Sign up for affiliate programs
Edit `affiliate-config.json` — each entry has a signup link under `_links`. Sign up, get your ID, replace `YOUR_*` values.

**Priority (highest commission first):**
| Program | Commission | Signup |
|---------|-----------|--------|
| Taskade | 50% lifetime recurring | partners.taskade.com |
| Simplified | 40% recurring | simplified.com/affiliate-program |
| VEED | 30-40% recurring 12mo | veed.io/referral-program |
| Reclaim.AI | 40% recurring 12mo | partnerstack.com (Reclaim) |
| Castmagic | 30% recurring 18mo | partnerstack.com (Castmagic) |
| MeetGeek | 30% recurring | partnerstack.com (MeetGeek) |
| Gamma | 25% first year | partnerstack.com (Gamma) |
| ElevenLabs | 22% recurring 12mo | elevenlabs.io/affiliates-terms |
| Logome.ai | 50% per sale | logome.ai/affiliates |
| ClickUp | $28 CPA | partnerstack.com (ClickUp) |

### 2. Deploy the site
```bash
# Option A: Cloudflare Pages (free, recommended)
# - Go to cloudflare.com, create free account
# - Dashboard → Workers & Pages → Create → Pages → Direct Upload
# - Drag the entire aitools-directory folder
# - Your site is live at your-project.pages.dev

# Option B: CLI deploy (requires API token)
export CLOUDFLARE_API_TOKEN=your_token_here
npm run deploy
```

### 3. First deploy
After your first deploy, the site will be live. Send it to me and I'll configure the cron job to generate content weekly.

## 🤖 Automated Content Pipeline
On cron: agent researches 2 new AI tools per week, writes comparison articles, and updates the site. No human work needed after setup.

## 📁 Project Structure
```
aitools-directory/
├── index.html             # Homepage with tool comparisons
├── css/style.css          # Styles
├── articles/              # Generated review articles
├── affiliate-config.json  # Your affiliate IDs (edit me!)
├── deploy.sh              # Deployment script
├── wrangler.toml          # Cloudflare config
└── package.json           # NPM scripts
```
