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

1. Clone repository [safonovklim/labs](https://github.com/safonovklim/devops-labs) - `git@github.com:safonovklim/devops-labs.git`
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