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

```bash
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
mkdocs serve          # live preview at http://127.0.0.1:8000
mkdocs build --strict # what CI should run; fails on broken links/nav
```

## Deployment

The site is meant to be built and published by GitHub Actions to GitHub Pages
(`https://educelab.github.io/educelab-docs/`). A workflow only needs to:

1. Check out the repo and set up Python.
2. `pip install -r requirements.txt`
3. `mkdocs build --strict` (outputs to `site/`)
4. Upload `site/` as the Pages artifact and deploy it.
