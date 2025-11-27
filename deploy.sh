#!/bin/bash

# eBUS Demo - GitHub Pages Deploy Script
# Usage: ./deploy.sh

set -e  # Exit on error

echo "🚀 eBUS Demo - GitHub Pages Deploy"
echo "===================================="
echo ""

# Check if we're in the right directory
if [ ! -f "index.html" ]; then
    echo "❌ Error: index.html not found. Are you in the ebus-demo directory?"
    exit 1
fi

# Check if git remote exists
if ! git remote | grep -q origin; then
    echo "📝 Adding GitHub remote..."
    read -p "Enter your GitHub username [sutipeter]: " github_user
    github_user=${github_user:-sutipeter}
    git remote add origin https://github.com/$github_user/ebus-demo.git
    echo "✅ Remote added: https://github.com/$github_user/ebus-demo.git"
else
    echo "✅ Git remote already configured"
fi

# Rename branch to main if needed
current_branch=$(git branch --show-current)
if [ "$current_branch" != "main" ]; then
    echo "📝 Renaming branch to 'main'..."
    git branch -M main
fi

# Push to GitHub
echo ""
echo "📤 Pushing to GitHub..."
git push -u origin main

echo ""
echo "✅ Deploy complete!"
echo ""
echo "📋 Next steps:"
echo "1. Go to: https://github.com/sutipeter/ebus-demo/settings/pages"
echo "2. Set Source to: Deploy from a branch"
echo "3. Set Branch to: main (root folder)"
echo "4. Click Save"
echo ""
echo "⏰ Wait 2-5 minutes, then visit:"
echo "🌐 https://sutipeter.github.io/ebus-demo/"
echo ""
