PropX — Ready-for-deploy package

How to deploy (quick):
1. Create a new GitHub repo and push these files (or upload directly).
2. Create Render service for backend (Node) and Postgres DB (managed) — copy DATABASE_URL and RENDER_SERVICE_ID.
3. Create a Vercel project for frontend; copy VERCEL_ORG_ID and VERCEL_PROJECT_ID and create a Vercel token.
4. In GitHub repo -> Settings -> Secrets -> Actions add: DATABASE_URL, RENDER_API_KEY, RENDER_SERVICE_ID, VERCEL_TOKEN, VERCEL_ORG_ID, VERCEL_PROJECT_ID, TELEGRAM_BOT_TOKEN (optional).
5. Push to main. GitHub Actions will trigger: Render deploy -> Vercel deploy -> DB seed script creating admin sohrabmir955@gmail.com with temp password printed in Actions logs.
6. After Actions finish, get frontend URL from Vercel dashboard (you can name project `propx` to get `propx.vercel.app` if available).

Notes:
- I cannot deploy for you from here; this package automates deploy once you set secrets and push.
- For MT5 live trades you need an EA or bridge to POST to /webhook/mt5.
