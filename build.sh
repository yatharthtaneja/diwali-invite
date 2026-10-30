#!/bin/sh
# Builds the standalone index.html (with link-preview tags) from page.html
cd "$(dirname "$0")"
IMG="https://raw.githubusercontent.com/yatharthtaneja/diwali-invite/main/preview.jpg?v=coral"
{
printf '<!doctype html>\n<html lang="en">\n<head>\n<meta charset="utf-8">\n<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">\n<meta name="theme-color" content="#140806">\n'
cat <<META
<meta name="description" content="Lights up. Cards out. Glasses full. Cards, drinks and golden lights on Fri, 6 Nov at Sushant Lok 3, Gurugram. BYOB.">
<meta property="og:type" content="website">
<meta property="og:title" content="Diwali Night · Fri, 6 Nov">
<meta property="og:description" content="Lights up. Cards out. Glasses full. Cards, drinks and golden lights at Sushant Lok 3, Gurugram. BYOB. Tap to RSVP.">
<meta property="og:image" content="$IMG">
<meta property="og:image:secure_url" content="$IMG">
<meta property="og:image:type" content="image/jpeg">
<meta property="og:image:width" content="1200">
<meta property="og:image:height" content="630">
<meta property="og:image:alt" content="Diwali Night invite: three aces under a marigold garland">
<meta name="twitter:card" content="summary_large_image">
<meta name="twitter:image" content="$IMG">
META
sed -n '1,/<\/style>/p' page.html
printf '</head>\n<body>\n'
sed '1,/<\/style>/d' page.html
printf '</body>\n</html>\n'
} > index.html
mkdir -p deploy && cp index.html preview.jpg deploy/
