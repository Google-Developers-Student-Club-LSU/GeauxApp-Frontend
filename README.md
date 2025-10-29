# Geaux_App_Frontend

Google Development Student Club Project

URL: https://github.com/Google-Developers-Student-Club-LSU/GeauxApp-Frontend

## Getting Started (Contributers)

This project is a starting point for a Flutter application. Download Git.

1. To get started clone the repo. 
    - git clone https://github.com/Google-Developers-Student-Club-LSU/GeauxApp-Frontend
    - cd GeauxApp-Frontend

2. Create a branch **Always create a branch for each task assign to you
    - git checkout main
    - git pull origin main
    - git checkout -b feature/name-of-your-branch (**Only for creating a new branch)
    - (Going back to old branch for more changes **always do this if your going back to old branch)
        - git checkout feature/name-of-your-branch (**If branch is already create and going back to make changes, skip step 1 if you already made a branch)
        - git rebase main
        feature/name-of-your-branch -> Type/Short-Description <br>
        Type:
        - feature/    (new edits)
        - fix/    (minor fix)
        - bug/    (similar to fix)
        - hotfix/    (major fix)
        - docs/     (doc changes Ex. Readme.md)
        - refactor/    (code cleanup/imporvements)

        Separator -> / (Always have a forward slash) <br>
        Short-Description -> Name of the branch

3. Make changes (Edits in VScode)
    - Go to VScode and make edits
    - F5 (run the emulator)
        - or bottom right there a button call 'no device' 
        - top center will be shown after either or. Click andriod option
    - flutter run (terminal command to run app on emulator)
    - r (in terminal to update UI)
    - s (in terminal to take a screen shot of UI)

4. Commiting the change
    - git add .
    - git commit -m "Description of the feature/fix" (If you have not finish working and want to come back later on, it is best to have WIP added in your description -> "WIP:Description of the feature/fix")
    - git push -u origin feature/name-of-your-branch (**Only if creating the branch the first time)
    - git push -f origin feature/name-of-your-branch (**Only if the branch already exist and just making changes/updates in the branch)

5. Pull request (Only due this in Github if your new to Git PLEASE)
    - Pull Request Tab around the top (header section on github)
    - New (green button)
    - base:dev <- compare:branch-name (always keep this format, this basically ask permission to allow your branch to be merge together with a dev branch)
    - create pull request (green button)
    - **IMPORTANT dont click anything that has the says MERGE, only project manager allow to touch it**

6. If a task is assign to you
    - cd GeauxApp-Frontend
    - repeat step 2-5

7. If this is to confusing or you don't get it, download Github Desktop and watch https://www.youtube.com/watch?v=8Dd7KRpKeaE (PLEASE WATCH THE WHOLE THING BEFORE WORKING, dont watch while working at the same time)


## Flutter Material
A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
