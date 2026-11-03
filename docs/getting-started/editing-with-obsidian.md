---
title: Edit with Obsidian
tags: [how-to]
owner: Docs maintainer
last_reviewed: 2026-11-03
---
# Edit these docs with Obsidian

[Obsidian](https://obsidian.md/) is a free note-taking app that edits Markdown
files, which is what these docs are made of. With its community **Git** plugin,
you can edit pages and send your changes to GitHub without using the command
line.

This guide is for people who haven't used Git before. If you're comfortable
with Git, you can skip Obsidian and follow [Contributing](../contributing.md)
with your usual editor.

## How it works

The docs live in a GitHub repository. You keep a copy of it on your
computer, and Obsidian opens the `docs/` folder inside it as a **vault**. A
vault is Obsidian's name for a folder of notes.

When you edit a page, you change your copy only. To share the change, you
**commit** it, which saves a snapshot with a short message, and then **sync**
it, which sends your commits to GitHub and pulls in everyone else's. The Git
plugin does both with one command, called **commit-and-sync**. You make your
changes on a branch of your own and then open a pull request, so someone can
check the change before it reaches the website. [Make a
change](#make-a-change) walks you through it.

## Before you start

You need:

- A GitHub account with write access to
  [educelab/educelab-docs](https://github.com/educelab/educelab-docs).
- Git installed on your computer. On a Mac, open Terminal and run
  `git --version`. If Git isn't installed, macOS offers to install it for you.
- [Obsidian](https://obsidian.md/download), version 1.15 or newer.

## Get a copy of the docs

You only do this once per computer. It takes two parts: first you give GitHub
an **SSH key**, which lets your computer sign in to GitHub without a password.
Then you download the docs.

These steps are for a Mac. Run each command in Terminal by pasting it in and
pressing Return.

### Add an SSH key to GitHub

1. Check whether you already have a key:

    ```bash
    ls ~/.ssh/id_ed25519.pub
    ```

    If this prints a file path, you already have a key. Skip to step 3. If it
    says `No such file or directory`, keep going.

2. Make a new key. Replace the email with the one on your GitHub account:

    ```bash
    ssh-keygen -t ed25519 -C "you@example.com"
    ```

    It asks three questions. Press Return for each one without typing
    anything. This saves the key in the default place with no passphrase,
    so Obsidian can use it without asking you for anything.

3. Copy your public key to the clipboard:

    ```bash
    pbcopy < ~/.ssh/id_ed25519.pub
    ```

4. On GitHub, open your profile picture menu, then go to
   **Settings > SSH and GPG keys** and select **New SSH key**.
5. For **Title**, enter something that names this computer, like
   `Work MacBook`. Leave **Key type** as **Authentication Key**. Paste into
   **Key**, then select **Add SSH key**.
6. Back in Terminal, check that it works:

    ```bash
    ssh -T git@github.com
    ```

    The first time, it asks `Are you sure you want to continue connecting?`.
    Type `yes` and press Return. You should see
    `Hi <your username>! You've successfully authenticated`.

    !!! note
        Don't skip this step. Obsidian can't answer the
        `continue connecting?` question for you, so syncing fails until you've
        answered it once here.

For more detail, see GitHub's guide to
[connecting with SSH](https://docs.github.com/en/authentication/connecting-to-github-with-ssh).

### Download the docs

1. Go to the folder where you want to keep the docs, for example your
   `Documents` folder:

    ```bash
    cd ~/Documents
    ```

2. Clone the repository:

    ```bash
    git clone git@github.com:educelab/educelab-docs.git
    ```

    This makes an `educelab-docs` folder inside `Documents`.

## Open the docs in Obsidian

1. Open Obsidian and choose **Open folder as vault**.
2. The docs are within the `docs` folder inside `educelab-docs`. You may want to pick the `docs` folder directly.
The sidebar shows the same sections as the website.

![The docs vault open in Obsidian, with the computing, getting-started,
imaging-rigs and lighting folders in the sidebar](../assets/obsidian/vault-open.webp)

## Install the Git plugin

1. Open **Settings** (the gear icon at the bottom left), then
   **Community plugins**.
2. If **Restricted mode** is on, turn it off. Obsidian blocks all community
   plugins until you do.
3. Next to **Community plugins**, select **Browse**.
4. Search for `git` and select the plugin named **Git** by Vinzent.

    ![Searching the community plugins for "git". The first result is Git by
    Vinzent.](../assets/obsidian/browse-git-plugin.png)

5. Select **Install**, then **Enable**.

Back in **Community plugins**, Git is listed under **Installed plugins** with
its toggle on.

![The Community plugins settings, with the Git plugin installed and
enabled](../assets/obsidian/git-plugin-enabled.png)

## Set up the Git plugin

1. In **Settings**, scroll the left sidebar down to **Community plugins** and
   select **Git**.
2. Under **Pull**:
    - Leave **Merge strategy** set to **Merge**.
    - Turn on **Pull on startup**. You then start each session with
      everyone else's latest changes.
3. Under **Commit-and-sync**, turn on:
    - **Push on commit-and-sync**
    - **Pull on commit-and-sync**
    - **Squash commits before push**. If you commit several times before
      syncing, your commits go to GitHub as one, which keeps the history
      tidy.

![The Git plugin's Sync settings, with Merge strategy set to Merge, and Pull
on startup, Push on commit-and-sync, Pull on commit-and-sync and Squash
commits before push turned on](../assets/obsidian/git-sync-settings.png)

### Optional: sync automatically on a timer

The plugin can run commit-and-sync for you every few minutes. It's off by
default, and you can choose whether to use it.

To turn it on, set **Auto commit-and-sync interval (minutes)** to a number
above 0, for example `10`. To turn it back off, set it to `0`. If you turn it
on, consider also turning on **Auto commit-and-sync after stopping file
edits**. It waits until you've stopped typing, so it doesn't sync in the
middle of a sentence.

**Why you might turn it on:**

- You can't forget to sync. Your work reaches GitHub even if you close your
  laptop without thinking about it.
- Your work is backed up on GitHub as you go.

**Why you might leave it off:**

- It sends half-finished edits to your branch on GitHub. They don't reach the
  website until your pull request is merged, but anyone looking at the pull
  request sees them.
- Every automatic commit uses the same generic message, so the history
  doesn't say what changed or why.
- A sync can start while you're in the middle of something, and if it hits a
  conflict, you have to deal with it right then.

If you're not sure, leave it off and run commit-and-sync yourself when you
finish a change.

### Make links work on the website

Obsidian's default link style doesn't work on the published site. In
**Settings > Files and links**:

- Turn off **Use [[Wikilinks]]**.
- Set **New link format** to **Relative path to file**.
- Set **Default location for new attachments** to **In subfolder under
  current folder**, and set **Subfolder name** to `assets`. Images you paste
  into a page are then saved in an `assets` folder next to that page.

## Make a change

Every change goes through a **pull request**. You make your edits on a
**branch**, which is a separate copy of the docs that only you are working on.
When you're done, you ask for the branch to be merged into `main`, the copy
the website is built from. That request is the pull request. It lets someone
look over the change before it goes live.

The steps are:

1. [Start a branch](#start-a-branch).
2. [Edit pages](#edit-a-page).
3. [Send your changes](#send-your-changes) to GitHub.
4. [Open a pull request](#open-a-pull-request).
5. [Go back to `main`](#after-your-pull-request-is-merged) once it's merged.

### Start a branch

Do this before you edit anything.

1. Look at the bottom right of the Obsidian window. The status bar shows the
   branch you're on. It should say `main`. If it doesn't, see
   [After your pull request is merged](#after-your-pull-request-is-merged)
   first.
2. Open the command palette (Cmd+P) and run **Git: Pull**, so you start from
   the latest version of the docs.
3. Open the command palette again and run **Git: Create new branch**.
4. Type a short name for your change, using lowercase letters and dashes, for
   example `misha-led-serials`. Press Return.

The status bar now shows your branch name instead of `main`.

### Edit a page

Select a page in the sidebar and start typing. Obsidian saves as you go.

![The Asahi Linux install page open for editing in
Obsidian](../assets/obsidian/editing-a-page.webp)

Keep these in mind:

- **Front matter** shows up as **Properties** at the top of the page. When you
  check that a page is still correct, update **last_reviewed**.
- **Notes and warnings** (lines starting with `!!!`) look like plain text in
  Obsidian, but they show as colored boxes on the website.
- **New pages** need a front matter block. Copy one from another page, and see
  [Contributing](../contributing.md) for where pages go.

### Send your changes

You can do this as often as you like while you work. Each time, your branch on
GitHub catches up with your copy.

1. Open the Git panel by selecting **Open Git source control** in the left
   ribbon. Under **Changes**, it lists every file you've edited.
2. In the message box at the top, replace `vault backup: {{date}}` with a
   short description of what you changed, for example
   `Fix MISHA LED serial numbers`.
3. Select **Commit-and-sync**, the first button in the row at the top of the
   panel (a circle with an arrow pointing up). You can also open the command
   palette (Cmd+P) and run **Git: Commit-and-sync**.

![The Git source control panel on the right, listing changed files under
Changes](../assets/obsidian/source-control-panel.webp)

The first time you sync a new branch, the plugin may ask you to set an
upstream branch. Choose `origin` and keep the suggested branch name.

When the list under **Changes** is empty, your changes are on GitHub, on your
branch. They aren't on the website yet.

### Open a pull request

1. Go to [educelab/educelab-docs](https://github.com/educelab/educelab-docs)
   on GitHub. A yellow banner near the top says your branch had recent
   pushes.
2. Select **Compare & pull request**. If the banner isn't there, select the
   branch menu (it says `main`), pick your branch, then select
   **Contribute > Open pull request**.
3. Give the pull request a title, and in the description say what you changed
   and why.
4. Select **Create pull request**.

Anyone with write access to the repository can review and merge your pull
request.

### After your pull request is merged

Once the pull request is merged, the website updates a few minutes later.
Then switch back to `main` before you start anything new:

1. Open the command palette (Cmd+P) and run **Git: Switch branch**. Pick
   `main`.
2. Run **Git: Pull** to get the merged change.
3. Optional: run **Git: Delete branch** and pick your old branch to tidy up.

!!! warning
    If you skip this, your next edits land on the old branch, which is already
    merged. Always check that the status bar says `main` before you
    [start a branch](#start-a-branch).

## Troubleshooting

### Sync fails with `Permission denied (publickey)` or `Host key verification failed`

GitHub doesn't recognize your computer. In Terminal, run:

```bash
ssh -T git@github.com
```

If it doesn't say `You've successfully authenticated`, redo the
[SSH key steps](#add-an-ssh-key-to-github).

### Your pull request says "This branch has conflicts"

Someone else changed the same lines as you, and their change was merged
first. If the conflict is small, select **Resolve conflicts** on the pull
request page. GitHub shows both versions between lines like `<<<<<<<` and
`>>>>>>>`. Keep the text you want, delete the marker lines, and select
**Mark as resolved**, then **Commit merge**. If you're not sure which version
to keep, ask the docs maintainer.

### Your edits ended up on an old branch

You forgot to [switch back to `main`](#after-your-pull-request-is-merged)
after your last pull request was merged.

- **If you haven't synced the new edits yet,** run **Git: Create new branch**
  now. Your edits come with you onto the new branch. Then carry on as usual.
- **If you already synced them,** ask the docs maintainer for help moving
  them.
