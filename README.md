# EduceLab Docs

Source for the EduceLab documentation site, built with [MkDocs](https://www.mkdocs.org/)
and the [Material](https://squidfunk.github.io/mkdocs-material/) theme.

## Layout

```
mkdocs.yml          # Site config and navigation
requirements.txt    # Pinned build dependencies (used locally and in CI)
docs/               # Markdown sources; everything here becomes the site
  index.md
  assets/           # Images and other static files
```

## Local development

The quick way is `./preview.sh`, which creates the venv, installs
requirements (only when `requirements.txt` changes), and runs `mkdocs serve`.
To do it by hand:

```bash
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
python -m mkdocs serve          # live preview at http://127.0.0.1:8000/educelab-docs/
python -m mkdocs build --strict # what CI runs; fails on broken links/nav
```

Use `python -m mkdocs` rather than plain `mkdocs`, so it always runs the copy
inside the activated venv rather than a global install that lacks the Material theme.

## Deployment

The site is meant to be built and published by GitHub Actions to GitHub Pages
(`https://educelab.github.io/educelab-docs/`). A workflow only needs to:

1. Check out the repo and set up Python.
2. `pip install -r requirements.txt`
3. `mkdocs build --strict` (outputs to `site/`)
4. Upload `site/` as the Pages artifact and deploy it.
