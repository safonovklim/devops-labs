# Lab 1: Work with Git

In this lab, you will learn how to collaborate with team using Git and Github.


## Preparation

### Git CLI

1. Open your terminal
2. Verify that `git` installed by running `git version`. (Output example: `git version 2.39.5 (Apple Git-154)`)

### Github

1. Create Github account (if you don't have it yet) - [link](https://github.com/signup)
2. Generate new SSH key - [link](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
3. Add SSH key to your Github Account - [link](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account)


## Task

### part 1 - cloning

1. Clone repository [safonovklim/devops-labs](https://github.com/safonovklim/devops-labs) - `git@github.com:safonovklim/devops-labs.git`
2. Run `cd ./devops-labs`
3. Remove any git information - `rm -rf .git`
4. Create new github repository in your profile - https://github.com/new
5. Run `git init`
6. Run `git add .`
7. Run `git commit -m "first commit"`
8. Follow instructions from Github in block `…or push an existing repository from the command line`. Example


```
git remote add origin git@github.com:YOUR_GITHUB_USERNAME/YOUR_GITHUB_REPO.git
git branch -M main
git push -u origin main
```

### part 2 - contributing

9. Duplicate `index.html` file with `<your-name>.html` (example: `klim.html`)
10. Open file context in Text Editor / IDE
11. Replace `YOUR_NAME` and `TODAY_DATE` with actual values
12. Save file changes

```
git add “<your-name>.html”
git commit -m ‘feat: added <your-name>.html”
git push —set-upstream origin your-branch-name
```

13. Copy link from the output
14. Open pull request
15. Request review from 1 peer / host (might want to skip it)
16. Merge once approved

### part 3 - pulling recent changes from `main`


17. Run `git fetch`
18. Run `git checkout main`
19. Run `git pull`
20. Find your new file


Done ✅

## Bonus task - Create profile-facing repository (business card)

21. Create repository with name matching your profile username.

For example, if your Github Username is `safonovklim`, then repository name should be `safonovklim`
Example repository: https://github.com/safonovklim/safonovklim

22. Create `README.md` file

23. Using markdown, add information about yourself. Example:

```markdown

John Appleseed

## Who am I

- Software Engineer
- DevOps Enthusiast
- MIT Graduate
- Cat Lover

## My links

- LinkedIn: ....
```

PS: Avoid putting contact information like phone number or email for privacy reasons

24. Commit and push
25. Open your github page and find pinned information
