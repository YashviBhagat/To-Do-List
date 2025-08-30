# Deploying to Render

## Prerequisites
1. A Render account (free at render.com)
2. Your code pushed to a Git repository (GitHub, GitLab, etc.)

## Steps to Deploy

### 1. Push your code to GitHub
```bash
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin <your-github-repo-url>
git push -u origin main
```

### 2. Create a new Web Service on Render
1. Go to [render.com](https://render.com) and sign up/login
2. Click "New +" and select "Web Service"
3. Connect your GitHub repository
4. Choose the repository with your Django app

### 3. Configure the Web Service
- **Name**: `todo-list-app` (or any name you prefer)
- **Environment**: `Python 3`
- **Build Command**: `./build.sh`
- **Start Command**: `gunicorn todo_list.wsgi:application`
- **Plan**: `Free` (for testing)

### 4. Add Environment Variables
Add these environment variables in Render:
- `SECRET_KEY`: Generate a new secret key
- `DATABASE_URL`: Render will provide this automatically if you create a PostgreSQL database

### 5. Create a PostgreSQL Database (Optional but Recommended)
1. In Render dashboard, click "New +" → "PostgreSQL"
2. Choose a name and plan
3. Copy the `DATABASE_URL` and add it as an environment variable to your web service

### 6. Deploy
Click "Create Web Service" and wait for the build to complete.

## Important Notes
- The free tier has limitations but is great for testing
- Your app will sleep after 15 minutes of inactivity on the free tier
- The first request after sleeping will take longer to respond

## Troubleshooting
- Check the build logs if deployment fails
- Ensure all files are committed to your repository
- Verify environment variables are set correctly 