# st_cv_website

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.




How to create a web build. Batch script:
Problems: keeps some unwanted files. Manual deleting required!

0. 
flutter build web

# 1. Create a temporary folder and copy the web build there
mkdir temp_web
cp -r build/web/* temp_web/
cd ..
# 2. Switch to orphan branch
git checkout --orphan gh-pages

# 3. Remove all files from the repo (won't affect temp_web)
git rm -rf .

# 4. Copy web build files back into the repo root
cp -r temp_web/* .

# 5. Clean up
rm -rf temp_web

# 6. Commit and push
git add .
git commit -m "Deploy Flutter Web"
git push -f origin gh-pages





# 0. Build web
flutter build web

# 1. Create a clean temp directory outside the repo
cd ..
mkdir flutter_web_publish
cd flutter_web_publish

# 2. Copy only the web build output
cp -r ../st_cv_website/build/web/* .

# 3. Initialize a fresh Git repo and push to gh-pages
git init
git remote add origin https://github.com/tenbuschs/st_cv_website.git
git checkout -b publish_03                          # Change Version!!!!!!
git add .
git commit -m "Deploy Flutter Web Version 03"       # Change Version!!!!!!
git push -f origin publish_03                       # Change Version!!!!!!

# 4. Clean up if desired
cd ..
rm -r flutter_web_publish
